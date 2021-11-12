#include "triangle.h"
#include <math.h>

double areaOfTriangle(struct Triangle *triangle) {
    return fabs(0.5 * ((triangle->p1.x - triangle->p3.x)
                            * (triangle->p2.y - triangle->p3.y)
                        - (triangle->p1.y - triangle->p3.y)
                            * (triangle->p2.x - triangle->p3.x)));
}

void inputTriangle(struct Triangle *triangle, FILE *input_file) {
    fscanf(input_file, "%i %i %i %i %i %i",
           &triangle->p1.x, &triangle->p1.y,
           &triangle->p2.x, &triangle->p2.y,
           &triangle->p3.x, &triangle->p3.y);
}

void printTriangle(struct Triangle *triangle, FILE *output_file) {
    fprintf(output_file, "%s %f", "; Area: ", areaOfTriangle(triangle));
    fprintf(output_file, "%s %i %i", "; Coordinates of first point:",
            triangle->p1.x, triangle->p1.y);
    fprintf(output_file, "%s %i %i", "; Coordinates of second point:",
            triangle->p2.x, triangle->p2.y);
    fprintf(output_file, "%s %i %i%s", "; Coordinates of third point:",
            triangle->p3.x, triangle->p3.y, ";\n");
}
