#ifndef HW2_TRIANGLE_H
#define HW2_TRIANGLE_H

#include "figure.h"
#include <cmath>


class Triangle : public Figure {
private:
    Point p1, p2, p3;

public:
    Triangle() = default;

    Triangle(Point p1, Point p2, Point p3) : p1(p1), p2(p2), p3(p3) {}

    virtual ~Triangle() = default;

    void inputFigure(std::ifstream &input_file) override;

    virtual void printFigure(std::ofstream &output_file) override;

    double area() override;
};


#endif //HW2_TRIANGLE_H
