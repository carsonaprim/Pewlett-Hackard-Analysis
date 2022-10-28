-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no

WHERE employees.birth_date BETWEEN'1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title

SELECT * FROM retiring_titles