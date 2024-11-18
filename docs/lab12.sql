Concatenate Course Name and Semester:
SELECT CONCAT(course_name, ' - ', semester) AS course_info
FROM courses;

Find Courses with Labs on Fridays:
SELECT course_id, course_name, lab_time
from courses
where lab_time= 'Friday';

Upcoming Assignments:
SELECT id, course_id, title, status, due_date
from assignments
where due_date > DATE('now');

Count Assignments by Status:
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;



Longest Course Name:
SELECT course_id, course_name
FROM courses
WHERE LENGTH(course_name) = (
  SELECT MAX(LENGTH(course_name))
  FROM courses
);


Uppercase Course Names:
SELECT UPPER(course_name) AS course_name_uppercase
FROM courses;



Assignments Due in September:
SELECT title
FROM assignments
WHERE due_date LIKE '%-09-%';


Assignments with Missing Due Dates:
INSERT INTO assignments (course_id, title, status, due_date)
VALUES (1, 'New Assignment', 'Not Started', NULL);

SELECT id, course_id, title, status, due_date
FROM assignments
WHERE due_date IS NULL;


Total Assignments per Course:
SELECT c.course_id, COUNT(a.id) AS total_assignments
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;

Courses Without Assignments (advanced):
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
WHERE a.id IS NULL;

