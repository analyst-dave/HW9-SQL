DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_mgr;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  dept_no VARCHAR(20) PRIMARY KEY,
  dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE titles (
  title_id VARCHAR(20) PRIMARY KEY,
  title VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY,
  emp_title VARCHAR(20) REFERENCES titles(title_id),
  birth_date TIMESTAMPTZ,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  sex VARCHAR(6) NOT NULL,
  hire_date TIMESTAMPTZ
);

CREATE TABLE dept_emp (
  emp_no INTEGER REFERENCES employees(emp_no),
  dept_no VARCHAR(20) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_mgr (
  dept_no VARCHAR(20) REFERENCES departments(dept_no),
  emp_no INTEGER REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE salaries (
  emp_no INTEGER REFERENCES employees(emp_no),
  salary INTEGER
);

COPY departments(dept_no,dept_name) 
FROM 'F:/Users/David/Downloads/data/departments.csv' DELIMITER ',' CSV HEADER;

COPY titles(title_id,title) 
FROM 'F:/Users/David/Downloads/data/titles.csv' DELIMITER ',' CSV HEADER;

COPY employees(emp_no,emp_title,birth_date,first_name,last_name,sex,hire_date) 
FROM 'F:/Users/David/Downloads/data/employees.csv' DELIMITER ',' CSV HEADER;

COPY dept_emp(emp_no,dept_no) 
FROM 'F:/Users/David/Downloads/data/dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY dept_mgr(dept_no,emp_no) 
FROM 'F:/Users/David/Downloads/data/dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY salaries(emp_no,salary) 
FROM 'F:/Users/David/Downloads/data/salaries.csv' DELIMITER ',' CSV HEADER;