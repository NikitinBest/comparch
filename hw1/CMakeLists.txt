cmake_minimum_required(VERSION 3.20)
project(hw1 C)

set(CMAKE_C_STANDARD 99)

add_executable(hw1 main.c figure.c figure.h circle.c circle.h rectangle.c rectangle.h triangle.c triangle.h container.c container.h point.h)
