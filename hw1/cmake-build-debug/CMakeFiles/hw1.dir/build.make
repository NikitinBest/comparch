# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/nbst/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/nbst/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nbst/CLionProjects/comparch/hw1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nbst/CLionProjects/comparch/hw1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/hw1.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/hw1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hw1.dir/flags.make

CMakeFiles/hw1.dir/main.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/hw1.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/main.c.o -c /home/nbst/CLionProjects/comparch/hw1/main.c

CMakeFiles/hw1.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/main.c > CMakeFiles/hw1.dir/main.c.i

CMakeFiles/hw1.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/main.c -o CMakeFiles/hw1.dir/main.c.s

CMakeFiles/hw1.dir/figure.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/figure.c.o: ../figure.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/hw1.dir/figure.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/figure.c.o -c /home/nbst/CLionProjects/comparch/hw1/figure.c

CMakeFiles/hw1.dir/figure.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/figure.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/figure.c > CMakeFiles/hw1.dir/figure.c.i

CMakeFiles/hw1.dir/figure.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/figure.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/figure.c -o CMakeFiles/hw1.dir/figure.c.s

CMakeFiles/hw1.dir/circle.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/circle.c.o: ../circle.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/hw1.dir/circle.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/circle.c.o -c /home/nbst/CLionProjects/comparch/hw1/circle.c

CMakeFiles/hw1.dir/circle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/circle.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/circle.c > CMakeFiles/hw1.dir/circle.c.i

CMakeFiles/hw1.dir/circle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/circle.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/circle.c -o CMakeFiles/hw1.dir/circle.c.s

CMakeFiles/hw1.dir/rectangle.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/rectangle.c.o: ../rectangle.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/hw1.dir/rectangle.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/rectangle.c.o -c /home/nbst/CLionProjects/comparch/hw1/rectangle.c

CMakeFiles/hw1.dir/rectangle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/rectangle.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/rectangle.c > CMakeFiles/hw1.dir/rectangle.c.i

CMakeFiles/hw1.dir/rectangle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/rectangle.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/rectangle.c -o CMakeFiles/hw1.dir/rectangle.c.s

CMakeFiles/hw1.dir/triangle.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/triangle.c.o: ../triangle.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/hw1.dir/triangle.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/triangle.c.o -c /home/nbst/CLionProjects/comparch/hw1/triangle.c

CMakeFiles/hw1.dir/triangle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/triangle.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/triangle.c > CMakeFiles/hw1.dir/triangle.c.i

CMakeFiles/hw1.dir/triangle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/triangle.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/triangle.c -o CMakeFiles/hw1.dir/triangle.c.s

CMakeFiles/hw1.dir/container.c.o: CMakeFiles/hw1.dir/flags.make
CMakeFiles/hw1.dir/container.c.o: ../container.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/hw1.dir/container.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hw1.dir/container.c.o -c /home/nbst/CLionProjects/comparch/hw1/container.c

CMakeFiles/hw1.dir/container.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hw1.dir/container.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nbst/CLionProjects/comparch/hw1/container.c > CMakeFiles/hw1.dir/container.c.i

CMakeFiles/hw1.dir/container.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hw1.dir/container.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nbst/CLionProjects/comparch/hw1/container.c -o CMakeFiles/hw1.dir/container.c.s

# Object files for target hw1
hw1_OBJECTS = \
"CMakeFiles/hw1.dir/main.c.o" \
"CMakeFiles/hw1.dir/figure.c.o" \
"CMakeFiles/hw1.dir/circle.c.o" \
"CMakeFiles/hw1.dir/rectangle.c.o" \
"CMakeFiles/hw1.dir/triangle.c.o" \
"CMakeFiles/hw1.dir/container.c.o"

# External object files for target hw1
hw1_EXTERNAL_OBJECTS =

hw1: CMakeFiles/hw1.dir/main.c.o
hw1: CMakeFiles/hw1.dir/figure.c.o
hw1: CMakeFiles/hw1.dir/circle.c.o
hw1: CMakeFiles/hw1.dir/rectangle.c.o
hw1: CMakeFiles/hw1.dir/triangle.c.o
hw1: CMakeFiles/hw1.dir/container.c.o
hw1: CMakeFiles/hw1.dir/build.make
hw1: CMakeFiles/hw1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C executable hw1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hw1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hw1.dir/build: hw1
.PHONY : CMakeFiles/hw1.dir/build

CMakeFiles/hw1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hw1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hw1.dir/clean

CMakeFiles/hw1.dir/depend:
	cd /home/nbst/CLionProjects/comparch/hw1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nbst/CLionProjects/comparch/hw1 /home/nbst/CLionProjects/comparch/hw1 /home/nbst/CLionProjects/comparch/hw1/cmake-build-debug /home/nbst/CLionProjects/comparch/hw1/cmake-build-debug /home/nbst/CLionProjects/comparch/hw1/cmake-build-debug/CMakeFiles/hw1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hw1.dir/depend

