#include "container.h"
#include <stdlib.h>

Container::Container() {
    figures = new Figure*[10000];
    this->size = 10000;
}

Container::Container(int capacity) {
    figures = new Figure*[capacity];
    this->size = capacity;
}

Container::~Container() {
    for (int i = 0; i < size; ++i)
        delete figures[i];
    delete[] figures;
    figures = nullptr;
}

void Container::sort(){
    for (int gap = size / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < size; i += 1) {
            Figure* current = figures[i];

            int j;
            for (j = i; j >= gap && figures[j - gap]->area() > current->area(); j -= gap)
                figures[j] = figures[j - gap];

            figures[j] = current;
        }
    }
}

void Container::fill(std::ifstream &input_file) {
    for (size = 0; size < 10000 && !input_file.eof(); ++size) {
        figures[size] = Figure::input(input_file);
    }
}

void Container::print(std::ofstream &output_file) {
    output_file << "Container includes " << size << " objects:\n";
    for (int i = 0; i < size; ++i) {
        figures[i]->printFigure(output_file);
    }
}

void Container::fillRandomly(std::ifstream &input_file) {
    input_file >> this->size;
    std::ofstream buffer("../tests/random_tmp.txt");

    for (int i = 0; i < size; ++i){
        int type = rand() % 3;
        int color = rand() % 7;
        buffer << type << " " << color << " ";
        switch (type) {
            case 0:
                buffer << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 10000;
                break;
            case 1:
                buffer << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000;
                break;
            case 2:
                buffer << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000 << " "
                       << rand() % 20000 - 10000;
                break;
        }
        if (i + 1 < size)
            buffer << "\n";
    }
    buffer.close();
    std::ifstream buffer_in("../tests/random_tmp.txt");
    this->fill(buffer_in);
    buffer_in.close();
}
