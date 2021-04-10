--Retreiving emp_no, firstname and lastname from employees table 
SELECT emp_no, first_name, last_name FROM employees;

--retreiving  title from and to date from titles table
SELECT title, from_date, to_date FROM titles;

--Creating a new table retirement_titles 
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO retirement_titles 
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT emp_no, first_name, last_name, title FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
ti.title
INTO unique_titles
FROM retirement_titles as rt
LEFT JOIN titles as ti
ON rt.emp_no = ti.emp_no
ORDER BY rt.emp_no asc, ti.to_date desc;

--retrieve the number of titles from the Unique Titles table.
SELECT COUNT(emp_no)
FROM unique_titles;

-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC

SELECT emp_no, first_name, last_name, birth_date FROM employees;
SELECT from_date, to_date FROM dept_emp;
SELECT title from titles
select * from employees


-- create a Mentorship Eligibility table for current employees who were born between January and December 1965
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
ti.from_date,
ti.to_date
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

