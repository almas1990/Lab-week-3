-- Query to display the title and due_date of assignments for the course COMP1234
SELECT title, due_date
FROM  assignments
WHERE course_id = 'COMP1234';

-- Query to find the earliest assignment due date
SELECT min(due_date)
FROM assignments;

-- Query to find the latest assignment due date
SELECT max(due_date)
FROM assignments;

-- Query to find the title and course_id of assignments due on 2024-10-08
SELECT title, course_id
FROM assignments
WHERE due_date = 2024-10-08;

-- Query to display the title and due_date of assignments due in October 2024
SELECT title, due_date
FROM assignments
where due_date LIKE '2024-10%';

-- Query to find the most recent due_date of assignments with a status of "Completed"
SELECT max(due_date), status
from assignments
where status ='Completed'

-- Optional Task
-- Query to find the total number of assignments with a status of "Not Started"
SELECT count(status)
from assignments
where status = 'Not Started';

-- Query to find course_id and course_name of courses with labs on Tuesday
SELECT course_name, course_id
FROM courses
where lab_time LIKE 'Tue%';

-- Query to join courses and assignments tables
SELECT *
from courses
         JOIN assignments
              ON courses.course_id = assignments.course_id;

--Retrieve All Rows from Courses Table
SELECT * FROM courses;


--Retrieve First 10 Rows from Assignments Table
SELECT * FROM assignments
LIMIT 10;

--Count Total Rows in Courses Table
SELECT count(*) FROM courses;

--Find Earliest Assignment Due Date
SELECT min(due_date) FROM assignments;

--Find Courses with Names Starting with 'Intro'
SELECT *
FROM  courses
WHERE course_name LIKE 'Intro%';

--Find Non-Completed Assignments Ordered by Due Date
SELECT *
FROM  assignments
WHERE status != 'Completed'
ORDER BY due_date;

-- Filter and Sort Assignments for Specific Conditions
SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'
  AND course_id LIKE 'COMM%'
  AND due_date < '2024-12-31'
ORDER BY due_date;
