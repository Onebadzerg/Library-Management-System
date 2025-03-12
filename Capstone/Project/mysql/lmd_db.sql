
create database lms_db;

use lms_db;

/*-- Creating Librarian(Admin) Table */
CREATE TABLE Librarian 
(
    librarian_id Varchar(100) PRIMARY KEY, 
    librarian_name VARCHAR(100) NOT NULL,
    librarian_password varchar(100) Not null
   
);
/*-- Creating Member(user) table */
CREATE TABLE Member
(
    member_id Varchar(100) PRIMARY KEY, 
    member_name VARCHAR(100) NOT NULL,
    member_password varchar(100) Not null,
    member_email varchar(100) not null,
    member_hp varchar(100) not null
);



/* 
Creating book table
1)As isbn is a unique book indentifier, it is set as a primary key
2)The book status is set to enum because it allows values to be preset like a dropdown list in excel and you can set a default value as well.
3) having a book added date allows a user to search for new or old books */

CREATE TABLE Books (
    book_isbn VARCHAR(20) PRIMARY KEY, 
    book_title VARCHAR(255) NOT NULL,
    book_author VARCHAR(255) NOT NULL,
    book_publisher VARCHAR(255),
    book_publication_year YEAR,
    book_genre VARCHAR(100),
    book_language VARCHAR(50),
        book_quantity INT DEFAULT 1,
    book_status ENUM('Available', 'Borrowed', 'Reserved') DEFAULT 'Available',
    book_added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*creating a loan table to monitor which user borrowed which book  */

CREATE TABLE loan_table (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,         
    book_isbn INT NOT NULL,         
    borrowed_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status ENUM('Borrowed','Returned','Overdue') DEFAULT 'Borrowed'
);



/* Creating a fine table to monitor and track overdue books*/
CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    borrow_id INT NOT NULL,
    amount DECIMAL(5,2) NOT NULL,
    fine_reason ENUM('Overdue','Lost','Damaged') NOT NULL,
    paid_date DATE,
    status ENUM('Unpaid','Paid') DEFAULT 'Unpaid'
);








