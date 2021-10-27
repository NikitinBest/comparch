#include  <iostream>
#include <cstring>

#include "container.h"

void errorMessage(){
    std::cout << "Incorrect command line!\n"
                 "Correct format:\n"
                 "command inputFile outputFile\n"
                 "or\n"
                 "command -r inputFile outputFile\n";
}

int main(int argc, char* argv[])
{
    if(argc != 3 && argc != 4) {
        errorMessage();
        return 1;
    }

    std::cout << "Program started... \n";

    std::ifstream input_file;
    std::ofstream output_file;

    if (argc == 4 && !strcmp(argv[1], "-r")) {
        input_file.open(argv[2]);
        output_file.open(argv[3]);
    } else if (argc == 3){
        input_file.open(argv[1]);
        output_file.open(argv[2]);

    } else {
        errorMessage();
        return 1;
    }

    if (!input_file) {
        std::cout << "Cannot open input file\n";
        return -1;
    }
    if (!output_file) {
        std::cout << "Cannot open output file\n";
        return -1;
    }

    Container container;

    if (argc == 3) {
        container.fill(input_file);
    } else {
        container.fillRandomly(input_file);
    }

    container.print(output_file);
    output_file << "-------------------------------------------\n";
    output_file << "Container Sorted!\n";
    output_file << "-------------------------------------------\n";
    container.sort();
    container.print(output_file);

    input_file.close();
    output_file.close();
    std::cout << "Program finished! \n";

    return 0;
}
