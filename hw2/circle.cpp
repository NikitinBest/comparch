#include "circle.h"
#include <fstream>

double Circle::area(){
    return PI * radius * radius;
}

void Circle::inputFigure(std::ifstream &input_file) {
    input_file >> center >> radius;
}

void Circle::printFigure(std::ofstream &output_file) {
    output_file << "Type: Circle;    Color: ";
    this->printColor(output_file);
    output_file << std::fixed << "; Area: " << this->area()
                << "; Coordinates of center: ";
    output_file << this->center;
    output_file << "; Radius : " << radius << ";\n";
}
