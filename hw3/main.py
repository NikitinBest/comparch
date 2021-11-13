import sys
from container import Container


def print_error_message():
    print("Incorrect command line!\n" +
        "Correct format:\n" +
        "command inputFile outputFile\n" +
        "or" +
        "command -r inputFile outputFile\n")


if __name__ == '__main__':
    if len(sys.argv) != 3 and len(sys.argv) != 4:
        print_error_message()
        exit()

    print("Program started... \n")

    cont = Container()
    if len(sys.argv) == 4 and sys.argv[1] == "-r":
        with open(sys.argv[2]) as input_file:
            size = int(input_file.read())
        cont.random_fill(size)
        output_filename = sys.argv[3]
    elif len(sys.argv) == 3:
        with open(sys.argv[1]) as input_file:
            dataLines = [line.split() for line in input_file]
        cont.fill(dataLines)
        output_filename = sys.argv[2]
    else:
        print_error_message()
        exit()

    with open(output_filename, "w") as output_file:
        cont.output_data(output_file)
        cont.sort()
        output_file.write(
            "-------------------------------------------\n" +
            "Container Sorted!\n" +
            "-------------------------------------------\n")
        cont.output_data(output_file)
        output_file.close()

    print("Program finished!\n")
