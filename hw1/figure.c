#include "figure.h"
#include "circle.h"
#include "rectangle.h"
#include "triangle.h"

void Input(struct Figure *figure, FILE *input_file) {
    switch (figure->type) {
        case CIRCLE:
            inputCircle(&figure->circle, input_file);
            break;
        case RECTANGLE:
            inputRectangle(&figure->rectangle, input_file);
            break;
        case TRIANGLE:
            inputTriangle(&figure->triangle, input_file);
            break;
        default:
            printf("Figure-type error in input file\n");
            return;
    }
}

void Output(struct Figure *figure, FILE *output_file){
    switch (figure->type) {
        case CIRCLE:
            fprintf(output_file, "Type: Circle;    Color: ");
            PrintColor(&figure->color, output_file);
            printCircle(&figure->circle, output_file);
            break;
        case RECTANGLE:
            fprintf(output_file, "Type: Rectangle; Color: ");
            PrintColor(&figure->color, output_file);
            printRectangle(&figure->rectangle, output_file);
            break;
        case TRIANGLE:
            fprintf(output_file, "Type: Triangle;  Color: ");
            PrintColor(&figure->color, output_file);
            printTriangle(&figure->triangle, output_file);
            break;
        default:
            printf("Figure-type error in output file\n");
            return;
    }
}

double area(struct Figure *figure) {
    switch (figure->type) {
        case CIRCLE:
            return areaOfCircle(&figure->circle);
        case RECTANGLE:
            return areaOfRectangle(&figure->rectangle);
        case TRIANGLE:
            return areaOfTriangle(&figure->triangle);
        default:
            return 0;
    }
}

void PrintColor(const enum Colors *color, FILE *output_file) {
    switch(*color) {
        case COLOR_RED:
            fprintf(output_file, "RED   ");
            break;
        case COLOR_ORANGE:
            fprintf(output_file, "ORANGE");
            break;
        case COLOR_YELLOW:
            fprintf(output_file, "YELLOW");
            break;
        case COLOR_GREEN:
            fprintf(output_file, "GREEN ");
            break;
        case COLOR_BLUE:
            fprintf(output_file, "BLUE  ");
            break;
        case COLOR_INDIGO:
            fprintf(output_file, "INDIGO");
            break;
        case COLOR_PURPLE:
            fprintf(output_file, "PURPLE");
            break;
    }
}
