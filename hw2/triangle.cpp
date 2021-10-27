#include "triangle.h"

double Triangle::area(){
    return std::fabs(0.5 * ((p1.x - p3.x) * (p2.y - p3.y)
                            - (p1.y - p3.y) * (p2.x - p3.x)));
}

void Triangle::inputFigure(std::ifstream &input_file) {
    input_file >> p1 >> p2 >> p3;
}

void Triangle::printFigure(std::ofstream &output_file) {
    output_file << "Type: Triangle;  Color: ";
    this->printColor(output_file);
    output_file << std::fixed << "; Area: " << this->area()
                << "; Coordinates of first point: ";
    output_file << this->p1 << "; Coordinates of second point: ";
    output_file << this->p2 << "; Coordinates of third point: ";
    output_file << this->p3 << ";\n";

}
