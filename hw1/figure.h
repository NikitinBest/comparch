#ifndef HW1_FIGURE_H
#define HW1_FIGURE_H

#include <stdio.h>
#include "circle.h"
#include "rectangle.h"
#include "triangle.h"

enum Colors {
    COLOR_RED = 0,
    COLOR_ORANGE = 1,
    COLOR_YELLOW = 2,
    COLOR_GREEN = 3,
    COLOR_BLUE = 4,
    COLOR_INDIGO = 5,
    COLOR_PURPLE = 6
};

enum Type {
    CIRCLE,
    RECTANGLE,
    TRIANGLE
};

struct Figure {
    enum Type type;
    enum Colors color;
    union {
        struct Circle circle;
        struct Rectangle rectangle;
        struct Triangle triangle;
    };
};

void Input(struct Figure *figure, FILE *input_file);

void Output(struct Figure *figure, FILE *output_file);

void PrintColor(const enum Colors *color, FILE *output_file);

double area(struct Figure *figure);

#endif //HW1_FIGURE_H
