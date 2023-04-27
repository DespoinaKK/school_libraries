CREATE DATABASE school_libraries;
USE school_libraries;
CREATE TABLE schools (
	school_id INT AUTO_INCREMENT,
	name VARCHAR(70) NOT NULL,
	director VARCHAR(70) NOT NULL,
	address VARCHAR(100) NOT NULL,
	city VARCHAR(40) NOT NULL,
	post_code CHAR(5) NOT NULL,
	telephone_number CHAR(10) NOT NULL,
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY(school_id)
);

CREATE TABLE books (
	title VARCHAR(80) NOT NULL,
	publisher VARCHAR(40) NOT NULL,
	author VARCHAR(40) NOT NULL,
	ISBN CHAR(13) NOT NULL,
	page_number INT NOT NULL, 
	summary VARCHAR(3000) NOT NULL,
	book_language VARCHAR(20) NOT NULL,
	keywords VARCHAR(150) NOT NULL,
	PRIMARY KEY(ISBN)
);

CREATE TABLE author (
	author_id INT AUTO_INCREMENT,
	name VARCHAR(70) NOT NULL,
	PRIMARY KEY(author_id)
);

CREATE TABLE author_book (
	ISBN CHAR(13),
	author_id INT,
	CONSTRAINT PK_author_book
	PRIMARY KEY (ISBN, author_id),
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (author_id) REFERENCES author (author_id)
);

--front_page BLOB NOT NULL,
CREATE TABLE users (
	id_user INT AUTO_INCREMENT,
	name VARCHAR(70) NOT NULL,
	username VARCHAR(15) NOT NULL,
	password VARCHAR(15) NOT NULL,
	school_id INT,
	role INT,
	birthday DATE,
	FOREIGN KEY (school_id) REFERENCES schools(school_id),
	PRIMARY KEY(id_user)
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY(category_id)
);

CREATE TABLE book_category (
	ISBN CHAR(13),
	category_id INT,
	CONSTRAINT PK_book_category
	PRIMARY KEY (ISBN, category_id),
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE book_school (
	copies_available INT,
	ISBN CHAR(13),
	school_id INT,
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (school_id) REFERENCES schools (school_id),
	CONSTRAINT book_school_pk PRIMARY KEY (ISBN, school_id)
);

CREATE TABLE reviews (
	review_id INT AUTO_INCREMENT,
	star_review INT NOT NULL,
	review_text VARCHAR(500),
	ISBN CHAR(13),
	id_user INT,
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (id_user) REFERENCES users (id_user),
	PRIMARY KEY (review_id)
);

CREATE TABLE lending (
	lending_id INT AUTO_INCREMENT,
	borrow_date DATE,
	return_date DATE,
	id_user INT,
	ISBN CHAR(13),
	school_id INT,
	FOREIGN KEY (id_user) REFERENCES users (id_user),
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (school_id) REFERENCES schools(school_id),
	PRIMARY KEY (lending_id)
);

CREATE TABLE booking (
	booking_id INT AUTO_INCREMENT,
	date_of_booking TIMESTAMP,
	id_user INT,
	ISBN CHAR(13),
	school_id INT,
	FOREIGN KEY (id_user) REFERENCES users (id_user),
	FOREIGN KEY (ISBN) REFERENCES books (ISBN),
	FOREIGN KEY (school_id) REFERENCES schools(school_id),
	PRIMARY KEY (booking_id)
);

