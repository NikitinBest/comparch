#include <stdlib.h>
#include "rectangle.h"

double areaOfRectangle(struct Rectangle *rectangle) {
    return abs((rectangle->right_bottom.x - rectangle->left_top.x)
        * (rectangle->left_top.y - rectangle->right_bottom.y));
}

void inputRectangle(struct Rectangle *rectangle, FILE *input_file) {
    fscanf(input_file, "%i %i %i %i",
           &rectangle->left_top.x,
           &rectangle->left_top.y,
           &rectangle->right_bottom.x,
           &rectangle->right_bottom.y);
    if (rectangle->left_top.x > rectangle->right_bottom.x) {
        int t = rectangle->left_top.x;
        rectangle->left_top.x = rectangle->right_bottom.x;
        rectangle->right_bottom.x = t;
    }
    if (rectangle->left_top.y < rectangle->right_bottom.y) {
        int t = rectangle->left_top.y;
        rectangle->left_top.y = rectangle->right_bottom.y;
        rectangle->right_bottom.y = t;
    }
}

void printRectangle(struct Rectangle *rectangle, FILE *output_file) {
    fprintf(output_file, "%s %f", "; Area: ", areaOfRectangle(rectangle));
    fprintf(output_file, "%s %i %i", "; Coordinates of left-top point:",
            rectangle->left_top.x, rectangle->left_top.y);
    fprintf(output_file, "%s %i %i%s", "; Coordinates of right-bottom point:",
            rectangle->right_bottom.x, rectangle->right_bottom.y, ";\n");
}
