#ifndef HW2_FIGURE_H
#define HW2_FIGURE_H

#include <iostream>
#include <fstream>
#include <cmath>
#include <iomanip>

struct Point {
    int x;
    int y;

    Point() = default;

    friend std::ifstream &operator>>(std::ifstream &input_file, Point &p);
    friend std::ofstream &operator<<(std::ofstream &output_file, const Point &p);
};

enum Colors {
    COLOR_RED = 0,
    COLOR_ORANGE = 1,
    COLOR_YELLOW = 2,
    COLOR_GREEN = 3,
    COLOR_BLUE = 4,
    COLOR_INDIGO = 5,
    COLOR_PURPLE = 6
};

class Figure {
private:
    Colors color;
public:
    Figure() = default;

    virtual ~Figure() = default;

    static Figure* input(std::ifstream &input_file);

    virtual void inputFigure(std::ifstream &input_file) = 0;

    virtual void printFigure(std::ofstream &output_file) = 0;

    virtual double area() = 0;

    void setColor(Colors new_color);

    void printColor(std::ofstream &output_file);
};


#endif //HW2_FIGURE_H
