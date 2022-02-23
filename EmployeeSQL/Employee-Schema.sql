-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OXIy7v
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- SQL Schema for Employee DB

CREATE TABLE Titles (
    title_id varchar(5)   NOT NULL,
    title varchar(80)   NOT NULL,
    CONSTRAINT  pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Employee (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(45)   NOT NULL,
    last_name varchar(45)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_Manager PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE Dept (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(100)   NOT NULL,
    CONSTRAINT pk_Dept PRIMARY KEY (
        dept_no
     )
);

 
CREATE TABLE Dept_Employee (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT pk_Dept_Employee PRIMARY KEY (
        emp_no,dept_no
     )
);

-- Adding a Serial Key because emp_no is not unique
CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Manager ADD CONSTRAINT fk_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Dept (dept_no);

ALTER TABLE Manager ADD CONSTRAINT fk_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Dept (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

 
