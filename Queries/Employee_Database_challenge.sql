-- retirement titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no);

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title

INTO unique_titles
FROM retirement_titles AS r
ORDER BY r.emp_no ASC, r.to_date DESC;

-- Count of employess grouped by title, create retiring_titles table
SELECT COUNT(*) AS emp_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY (emp_count) DESC;

-- Mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE ((e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
	   AND (de.to_date = '9999-01-01'))
ORDER BY (e.emp_no);

-- Additional Queries

-- 1) Count unique titles for mentorship_eligibility group
SELECT title, COUNT(*) AS emp_count
FROM mentorship_eligibility
GROUP BY title
ORDER BY (emp_count) DESC;

-- 2) Identify individuals with mentorship eligibilty that have held titles the longest
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE ((e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
	   AND (de.to_date = '9999-01-01'))
ORDER BY (e.emp_no), (de.from_date) ASC;