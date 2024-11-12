CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publisher_id INT,
    year INT,
    price DECIMAL(10, 2)
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE book_reviews (
    review_id INT PRIMARY KEY,
    book_id INT,
    rating INT,
    review_text TEXT
);

INSERT INTO authors (author_id, first_name, last_name, country) VALUES
(1, 'John', 'Doe', 'USA'),
(2, 'Jane', 'Smith', 'UK'),
(3, 'Emily', 'Johnson', 'Canada'),
(4, 'Michael', 'Brown', 'Australia'),
(5, 'Sarah', 'Davis', 'New Zealand');

INSERT INTO publishers (publisher_id, name, city, country) VALUES
(1, 'Penguin Books', 'New York', 'USA'),
(2, 'HarperCollins', 'London', 'UK'),
(3, 'Simon & Schuster', 'Toronto', 'Canada'),
(4, 'Hachette', 'Sydney', 'Australia'),
(5, 'Macmillan', 'Auckland', 'New Zealand');

INSERT INTO books (book_id, title, author_id, publisher_id, year, price) VALUES
(1, 'Book One', 1, 1, 2020, 19.99),
(2, 'Book Two', 2, 2, 2019, 25.99),
(3, 'Book Three', 3, 3, 2021, 15.99),
(4, 'Book Four', 4, 4, 2018, 29.99),
(5, 'Book Five', 5, 5, 2022, 22.99);

INSERT INTO book_reviews (review_id, book_id, rating, review_text) VALUES
(1, 1, 5, 'Excellent!'),
(2, 2, 4, 'Very good'),
(3, 3, 3, 'Average'),
(4, 4, 2, 'Not great'),
(5, 5, 1, 'Poor');

SELECT * FROM books;
SELECT title AS BookTitle, price AS BookPrice FROM books;
SELECT * FROM books ORDER BY price DESC;
SELECT * FROM books WHERE year > 2020;
SELECT * FROM books LIMIT 3;
SELECT * FROM books WHERE author_id IN (1, 3, 5);
SELECT * FROM books WHERE price BETWEEN 20 AND 30;
SELECT * FROM books WHERE title LIKE '%Book%';
SELECT * FROM books WHERE book_id NOT IN (SELECT book_id FROM book_reviews);
SELECT rating, COUNT(*) FROM book_reviews GROUP BY rating;

SELECT b.title, a.first_name, a.last_name, p.name 
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN publishers p ON b.publisher_id = p.publisher_id;

SELECT AVG(price) AS AveragePrice FROM books;