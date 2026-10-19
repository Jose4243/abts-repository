-- Kensington Community Library Database Schema
CREATE DATABASE IF NOT EXISTS kensington_abts;
USE kensington_abts;

-- 1. Members Table
CREATE TABLE IF NOT EXISTS members (
    member_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    sso_provider VARCHAR(50) DEFAULT 'Local',
    account_status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Books Catalog Table
CREATE TABLE IF NOT EXISTS books (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1
);

-- 3. Loan Transactions Table
CREATE TABLE IF NOT EXISTS loans (
    loan_id VARCHAR(20) PRIMARY KEY,
    member_id VARCHAR(20),
    isbn VARCHAR(20),
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_status VARCHAR(20) DEFAULT 'Borrowed',
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (isbn) REFERENCES books(isbn)
);

-- Seed Data (10+ Records per table)
INSERT INTO members (member_id, full_name, email, password_hash, sso_provider) VALUES
('M-1001', 'Jane Doe', 'jane.doe@kensington.org', '$2b$12$eW8...hash1', 'Google'),
('M-1002', 'John Smith', 'john.smith@kensington.org', '$2b$12$eW8...hash2', 'Local'),
('M-1003', 'Alice Johnson', 'alice.j@kensington.org', '$2b$12$eW8...hash3', 'Microsoft'),
('M-1004', 'Robert Brown', 'robert.b@kensington.org', '$2b$12$eW8...hash4', 'Local'),
('M-1005', 'Emily Davis', 'emily.d@kensington.org', '$2b$12$eW8...hash5', 'Google'),
('M-1006', 'Michael Wilson', 'm.wilson@kensington.org', '$2b$12$eW8...hash6', 'Local'),
('M-1007', 'Sarah Taylor', 's.taylor@kensington.org', '$2b$12$eW8...hash7', 'Google'),
('M-1008', 'David Anderson', 'd.anderson@kensington.org', '$2b$12$eW8...hash8', 'Local'),
('M-1009', 'Laura Thomas', 'l.thomas@kensington.org', '$2b$12$eW8...hash9', 'Microsoft'),
('M-1010', 'James Jackson', 'j.jackson@kensington.org', '$2b$12$eW8...hash10', 'Local');

INSERT INTO books (isbn, title, author, category, total_copies, available_copies) VALUES
('9780141187761', '1984', 'George Orwell', 'Dystopian', 5, 3),
('9780747532699', 'Harry Potter', 'J.K. Rowling', 'Fantasy', 8, 4),
('9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 4, 2),
('9780451524935', 'Fahrenheit 451', 'Ray Bradbury', 'Sci-Fi', 3, 1),
('9780140283334', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 6, 5),
('9780307474278', 'The Da Vinci Code', 'Dan Brown', 'Thriller', 4, 2),
('9780743273565', 'The Catcher in the Rye', 'J.D. Salinger', 'Classic', 5, 4),
('9780618640157', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 7, 3),
('9780316769488', 'Brave New World', 'Aldous Huxley', 'Sci-Fi', 4, 2),
('9780143127741', 'The Alchemist', 'Paulo Coelho', 'Fiction', 6, 6);

INSERT INTO loans (loan_id, member_id, isbn, borrow_date, due_date, return_status) VALUES
('L-5001', 'M-1001', '9780141187761', '2026-10-01', '2026-10-15', 'Borrowed'),
('L-5002', 'M-1002', '9780747532699', '2026-10-02', '2026-10-16', 'Borrowed'),
('L-5003', 'M-1003', '9780061120084', '2026-10-03', '2026-10-17', 'Returned'),
('L-5004', 'M-1004', '9780451524935', '2026-09-20', '2026-10-04', 'Overdue'),
('L-5005', 'M-1005', '9780140283334', '2026-10-05', '2026-10-19', 'Borrowed'),
('L-5006', 'M-1006', '9780307474278', '2026-10-06', '2026-10-20', 'Borrowed'),
('L-5007', 'M-1007', '9780743273565', '2026-09-25', '2026-10-09', 'Overdue'),
('L-5008', 'M-1008', '9780618640157', '2026-10-08', '2026-10-22', 'Borrowed'),
('L-5009', 'M-1009', '9780316769488', '2026-10-10', '2026-10-24', 'Borrowed'),
('L-5010', 'M-1010', '9780143127741', '2026-10-12', '2026-10-26', 'Borrowed');