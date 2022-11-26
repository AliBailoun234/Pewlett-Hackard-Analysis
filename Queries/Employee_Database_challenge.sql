SELECT emp_no, first_name, last_name FROM employees;
SELECT title, from_date, to_date FROM title;
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ts.title,
	ts.from_date,
	ts.to_date,
	em.birth_date
INTO retirement_titles
FROM title as ts
LEFT JOIN employees as em
ON em.emp_no = ts.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT emp_no, first_name, last_name, title FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
SELECT * FROM unique_titles;

SELECT COUNT(emp_no) AS employ_no, title
INTO retiring_title
FROM unique_titles
GROUP BY title
ORDER BY employ_no DESC;
SELECT * FROM retiring_title;