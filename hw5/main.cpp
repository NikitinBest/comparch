
#include <iostream>
#include <vector>
#include <thread>
#include "Book.h"
#include "Library.h"
#include <mutex>
#include "fstream"
#include <chrono>

struct Position {
    int row;
    int bookshelf;
    int number;
};

struct Chapter {
    std::vector<Book> books;
};

bool comp(Book f, Book s) {
    if (f.author_ > s.author_){
        return false;
    }
    else if (f.author_ == s.author_) {
        if (f.ISBN_ > s.ISBN_) {
            return false;
        } else if (f.ISBN_ == s.ISBN_){
            if (f.name_ > s.name_)
                return false;
        }
    }
    return true;
}

static std::mutex mutex[26];
static std::mutex give_task;
static Library* library;
static Position next_book;
static bool working;

static Chapter chapters[26];


void inc_next_book () {
    ++next_book.number;
    if (next_book.number >= library->n_numbers_) {
        next_book.number = 0;
        next_book.bookshelf++;
    }
    if (next_book.bookshelf >= library->n_bookshelves_) {
        next_book.bookshelf = 0;
        next_book.row++;
    }
    if (next_book.row >= library->n_rows_){
        working = false;
    }
}

Position giveTask() {
    give_task.lock();

    Position x = next_book;
    inc_next_book();

    give_task.unlock();


    return x;
}

void work() {
    while (working) {
        Position task = giveTask();
        Book adding_book = library->row[task.row][task.bookshelf][task.number];
        int chapter = adding_book.author_[0] - 65;

        mutex[chapter].lock();

        chapters[chapter].books.push_back(adding_book);
        std::sort(chapters[chapter].books.begin(), chapters[chapter].books.end(), comp);

        mutex[chapter].unlock();
    }
}

void makeStudents(int num_of_students) {
    next_book.row = 0;
    next_book.bookshelf = 0;
    next_book.number = 0;
    working = true;

    std::vector<std::thread> threads;

    threads.reserve(num_of_students);
    for (int i = 0; i < num_of_students; ++i) {
        threads.emplace_back(&work);
    }

    for (std::thread &th : threads) {
        th.join();
    }
}


int main() {
    std::ofstream output_file;
    output_file.open("out.txt");
    library = new Library(100, 10, 10);
    makeStudents(20);

    for(Chapter ch : chapters) {
        for(Book b : ch.books) {
            output_file << b;
        }
    }

    output_file.close();

    delete library;
    return 0;
}