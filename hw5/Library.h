#ifndef HW5_LIBRARY_H
#define HW5_LIBRARY_H

#include "Book.cpp"


class Library {
public:
    int n_rows_;
    int n_bookshelves_;
    int n_numbers_;

    Book*** row;

    Library(int n_rows, int n_bookshelves, int n_numbers);

    ~Library();

    void generateBooks();
};

std::ofstream &operator<<(std::ofstream &output_file, const Library &l);
#endif //HW5_LIBRARY_H
