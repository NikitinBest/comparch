//
// Created by Никита Никитин on 16.12.2021.
//

#include "Book.h"

Book::Book(int ISBN, std::string name, std::string author, int num_of_pages_)
        : ISBN_(ISBN), name_(std::move(name)), author_(std::move(author)), num_of_pages_(num_of_pages_) {}

Book::Book() {

}

Book::~Book() {

}

Book Book::randomBook() {
    Book x;
    x.author_ = names[random() % 200] +  " " + surnames[random() % 100];
    x.name_ = "bookname" + std::to_string(random() % 100000);
    x.ISBN_ = random() % 10000000000000;
    x.num_of_pages_ = random() % 1500;
    return x;
}

std::ofstream &operator<<(std::ofstream &output_file, const Book &b) {
    output_file << b.author_ << ", " << b.name_ << ", "
                << b.ISBN_ << ", " << b.num_of_pages_
                << ", place: row " << b.row << ", bookshelf "
                << b.bookshelf << ", place " << b.place << ";\n";
    return output_file;
}
