#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "container.h"

void errorMessage(){
    printf( "Incorrect command line!\n"
                 "Correct format:\n"
                 "command inputFile outputFile\n"
                 "or\n"
                 "command -r inputFile outputFile\n");
}

int main(int argc, char* argv[]) {
    if(argc != 3 && argc != 4) {
        errorMessage();
        return 1;
    }

    printf("Program started... \n");

    FILE *input_file;
    FILE *output_file;

    if (argc == 4 && !strcmp(argv[1], "-r")) {
        input_file = fopen(argv[2], "r");
        output_file = fopen(argv[3], "w");
    } else if (argc == 3){
        input_file = fopen(argv[1], "r");
        output_file = fopen(argv[2], "w");
    } else {
        errorMessage();
        return 1;
    }

    //?????????????????????????????????????
    if (!input_file) {
        printf("Cannot open input file\n");
        return -1;
    }
    if (!output_file) {
        printf("Cannot open output file\n");
        return -1;
    }

    struct Container container;

    if (argc == 3) {
        fill(&container, input_file);
    } else {
        fillRandomly(&container, input_file);
    }

    print(&container, output_file);
    fprintf(output_file, "-------------------------------------------\n");
    fprintf(output_file, "Container Sorted!\n");
    fprintf(output_file, "-------------------------------------------\n");
    sort(&container);
    print(&container, output_file);

    fclose(input_file);
    fclose(output_file);
    printf("Program finished! \n");
    return 0;
}
