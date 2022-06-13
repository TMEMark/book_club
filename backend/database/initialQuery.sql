CREATE TABLE genres (
    genre_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_name varchar(255) NOT NULL
);

CREATE TABLE authors (
    author_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    author_name varchar(255) NOT NULL,
    author_surname varchar(255) NOT NULL,
    author_date_of_birth date NOT NULL
);

CREATE TABLE books (
    book_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    book_name varchar(255) NOT NULL,
    book_author_id int(11) NULL,
    book_genre_id int(11) NOT NULL,
    FOREIGN KEY (book_author_id) REFERENCES authors (author_id) ON DELETE CASCADE,
    FOREIGN KEY (book_genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

CREATE TABLE admins(
    member_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    member_username varchar(255) NOT NULL,
    member_name varchar(255) NOT NULL,
    member_surname varchar(255) NOT NULL,
    member_date_of_birth varchar(255) NOT NULL,
    member_password varchar(255) NOT NULL
);
