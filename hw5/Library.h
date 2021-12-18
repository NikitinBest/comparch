#ifndef HW5_BOOKGENERATOR_H
#define HW5_BOOKGENERATOR_H
#include "Book.h"
#include <fstream>


class Library {
public:
    int n_rows_;
    int n_bookshelves_;
    int n_numbers_;

    Book*** row;

    Library(int n_rows, int n_bookshelves, int n_numbers) :
            n_rows_(n_rows), n_bookshelves_(n_bookshelves), n_numbers_(n_numbers) {
        row = new Book** [n_rows_];
        for (int i = 0; i < n_rows_; ++i) {
            row[i] = new Book*[n_bookshelves_];
        }
        generateBooks();
    }

    ~Library() {
        for (int i = 0; i < n_rows_; ++i) {
            for (int j = 0; j < n_bookshelves_; ++j) {

                delete[] row[i][j];
            }
        }
        for(int i = 0; i < n_rows_; ++i) {
            delete[] row[i];
        }
        delete[] row;
    }

    void generateBooks() {
        for (int i = 0; i < n_rows_; ++i) {
            for (int j = 0; j < n_bookshelves_; ++j) {
                row[i][j] = new Book[n_numbers_];
                for (int k = 0; k < n_numbers_; ++k) {
                    row[i][j][k] = Book::randomBook();
                    row[i][j][k].row = i;
                    row[i][j][k].bookshelf = j;
                    row[i][j][k].place = k;
                }
            }
        }
    }
};

std::ofstream &operator<<(std::ofstream &output_file, const Library &l){
    for (int i = 0; i < l.n_rows_; ++i) {
        for (int j = 0; j < l.n_bookshelves_; ++j) {
            for (int k = 0; k < l.n_numbers_; ++k) {
                output_file << l.row[i][j][k];
            }
        }
    }
    return output_file;
}
#endif //HW5_BOOKGENERATOR_H
