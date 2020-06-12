--List the following details of each employee: employee number, last name, first name, sex, and salary.
-- (300024 rows total)
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e 
INNER JOIN salaries s ON e.emp_no = s.emp_no
LIMIT 1000;


-- List first name, last name, and hire date for employees who were hired in 1986. 
-- (36150 rows total)
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- (24 rows total)
select dm.dept_no, dm.dept_name, e.emp_no, e.last_name, e.first_name
from (select d.dept_no, d.dept_name, m.emp_no from departments d inner join dept_mgr m on d.dept_no = m.dept_no) dm
INNER JOIN employees e ON e.emp_no = dm.emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-- (331603 rows total)
select dm.dept_name, emp.emp_no, emp.last_name, emp.first_name
from (select d.dept_no, d.dept_name, e.emp_no from departments d inner join dept_emp e on d.dept_no = e.dept_no) dm
INNER JOIN employees emp ON emp.emp_no = dm.emp_no
order by dm.dept_name ASC;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- (20 rows total)
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- (52245 rows total)
select dm.dept_name, emp.emp_no, emp.last_name, emp.first_name
from (select d.dept_no, d.dept_name, e.emp_no from departments d inner join dept_emp e on d.dept_no = e.dept_no where d.dept_name = 'Sales') dm
INNER JOIN employees emp ON emp.emp_no = dm.emp_no;


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- (137952 rows total)
select dm.dept_name, emp.emp_no, emp.last_name, emp.first_name
from (select d.dept_no, d.dept_name, e.emp_no from departments d inner join dept_emp e on d.dept_no = e.dept_no where d.dept_name IN ('Sales','Development')) dm
INNER JOIN employees emp ON emp.emp_no = dm.emp_no;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- (1638 rows total)
select last_name, count(*)
from employees
group by last_name
order by last_name desc;


-- April's Foolsday lol
select dm.dept_name, emp.emp_no, emp.last_name, emp.first_name
from (select d.dept_no, d.dept_name, e.emp_no from departments d inner join dept_emp e on d.dept_no = e.dept_no ) dm
INNER JOIN employees emp ON emp.emp_no = dm.emp_no
where emp.emp_no = 499942;
