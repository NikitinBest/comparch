#ifndef HW1_CIRCLE_H
#define HW1_CIRCLE_H

#include <stdio.h>
#include "point.h"

struct Circle {
    struct Point center;
    int radius;
};

void inputCircle(struct Circle *circle, FILE *input_file);

void printCircle(struct Circle *circle, FILE *output_file);

double areaOfCircle(struct Circle *circle);

#endif //HW1_CIRCLE_H
