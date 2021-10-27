#include "rectangle.h"

double Rectangle::area(){
    return std::abs((right_bottom.x - left_top.x) * (left_top.y - right_bottom.y));
}

void Rectangle::inputFigure(std::ifstream &input_file) {
    input_file >> left_top >> right_bottom;
    if (left_top.x > right_bottom.x)
        std::swap(left_top.x, right_bottom.x);
    if (left_top.y < right_bottom.y)
        std::swap(left_top.y, right_bottom.y);
}

void Rectangle::printFigure(std::ofstream &output_file) {
    output_file << "Type: Rectangle; Color: ";
    this->printColor(output_file);
    output_file << std::fixed << "; Area: " << this->area()
                << "; Coordinates of left-top point: ";
    output_file << this->left_top << "; Coordinates of right-bottom point: ";
    output_file << this->right_bottom << ";\n";
}
