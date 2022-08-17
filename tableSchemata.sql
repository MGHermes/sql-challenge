-- Create the titles table
CREATE TABLE titles (
    -- title_id
    title_id VARCHAR PRIMARY KEY,
    -- title
    title VARCHAR
);

-- Create employees table
CREATE TABLE employees (
    -- emp_no
    emp_no INT PRIMARY KEY,
    -- emp_title_id
    emp_title_id VARCHAR,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    -- birth_date
    birth_date DATE,
    -- first_name
    first_name VARCHAR,
    -- last_name
    last_name VARCHAR,
    -- sex
    sex VARCHAR,
    -- hire_date
    hire_date DATE
);

-- Create departments table
CREATE TABLE departments (
    -- dept_no
    dept_no VARCHAR PRIMARY KEY,
    -- dept_name
    dept_name VARCHAR
);

-- Create dept_manager table
CREATE TABLE dept_manager (
    -- dept_no
    dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    -- emp_no
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    -- primary key
    PRIMARY KEY (dept_no, emp_no)
);

-- Create dept_employees table
CREATE TABLE dept_employees (
    -- emp_no
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    -- dept_no
    dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    -- primary key
    PRIMARY KEY (emp_no, dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
    -- emp_no
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    -- salary
    salary INT
);