CREATE DATABASE crm_for_isp;
USE crm_for_isp;

-- ===== Admin Table =====
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

INSERT INTO admin (name, password)
VALUES ('admin', 'admin');

-- ===== Admin Login Table =====
CREATE TABLE adminlogin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100)
);

-- ===== Customer Table =====
CREATE TABLE customer_db (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- ===== Complaint Table =====
CREATE TABLE complaint_db (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    complaint TEXT,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer_db(id)
);

-- ===== Serviceman Table =====
CREATE TABLE serviceman_db (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    area VARCHAR(100)
);