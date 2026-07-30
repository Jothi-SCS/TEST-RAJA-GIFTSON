-- ===========================================
-- Assignment: Create CollegeDB and Department Table
-- ===========================================

-- Step 1: Create the database
-- Write your SQL statement below


-- Step 2: Select the database
-- Write your SQL statement below


-- Step 3: Create the Department table
/*
Table Name: Department

Fields:
------------------------------------------
DepartmentID    Number(5)   Primary Key
DepartmentName  Varchar(20)
HOD             Varchar(20)
------------------------------------------
*/

-- Write your CREATE TABLE statement below
-- Step 1: Create the Database
CREATE DATABASE CollegeDB;

-- Step 2: Select the Database
USE CollegeDB;

-- Step 3: Create the Department Table
CREATE TABLE Department (
    DepartmentID INT(5) PRIMARY KEY,
    DepartmentName VARCHAR(20),
    HOD VARCHAR(20)
);
