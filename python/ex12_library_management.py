"""
EX.NO: 12 - LIBRARY MANAGEMENT SYSTEM (Python Equivalent)
AIM: To simulate a Library Management System using relational records.
"""

BOOKS = [
    {"title": "harry_potter_1", "author": "jk_rowling", "year": 1997, "genre": "fantasy"},
    {"title": "harry_potter_2", "author": "jk_rowling", "year": 1998, "genre": "fantasy"},
    {"title": "harry_potter_3", "author": "jk_rowling", "year": 1999, "genre": "fantasy"},
    {"title": "the_hobbit", "author": "jrr_tolkien", "year": 1937, "genre": "fantasy"},
    {"title": "the_lord_of_the_rings", "author": "jrr_tolkien", "year": 1954, "genre": "fantasy"},
    {"title": "the_da_vinci_code", "author": "dan_brown", "year": 2003, "genre": "thriller"},
    {"title": "angels_and_demons", "author": "dan_brown", "year": 2000, "genre": "thriller"},
    {"title": "digital_fortress", "author": "dan_brown", "year": 1998, "genre": "thriller"},
    {"title": "the_girl_with_the_dragon_tattoo", "author": "stieg_larsson", "year": 2005, "genre": "mystery"},
    {"title": "the_girl_who_played_with_fire", "author": "stieg_larsson", "year": 2006, "genre": "mystery"},
    {"title": "the_girl_who_kicked_the_hornets_nest", "author": "stieg_larsson", "year": 2007, "genre": "mystery"},
]

BORROWERS = [
    {"first_name": "john", "last_name": "doe", "id": 12345},
    {"first_name": "jane", "last_name": "smith", "id": 67890},
    {"first_name": "jack", "last_name": "black", "id": 24680},
]

BORROWED = [
    ("harry_potter_1", 12345),
    ("the_hobbit", 67890),
    ("the_da_vinci_code", 24680),
    ("the_girl_with_the_dragon_tattoo", 12345),
    ("the_girl_who_played_with_fire", 67890),
]

def find_book_by_title(title):
    return [b for b in BOOKS if b["title"] == title]

def find_book_by_author(author):
    return [b for b in BOOKS if b["author"] == author]

def find_borrower_by_id(borrower_id):
    return [b for b in BORROWERS if b["id"] == borrower_id]

def list_borrowed_books():
    results = []
    for book_title, borrower_id in BORROWED:
        book_info = next((b for b in BOOKS if b["title"] == book_title), None)
        borrower_info = next((br for br in BORROWERS if br["id"] == borrower_id), None)
        if book_info and borrower_info:
            line = (f"Book: {book_info['title']}, Author: {book_info['author']}, "
                    f"Year: {book_info['year']}, Genre: {book_info['genre']}, "
                    f"Borrower: {borrower_info['first_name']} {borrower_info['last_name']}")
            results.append(line)
            print(line)
    return results

def main():
    print("=" * 60)
    print("EX.NO.12: LIBRARY MANAGEMENT SYSTEM")
    print("=" * 60)

    print("\n1. Query find_book_by_author('jk_rowling'):")
    for b in find_book_by_author("jk_rowling"):
        print(f"   Title: {b['title']}, Year: {b['year']}, Genre: {b['genre']}")

    print("\n2. Query find_borrower_by_id(12345):")
    for br in find_borrower_by_id(12345):
        print(f"   Name: {br['first_name']} {br['last_name']}")

    print("\n3. Query find_book_by_title('harry_potter_1'):")
    for b in find_book_by_title("harry_potter_1"):
        print(f"   Author: {b['author']}, Year: {b['year']}, Genre: {b['genre']}")

    print("\n4. Query list_borrowed_books:")
    list_borrowed_books()
    print("=" * 60)

if __name__ == "__main__":
    main()
