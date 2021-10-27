#ifndef HW2_CIRCLE_H
#define HW2_CIRCLE_H

#include "figure.h"

const double PI  =3.14159265;

class Circle : public Figure {
private:
    Point center;
    int radius;

public:
    Circle() = default;

    ~Circle() override = default;

    void inputFigure(std::ifstream &input_file) override;

    virtual void printFigure(std::ofstream &output_file) override;

    double area() override;
};


#endif //HW2_CIRCLE_H
