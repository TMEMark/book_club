CREATE TABLE genres (
    genre_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_name varchar(255) NOT NULL,
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
    FOREIGN KEY books(book_author_id) REFERENCES authors (author_id)
    FOREIGN KEY books(book_genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

CREATE TABLE members(
    member_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    member_username varchar(255) NOT NULL,
    member_name varchar(255) NOT NULL,
    member_surname varchar(255) NOT NULL,
    member_date_of_birth varchar(255) NOT NULL,
    member_password varchar(255) NOT NULL
);

CREATE TABLE groups(
    group_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_name varchar(255) NOT NULL,
    group_administator int(11) NOT NULL
);

CREATE TABLE groups_members(
    group_member_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_member_member_id int(11) NOT NULL,
    group_member_group_id int(11) NOT NULL,

);

CREATE TABLE meeting(
    meeting_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    meeting_time date NOT NULL
    group_id int(11) NOT NULL
);