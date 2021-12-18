#ifndef HW5_BOOK_H
#define HW5_BOOK_H

#include <string>
#include <random>
#include <fstream>

std::string names[200] = {"Emilу", "Hannah", "Natalie", "Sophia", "Ella", "Madison", "Sydney", "Anna", "Taylor", "Isabella", "Kayla", "Victoria", "Elizabeth", "Ashley", "Rachel", "Alexis", "Julia", "Samantha", "Haley", "Olivia", "Sarah", "Jessica", "Ava", "Kaitlyn", "Katherine", "Megan", "Alexandrа", "Chloe", "Allison", "Alyssa", "Abigail", "Brianna", "Sara", "Gabriellа", "Lauren", "Destiny", "Jennifer", "Alexa", "Jasmine", "Gabrielle", "Sofia", "Autumn", "Lillian", "Mia", "Avery", "Marissa", "Jocelyn", "Caroline", "Melanie", "Leslie", "Katelyn", "Jordan", "Morgan", "Vanessa", "Savannah", "Angelina", "Maya", "Brooke", "Isabel", "Michelle", "Amia", "Faith", "Leah", "Amber", "Lily", "Amelia", "Hailey", "Molly", "Irea", "Maria", "Kimberly", "Kaylee", "Aaliyah", "Trinity", "Claire", "Makayla", "Bailey", "Zoe", "Arianna", "Nicole", "Diana", "Riley", "Melissa", "Mackenzie", "Ariana", "Danielle", "Kylie", "Jada", "Stephanie", "Paige", "Jenna", "Mary", "Erin", "Madeline", "Sierra", "Grace", "Audrey", "Rebecca", "Evelyn", "Camilla", "Anthony", "James", "Aidan", "Jackson", "David", "Mason", "Logan", "Alexander", "Charles", "Bryan", "Angel", "Tyler", "Isaac", "John", "Nathaniel", "Samuel", "Austin", "Luis", "Benjamin", "Aiden", "Gabriel", "Carlos", "Robert", "Julian", "Lucas", "Brandon", "Diego", "Jose", "Alex", "Nicholas", "Timothy", "Nathan", "Brian", "Kevin", "Chase", "Carter", "Jonathan", "Owen", "Jack", "Jesus", "Luke", "Adrian", "Connor", "Dominic", "Steven", "Sebastian", "Ashton", "Jake", "Dylan", "Devin", "Hunter", "Colin", "Evan", "Richard", "Christopher", "Alejandro", "Kyle", "Jacob", "Elijah", "Antonio", "Andrew", "Cameron", "Landon", "Zachary", "Adam", "Matthew", "Jayden", "Sean", "William", "Ian", "Jesse", "Cody", "Jaden", "Ryan", "Jeremiah", "Joseph", "Juan", "Michael", "Nigel", "Noah", "Isaiah", "Seth", "Daniel", "Blake", "Jordan", "Cole", "Joshua", "Miguel", "Caleb", "Xavier", "Ethan", "Patrick", "Christian", "Eric", "Justin", "Hayden", "Jason", "Thomas", "Aaron", "Gavin"};
std::string surnames[100] = {"Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey", "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson", "Gray", "Ramirez", "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes", "Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson", "Hughes", "Flores", "Washington", "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander", "Russell", "Griffin", "Diaz", "Hayes"};

class Book {
public:
    std::string author_;
    std::string name_;
    long ISBN_;
    int num_of_pages_;

    int row;
    int bookshelf;
    int place;

    Book(int ISBN, std::string name, std::string author, int num_of_pages_)
            : ISBN_(ISBN), name_(name), author_(author), num_of_pages_(num_of_pages_) {}
    Book() {

    }

    ~Book() {

    }

    static Book randomBook() {
        Book x;
        x.author_ = names[random() % 200] +  " " + surnames[random() % 100];
        x.name_ = "bookname" + std::to_string(random() % 100000);
        x.ISBN_ = random() % 10000000000000;
        x.num_of_pages_ = random() % 1500;
        return x;
    }
};


std::ofstream &operator<<(std::ofstream &output_file, const Book &b){
    output_file << b.author_ << ", " << b.name_ << ", "
                << b.ISBN_ << ", " << b.num_of_pages_
                << ", place: row " << b.row << ", bookshelf "
                << b.bookshelf << ", place " << b.place << ";\n";
    return output_file;
}

#endif //HW5_BOOK_H
