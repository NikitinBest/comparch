#ifndef HW1_CONTAINER_H
#define HW1_CONTAINER_H

#include <stdio.h>
#include "figure.h"

struct Container {
    struct Figure figures[10000];
    int size;
};

void Init(struct Container *container);

void Clear(struct Container *container);

void sort(struct Container *container);

void fill(struct Container *container, FILE *input_file);

void print(struct Container *container, FILE *output_file);

void fillRandomly(struct Container *container, FILE *input_file);

#endif //HW1_CONTAINER_H
