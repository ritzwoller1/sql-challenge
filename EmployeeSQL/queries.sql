--1. list the following details of each employee: employee number, last name, first name, sex, and salary

Select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
From employees
LEFT JOIN salaries
On employees.emp_no = salaries.emp_no
ORDER BY emp_no

--2. list employees who were hired in 1986.

SELECT  *from employees
where DATE_PART('year',hire_date) = 1986
order by emp_no;


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT department_manager.dept_no, 
departments.dept_name,
department_manager.emp_no,
employees.last_name, 
employees.first_name
From public.department_manager
LEFT JOIN public.departments
ON public.department_manager.dept_no = public.departments.dept_no
LEFT JOIN public.employees 
ON public.department_manager.emp_no = public.employees.emp_no
ORDER BY emp_no;


--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
department_employee.dept_no,
departments.dept_name
FROM employees 
INNER JOIN department_employee ON employees.emp_no=department_employee.emp_no
INNER JOIN departments ON departments.dept_no=department_employee.dept_no
order by emp_no;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    dept_emp.emp_no, 
    employees.last_name, 
    employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;