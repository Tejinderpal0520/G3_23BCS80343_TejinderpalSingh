Session 4
-- DROP TABLE STUDENT
-- DROP TABLE  Enrollments 
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);



CREATE TABLE Enrollments (
    student_id INT,
    course VARCHAR(50)
);


INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Enrollments (student_id, course) VALUES
(1, 'DBMS'),
(3, 'Java'),
(5, 'Python');



-- SELECT s.student_id, s.student_name From Student as s 
-- WHERE s.student_id NOT IN (SELECT student_id from Enrollments)

SELECT s.student_id, s.student_name From Student as s 
LEFT JOIN  Enrollments as e
ON e.student_id = s.student_id
WHERE e.student_id IS NULL

