-- Create schemas

-- AFTER CREATING TABLES, STOP TO IMPORT CSVs BEFORE CONTINUING TO FKs

-- Create tables
CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(30) NOT NULL,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS emps
(
    emp_no INTEGER NOT NULL,
    title_id VARCHAR(30) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(30),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_mgr
(
    dept_no VARCHAR(30) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS depts
(
    dept_no VARCHAR(30) NOT NULL,
    dept_name VARCHAR(30),
    PRIMARY KEY(dept_no)
);

-- HOLD UP! IMPORT CSVs BEFORE CREATING FKs

-- Create FKs
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES emps(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES emps(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_mgr
    ADD    FOREIGN KEY (emp_no)
    REFERENCES emps(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE emps
    ADD    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_mgr
    ADD    FOREIGN KEY (dept_no)
    REFERENCES depts(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES depts(dept_no)
    MATCH SIMPLE
;
    

-- Create Indexes

