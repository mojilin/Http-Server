# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chang/Downloads/zaver-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chang/Downloads/zaver-master

# Include any dependencies generated for this target.
include tests/CMakeFiles/priority_queue_test.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/priority_queue_test.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/priority_queue_test.dir/flags.make

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o: tests/CMakeFiles/priority_queue_test.dir/flags.make
tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o: tests/priority_queue_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chang/Downloads/zaver-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o   -c /home/chang/Downloads/zaver-master/tests/priority_queue_test.c

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/priority_queue_test.dir/priority_queue_test.c.i"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/chang/Downloads/zaver-master/tests/priority_queue_test.c > CMakeFiles/priority_queue_test.dir/priority_queue_test.c.i

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/priority_queue_test.dir/priority_queue_test.c.s"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/chang/Downloads/zaver-master/tests/priority_queue_test.c -o CMakeFiles/priority_queue_test.dir/priority_queue_test.c.s

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.requires:

.PHONY : tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.requires

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.provides: tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.requires
	$(MAKE) -f tests/CMakeFiles/priority_queue_test.dir/build.make tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.provides.build
.PHONY : tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.provides

tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.provides.build: tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o


tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o: tests/CMakeFiles/priority_queue_test.dir/flags.make
tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o: src/priority_queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chang/Downloads/zaver-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o   -c /home/chang/Downloads/zaver-master/src/priority_queue.c

tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.i"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/chang/Downloads/zaver-master/src/priority_queue.c > CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.i

tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.s"
	cd /home/chang/Downloads/zaver-master/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/chang/Downloads/zaver-master/src/priority_queue.c -o CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.s

tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.requires:

.PHONY : tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.requires

tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.provides: tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.requires
	$(MAKE) -f tests/CMakeFiles/priority_queue_test.dir/build.make tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.provides.build
.PHONY : tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.provides

tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.provides.build: tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o


# Object files for target priority_queue_test
priority_queue_test_OBJECTS = \
"CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o" \
"CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o"

# External object files for target priority_queue_test
priority_queue_test_EXTERNAL_OBJECTS =

tests/priority_queue_test: tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o
tests/priority_queue_test: tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o
tests/priority_queue_test: tests/CMakeFiles/priority_queue_test.dir/build.make
tests/priority_queue_test: tests/CMakeFiles/priority_queue_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chang/Downloads/zaver-master/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable priority_queue_test"
	cd /home/chang/Downloads/zaver-master/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/priority_queue_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/priority_queue_test.dir/build: tests/priority_queue_test

.PHONY : tests/CMakeFiles/priority_queue_test.dir/build

tests/CMakeFiles/priority_queue_test.dir/requires: tests/CMakeFiles/priority_queue_test.dir/priority_queue_test.c.o.requires
tests/CMakeFiles/priority_queue_test.dir/requires: tests/CMakeFiles/priority_queue_test.dir/__/src/priority_queue.c.o.requires

.PHONY : tests/CMakeFiles/priority_queue_test.dir/requires

tests/CMakeFiles/priority_queue_test.dir/clean:
	cd /home/chang/Downloads/zaver-master/tests && $(CMAKE_COMMAND) -P CMakeFiles/priority_queue_test.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/priority_queue_test.dir/clean

tests/CMakeFiles/priority_queue_test.dir/depend:
	cd /home/chang/Downloads/zaver-master && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chang/Downloads/zaver-master /home/chang/Downloads/zaver-master/tests /home/chang/Downloads/zaver-master /home/chang/Downloads/zaver-master/tests /home/chang/Downloads/zaver-master/tests/CMakeFiles/priority_queue_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/priority_queue_test.dir/depend

