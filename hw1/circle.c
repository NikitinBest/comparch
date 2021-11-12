#include "circle.h"

const double PI = 3.14159265;

double areaOfCircle(struct Circle *circle) {
    return PI * circle->radius * circle->radius;
}

void inputCircle(struct Circle *circle, FILE *input_file) {
    fscanf(input_file, "%i %i %i", &circle->center.x, &circle->center.y, &circle->radius);
}

void printCircle(struct Circle *circle, FILE *output_file) {

    fprintf(output_file, "%s %f", "; Area: ", areaOfCircle(circle));
    fprintf(output_file, "%s %i %i", "; Coordinates of center:",
            circle->center.x, circle->center.y);
    fprintf(output_file, "%s %i%s", "; Radius:", circle->radius, ";\n");
}
