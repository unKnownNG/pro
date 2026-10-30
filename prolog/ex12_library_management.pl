/* ==========================================================================
   EX.NO: 12
   TITLE: LIBRARY MANAGEMENT SYSTEM
   AIM: To write a Prolog program to simulate a Library Management System.
   ========================================================================== */

/* --- 1. Books Database: book(Title, Author, Year, Genre) --- */
book(harry_potter_1, jk_rowling, 1997, fantasy).
book(harry_potter_2, jk_rowling, 1998, fantasy).
book(harry_potter_3, jk_rowling, 1999, fantasy).
book(the_hobbit, jrr_tolkien, 1937, fantasy).
book(the_lord_of_the_rings, jrr_tolkien, 1954, fantasy).
book(the_da_vinci_code, dan_brown, 2003, thriller).
book(angels_and_demons, dan_brown, 2000, thriller).
book(digital_fortress, dan_brown, 1998, thriller).
book(the_girl_with_the_dragon_tattoo, stieg_larsson, 2005, mystery).
book(the_girl_who_played_with_fire, stieg_larsson, 2006, mystery).
book(the_girl_who_kicked_the_hornets_nest, stieg_larsson, 2007, mystery).

/* --- 2. Borrowers Database: borrower(FirstName, LastName, BorrowerId) --- */
borrower(john, doe, 12345).
borrower(jane, smith, 67890).
borrower(jack, black, 24680).

/* --- 3. Borrowed Records: borrowed(BookTitle, BorrowerId) --- */
borrowed(harry_potter_1, 12345).
borrowed(the_hobbit, 67890).
borrowed(the_da_vinci_code, 24680).
borrowed(the_girl_with_the_dragon_tattoo, 12345).
borrowed(the_girl_who_played_with_fire, 67890).

/* --- 4. Search & Management Predicates --- */

% Find a book by title
find_book_by_title(Title, Author, Year, Genre) :-
    book(Title, Author, Year, Genre).

% Find a book by author
find_book_by_author(Author, Title, Year, Genre) :-
    book(Title, Author, Year, Genre).

% Find a borrower by their ID
find_borrower_by_id(Id, FirstName, LastName) :-
    borrower(FirstName, LastName, Id).

% List all currently borrowed books along with borrower details
list_borrowed_books :-
    borrowed(BookTitle, BorrowerId),
    find_book_by_title(BookTitle, Author, Year, Genre),
    find_borrower_by_id(BorrowerId, FirstName, LastName),
    format('Book: ~w, Author: ~w, Year: ~w, Genre: ~w, Borrower: ~w ~w~n', 
           [BookTitle, Author, Year, Genre, FirstName, LastName]).

/* ==========================================================================
   SAMPLE QUERIES & EXPECTED OUTPUT:
   --------------------------------------------------------------------------
   ?- find_book_by_author(jk_rowling, A, Y, G).
   A = harry_potter_1,
   Y = 1997,
   G = fantasy ;
   A = harry_potter_2,
   Y = 1998,
   G = fantasy ;
   A = harry_potter_3,
   Y = 1999,
   G = fantasy.

   ?- find_borrower_by_id(12345, A, B).
   A = john,
   B = doe.

   ?- find_book_by_title(harry_potter_1, A, Y, G).
   A = jk_rowling,
   Y = 1997,
   G = fantasy.

   ?- list_borrowed_books.
   Book: harry_potter_1, Author: jk_rowling, Year: 1997, Genre: fantasy, Borrower: john doe
   Book: the_hobbit, Author: jrr_tolkien, Year: 1937, Genre: fantasy, Borrower: jane smith
   Book: the_da_vinci_code, Author: dan_brown, Year: 2003, Genre: thriller, Borrower: jack black
   Book: the_girl_with_the_dragon_tattoo, Author: stieg_larsson, Year: 2005, Genre: mystery, Borrower: john doe
   Book: the_girl_who_played_with_fire, Author: stieg_larsson, Year: 2006, Genre: mystery, Borrower: jane smith
   ========================================================================== */
