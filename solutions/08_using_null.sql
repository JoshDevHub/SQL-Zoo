-- using NULL

-- 1. List the teachers who have NULL for their departments
SELECT name FROM teacher
    WHERE dept IS NULL;

-- 3. List all teachers and their departments, even if they lack a department
SELECT teacher.name, dept.name FROM teacher
    LEFT JOIN dept ON teacher.dept = dept.id;

-- 4. List all deparments and their teachers, even if a deparment lacks a teacher
SELECT teacher.name, dept.name FROM teacher
    RIGHT JOIN dept ON teacher.dept = dept.id;

-- 5. Show teacher name and mobile phone, or '07986 444 2266' if they don't have a number
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile_phone
    FROM teacher

-- 6. Show teacher name and dept name with 'None' if there is no dept.
SELECT teacher.name, COALESCE(dept.name, 'None') AS dept_name
    FROM teacher
    LEFT JOIN dept ON teacher.dept = dept.id;

-- 7. Show the number of teachers and the number of mobile phones
SELECT COUNT(name), COUNT(mobile) FROM teacher

-- 8. Show each department and the number of staff.
SELECT dept.name, COUNT(teacher.name) AS staff_number
    FROM teacher
    RIGHT JOIN dept ON dept.id = teacher.dept
    GROUP BY dept.name;

-- 9. Show name of teacher followed by 'Sci' if the teacher is in dept1 or 2
SELECT name, CASE WHEN dept IN (1, 2) THEN 'Sci' ELSE 'Art' END
    FROM teacher;

-- 10. Show name of teacher followed by 'Sci' for depts 1 and 2, 'Art' if dept 3, and 'None' otherwise
SELECT name, CASE WHEN dept in (1, 2) THEN 'Sci'
                  WHEN dept = 3 THEN 'Art'
                  ELSE 'None' END
                  FROM teacher;