#ifndef HW2_CONTAINER_H
#define HW2_CONTAINER_H

#include "figure.h"
#include <fstream>

class Container {
private:
    Figure** figures;
    int size;

public:
    explicit Container();

    explicit Container(int capacity);

    ~Container();

    void sort();

    void fill(std::ifstream &input_file);

    void print(std::ofstream &output_file);

    void fillRandomly(std::ifstream &input_file);
};


#endif //HW2_CONTAINER_H
