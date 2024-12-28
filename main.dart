void main() {

  var library = Library();

  // TESTSSS
  library.addBook(Book(1, 'Harry Potter and the Sorcerers Stone'));
  library.addBook(Book(2, 'The Lord of the Rings'));
  library.addUser(User(1, 'Aya'));
  library.addUser(User(2, 'Mohamed'));

  // Borrow and return books
  library.borrowBook(1, 1); 
  library.borrowBook(2, 2); 
  // library.returnBook(1, 1); 
  library.returnBook(2, 2); 

  // DisplayLibraryInfo
  library.displayInfo();
}


class Book {
  int id;
  String title;
  bool borrowed;

  Book(this.id, this.title, {this.borrowed = false});

  // display info of th book method
  void displayInfo() {
    print(' ID: $id , Book"s title: $title , Borrowed: ${borrowed ? "Yes" : "No"}');
  }
}

class User {
  int id;
  String name;

  User(this.id, this.name);

  //display info of user method
  void displayInfo() {
    print('ID: $id , name: $name');
  }
}

// The Library 
class Library {
  List<Book> books = [];
  List<User> users = [];

  // Add Book
  void addBook(Book book) {
    books.add(book);
  }

  // Add User
  void addUser(User user) {
    users.add(user);
  }

  // Borrow a book
  void borrowBook(int userId, int bookId) {
    var book = books.firstWhere((book) => book.id == bookId);
    if (book.borrowed) {
      print('Book already borrowed! , unavailable');
    } else {
      book.borrowed = true;
      print('${users.firstWhere((user) => user.id == userId).name} borrowed ${book.title}.');
    }
  }

  // Return a book
  void returnBook(int userId, int bookId) {
    var book = books.firstWhere((book) => book.id == bookId);
    if (!book.borrowed) {
      print('Book is here , was not borrowed ');
    } else {
      book.borrowed = false;
      print('${users.firstWhere((user) => user.id == userId).name} returned ${book.title}.');
    }
  }

  // Display all books and users
  void displayInfo() {
    print('Books in the library are:');
    for (var book in books) {
      book.displayInfo();
    }
    print('Users in the library are:');
    for (var user in users) {
      user.displayInfo();
    }
  }
}
