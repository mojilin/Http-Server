#include <stdint.h>
#include <getopt.h>
#include <signal.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include "util.h"
#include "timer.h"
#include "http.h"
#include "epoll.h"
#include "threadpool.h"

#define CONF "zaver.conf"
#define PROGRAM_VERSION "0.1"

extern struct epoll_event *events;

int main(int argc, char* argv[]) {
    int rc;
    char *conf_file = "";

    if (argc != 2) {
        printf("server config file Specify config file ./server.conf.\n");
        return 0;
    }
    conf_file = argv[1];
    char conf_buf[BUFLEN];
    zv_conf_t cf;

    FILE *fp = fopen(conf_file, "r");
    if (!fp) {
        printf("cannot open config file: %s", conf_file);
        return -1;
    }

    int pos = 0;
    char *delim_pos;
    int line_len;
    char *cur_pos = conf_buf+pos;

    while (fgets(cur_pos, BUFLEN-pos, fp)) {
        delim_pos = strstr(cur_pos, DELIM);
        line_len = strlen(cur_pos);
        if (!delim_pos){
            return -1;
        }
        if (cur_pos[strlen(cur_pos) - 1] == '\n') {
            cur_pos[strlen(cur_pos) - 1] = '\0';
        }

        if (strncmp("root", cur_pos, 4) == 0) {
            cf.root = delim_pos + 1;
        }

        if (strncmp("port", cur_pos, 4) == 0) {
            cf.port = atoi(delim_pos + 1);     
        }

        if (strncmp("threadnum", cur_pos, 9) == 0) {
            cf.thread_num = atoi(delim_pos + 1);
        }

        cur_pos += line_len;
    }
    fclose(fp);
    /*
    *   install signal handle for SIGPIPE
    *   when a fd is closed by remote, writing to this fd will cause system send
    *   SIGPIPE to this process, which exit the program
    */
    struct sigaction sa;
    memset(&sa, '\0', sizeof(sa));
    sa.sa_handler = SIG_IGN;
    sa.sa_flags = 0;
    if (sigaction(SIGPIPE, &sa, NULL)) {
        log_err("install sigal handler for SIGPIPE failed");
        return 0;
    }

    /*
    * initialize listening socket
    */
    int listenfd;
    struct sockaddr_in clientaddr;
    // initialize clientaddr and inlen to solve "accept Invalid argument" bug
    socklen_t inlen = 1;
    memset(&clientaddr, 0, sizeof(struct sockaddr_in));  
    
    listenfd = open_listenfd(cf.port);
    rc = make_socket_non_blocking(listenfd);
    check(rc == 0, "make_socket_non_blocking");

    /*
    * create epoll and add listenfd to ep
    */
    int epfd = zv_epoll_create(0);
    struct epoll_event event;
    
    zv_http_request_t *request = (zv_http_request_t *)malloc(sizeof(zv_http_request_t));
    zv_init_request_t(request, listenfd, epfd, &cf);

    event.data.ptr = (void *)request;
    event.events = EPOLLIN | EPOLLET;
    zv_epoll_add(epfd, listenfd, &event);

    /*
    * create thread pool
    */
    
    zv_threadpool_t *tp = threadpool_init(cf.thread_num);
    check(tp != NULL, "threadpool_init error");
    
    
    /*
     * initialize timer
     */
    zv_timer_init();

    log_info("zaver started.");
    int n;
    int i, fd;
    int time;

    /* epoll_wait loop */
    while (1) {
        time = zv_find_timer();
        debug("wait time = %d", time);
        n = zv_epoll_wait(epfd, events, MAXEVENTS, time);
        zv_handle_expire_timers();
        
        for (i = 0; i < n; i++) {
            zv_http_request_t *r = (zv_http_request_t *)events[i].data.ptr;
            fd = r->fd;
            
            if (listenfd == fd) {
                /* we hava one or more incoming connections */

                int infd;
                while(1) {
                    infd = accept(listenfd, (struct sockaddr *)&clientaddr, &inlen);
                    if (infd < 0) {
                        if ((errno == EAGAIN) || (errno == EWOULDBLOCK)) {
                            /* we have processed all incoming connections */
                            break;
                        } else {
                            log_err("accept");
                            break;
                        }
                    }

                    rc = make_socket_non_blocking(infd);
                    check(rc == 0, "make_socket_non_blocking");
                    log_info("new connection fd %d", infd);
                    
                    zv_http_request_t *request = (zv_http_request_t *)malloc(sizeof(zv_http_request_t));
                    if (request == NULL) {
                        log_err("malloc(sizeof(zv_http_request_t))");
                        break;
                    }

                    zv_init_request_t(request, infd, epfd, &cf);
                    event.data.ptr = (void *)request;
                    event.events = EPOLLIN | EPOLLET | EPOLLONESHOT;

                    zv_epoll_add(epfd, infd, &event);
                    zv_add_timer(request, TIMEOUT_DEFAULT, zv_http_close_conn);
                }   // end of while of accept

            } else {
                if ((events[i].events & EPOLLERR) ||
                    (events[i].events & EPOLLHUP) ||
                    (!(events[i].events & EPOLLIN))) {
                    log_err("epoll error fd: %d", r->fd);
                    close(fd);
                    continue;
                }

                log_info("new data from fd %d", fd);
                rc = threadpool_add(tp, do_request, events[i].data.ptr);
                check(rc == 0, "threadpool_add");

                do_request(events[i].data.ptr);
            }
        }   //end of for
    }   // end of while(1)
    

    
    if (threadpool_destroy(tp, 1) < 0) {
        log_err("destroy threadpool failed");
    }
    

    return 0;
}
