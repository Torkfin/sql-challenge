--list the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employee emp
JOIN salaries sal
ON emp.emp_no = sal.emp_no
ORDER BY emp_no ASC;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date ASC;

--List the managers department number, department name, the manager's employee number, last name, first name.
SELECT man.dept_no, d.dept_name, man.emp_no,emp.last_name, emp.first_name
FROM manager man
JOIN employee emp ON man.emp_no = emp.emp_no
JOIN dept d ON man.dept_no = d.dept_no;

--List the department of each employee with employee number, last_name, first_name and department name

SELECT  man.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM manager man
JOIN employee emp ON (man.emp_no = emp.emp_no)
JOIN dept ON (dept.dept_no = man.dept_no);


--List first name, last name and sex for employees whose first name is 'Hercules' and last names begin with 'B'
SELECT e.first_name, e.last_name, e.sex
FROM employee e
WHERE first_name = 'Hercules' AND last_name iLIKE 'B%';



--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no,e.last_name,e.first_name,dept.dept_name
FROM employee e
JOIN dept_employee ON (dept_employee.emp_no = e.emp_no)
JOIN dept ON (dept_employee.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employee emp 
JOIN dept_employee de ON (emp.emp_no = de.emp_no)
JOIN dept ON (de.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales' 
OR dept.dept_name = 'Development'


--List the frequency count of employee's last name in desc order
SELECT last_name, COUNT(last_name) AS "Total Last Name"
FROM employee
GROUP BY last_name
ORDER BY "Total Last Name" DESC;

--My boss is a real comedian,  must have been hired mid March.
SELECT *
FROM employee
WHERE employee.emp_no = 499942

