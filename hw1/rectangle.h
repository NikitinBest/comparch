#ifndef HW1_RECTANGLE_H
#define HW1_RECTANGLE_H

#include <stdio.h>
#include "point.h"

struct Rectangle {
    struct Point left_top, right_bottom;
};

void inputRectangle(struct Rectangle *rectangle, FILE *input_file);

void printRectangle(struct Rectangle *rectangle, FILE *output_file);

double areaOfRectangle(struct Rectangle *rectangle);

#endif //HW1_RECTANGLE_H
