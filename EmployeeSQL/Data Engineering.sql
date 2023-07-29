-- Create tables and drop if they already exist cascade if they are dependant on another table

DROP TABLE titles CASCADE;

CREATE TABLE titles (
	title_id varchar NOT NULL,
	title varchar,
	PRIMARY KEY (title_id)
);

DROP TABLE employees CASCADE;

-- Changing the databases datestyle to MDY to import CSV file correctly
AlTER DATABASE "EmployeeSQL" SET datestyle TO "ISO, MDY"; 

CREATE TABLE employees (
	emp_no int NOT NULL,
	emp_title_id varchar NOT NULL,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

DROP TABLE departments CASCADE;

CREATE TABLE departments (
	dept_no varchar NOT NULL,
	dept_name varchar,
	PRIMARY KEY (dept_no)
);

DROP TABLE dept_emp CASCADE; 

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

DROP TABLE dept_managers CASCADE;

CREATE TABLE dept_managers (
	dept_no varchar NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

DROP TABLE salaries CASCADE;

CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);