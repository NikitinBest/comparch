#ifndef HW2_RECTANGLE_H
#define HW2_RECTANGLE_H

#include "figure.h"

class Rectangle : public Figure {
private:
    Point left_top, right_bottom;

public:
    Rectangle() = default;

    Rectangle(Point left_top, Point right_bottom) : left_top(left_top), right_bottom(right_bottom) {}

    virtual ~Rectangle() = default;

    void inputFigure(std::ifstream &input_file) override;

    virtual void printFigure(std::ofstream &output_file) override;

    double area() override;
};


#endif //HW2_RECTANGLE_H
