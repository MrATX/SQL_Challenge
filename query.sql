--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, salaries.salary
FROM emps as e
INNER JOIN salaries ON e.emp_no=salaries.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM emps
WHERE hire_date::text LIKE '1986-%-%';

--3.List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT dept_mgr.dept_no,depts.dept_name,emps.emp_no, emps.last_name, emps.first_name
FROM emps, dept_mgr, depts
WHERE dept_mgr.emp_no = emps.emp_no
AND dept_mgr.dept_no = depts.dept_no;
  
--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM emps, depts, dept_emp
WHERE dept_emp.emp_no = emps.emp_no
AND depts.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM emps
WHERE emps.first_name = 'Hercules'
AND emps.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM emps, depts, dept_emp
WHERE dept_emp.emp_no = emps.emp_no
AND depts.dept_no = dept_emp.dept_no
AND depts.dept_name = 'Sales';
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM emps, depts, dept_emp
WHERE dept_emp.emp_no = emps.emp_no
AND depts.dept_no = dept_emp.dept_no
AND (depts.dept_name = 'Sales' OR depts.dept_name = 'Development')


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,  COUNT(last_name)
FROM emps
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
