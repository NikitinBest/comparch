#include "container.h"
#include <stdlib.h>

void Init(struct Container *container) {
    container->size = 0;
}

void Clear(struct Container *container) {
    container->size = 0;
}

void sort(struct Container *container){
    for (int gap = container->size / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < container->size; i += 1) {
            struct Figure current;
            current = container->figures[i];

            int j;
            for (j = i; j >= gap && area(&container->figures[j - gap]) > area(&current); j -= gap)
                container->figures[j] = container->figures[j - gap];

            container->figures[j] = current;
        }
    }
}

void fill(struct Container *container, FILE *input_file) {
    int type;
    container->size = 0;
    while(container->size < 10000 && fscanf(input_file, "%i", &type) != EOF) {
        fscanf(input_file, "%i", &container->figures[container->size].color);
        switch (type) {
            case 0:
                container->figures[container->size].type = CIRCLE;
                Input(&container->figures[container->size], input_file);
                break;
            case 1:
                container->figures[container->size].type = RECTANGLE;
                Input(&container->figures[container->size], input_file);
                break;
            case 2:
                container->figures[container->size].type = TRIANGLE;
                Input(&container->figures[container->size], input_file);
                break;
            default:
                printf("Figure-type error in input file\n");
                return;
        }
        ++container->size;
    }

}

void print(struct Container *container, FILE *output_file) {
    fprintf(output_file, "Container includes ");
    fprintf(output_file, "%i %s", container->size, " objects:\n");
    for (int i = 0; i < container->size; ++i) {
        Output(&container->figures[i], output_file);
    }
}

void fillRandomly(struct Container *container, FILE *input_file) {
    fscanf(input_file, "%i", &(container->size));
    FILE *buffer = fopen("../tests/random_tmp.txt", "w");

    for (int i = 0; i < container->size; ++i){
        int type = rand() % 3;
        int color = rand() % 7;
        fprintf(buffer, "%i %i ", type, color);
        switch (type) {
            case 0:
                fprintf(buffer, "%i %i %i",
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 10000);
                break;
            case 1:
                fprintf(buffer, "%i %i %i %i",
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000);
                break;
            case 2:
                fprintf(buffer, "%i %i %i %i %i %i",
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000,
                        rand() % 20000 - 10000);
                break;
        }
        if (i + 1 < container->size)
            fprintf(buffer, "\n");
    }
    fclose(buffer);
    FILE *buffer_in = fopen("../tests/random_tmp.txt", "r");
    fill(container, buffer_in);
    fclose(buffer_in);
}
