#ifndef HW1_TRIANGLE_H
#define HW1_TRIANGLE_H

#include <stdio.h>
#include "point.h"

struct Triangle {
    struct Point p1, p2, p3;
};

void inputTriangle(struct Triangle *triangle, FILE *input_file);

void printTriangle(struct Triangle *triangle, FILE *output_file);

double areaOfTriangle(struct Triangle *triangle);

#endif //HW1_TRIANGLE_H
