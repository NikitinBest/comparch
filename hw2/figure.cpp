#include "figure.h"
#include "circle.h"
#include "rectangle.h"
#include "triangle.h"
#include <fstream>

Figure* Figure::input(std::ifstream &input_file) {
    Figure* figure;
    int type;
    input_file >> type;
    switch (type) {
        case 0:
            figure = new Circle();
            break;
        case 1:
            figure = new Rectangle();
            break;
        case 2:
            figure = new Triangle();
            break;
        default:
            std::cout << "Figure-type error in input file\n";
            return nullptr;
    }
    input_file >> type;
    figure->setColor(static_cast<Colors>(type));

    figure->inputFigure(input_file);
    return figure;
}

void Figure::setColor(Colors new_color) {
    this->color = new_color;
}

void Figure::printColor(std::ofstream &output_file) {
    switch(this->color) {
        case COLOR_RED:
            output_file << "RED   ";
            break;
        case COLOR_ORANGE:
            output_file << "ORANGE";
            break;
        case COLOR_YELLOW:
            output_file << "YELLOW";
            break;
        case COLOR_GREEN:
            output_file << "GREEN ";
            break;
        case COLOR_BLUE:
            output_file << "BLUE  ";
            break;
        case COLOR_INDIGO:
            output_file << "INDIGO";
            break;
        case COLOR_PURPLE:
            output_file << "PURPLE";
            break;
    }
}

std::ifstream &operator>>(std::ifstream &input_file, Point &p) {
    input_file >> p.x >> p.y;
    return input_file;
}

std::ofstream &operator<<(std::ofstream &output_file, const Point &p){
    output_file << std::fixed << p.x << " " << p.y;
    return output_file;
}
