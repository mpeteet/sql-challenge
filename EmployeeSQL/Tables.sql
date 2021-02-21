-- Run commands to drop tables if they exist
DROP TABLE if exists departments;
DROP TABLE if exists employees;
DROP TABLE if exists dept_emp;
DROP TABLE if exists dept_mgr;
DROP TABLE if exists dept_salaries;
DROP TABLE if exists titles;

-- Create tables in the employees database

-- Create the departments tables
CREATE TABLE "departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dep_name" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
-- Confirm the table exists and can be queried
SELECT * FROM departments;

-- Creat the employees tables
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(10)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
-- Confirm the table exists and can be queried
SELECT * FROM employees;

-- Create the dept_emp table
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);
-- Confirm the table exists and can be queried
SELECT * FROM dept_emp;

-- Create the dept_mgr table
CREATE TABLE "dept_mgr" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_mgr" PRIMARY KEY (
        "dept_no","emp_no"
     )
);
-- Confirm the table exists and can be queried
SELECT * FROM dept_mgr;


-- Create the salaries table
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
-- Confirm the table exists and can be queried
SELECT * FROM salaries;

-- Create the titles tables
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- Confirm the table exists and can be queried
SELECT * FROM titles;


-- Creating foreign keys
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_mgr" ADD CONSTRAINT "fk_dept_mgr_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_mgr" ADD CONSTRAINT "fk_dept_mgr_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");