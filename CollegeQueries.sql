/*Find the lowest GPA of students applying to CS*/
SELECT MIN(GPA) AS GPA, "Bryson White"
FROM Student
WHERE sID in (SELECT sID FROM Apply WHERE major = 'CS');

/*Find the lowest GPA of students applying to CS*/
SELECT MAX(GPA) AS GPA, "Bryson White"
FROM Student
WHERE sID in (SELECT sID FROM Apply WHERE major = 'CS');

/*Find the minimum and 
maximum GPAs of applicants to each college and major*/
SELECT cName, major, MIN(GPA), MAX(GPA), "Bryson White" 
FROM Student, Apply
WHERE Student.sID = Apply.sID
GROUP BY cName, major
ORDER BY cName;

/*Find the total college enrollments by state*/
SELECT state, SUM(Enrollment), "Bryson White"
FROM College
GROUP BY state;

/*Find the average GPA of students who applied to CS*/
SELECT AVG(GPA) Average_GPA, "Bryson White"
FROM Student JOIN (SELECT DISTINCT sID FROM Apply 
WHERE major = 'CS' GROUP BY sID) 
AS Apply ON Student.sID = Apply.sID;

/*Find the amount by which the average GPA of students applying to CS 
exceeds the average of students not applying to CS*/
SELECT CS.avgGPA - nonCS.avgGPA, "Bryson White"
FROM(SELECT AVG(GPA) as avgGPA FROM Student
WHERE sID IN (
	SELECT sID FROM Apply WHERE major = 'CS')) as CS,
(SELECT AVG(GPA) as avgGPA FROM Student 
WHERE sID NOT IN (
	SELECT sID FROM Apply where major = 'CS')) as nonCS;

/*Find the number of rows in the Student table*/
SELECT COUNT(sID) Total_Students, "Bryson White"
FROM Student;

/*Find the number of distinct students applying to Cornell*/
SELECT COUNT(cornell.sID) Students_Cornell, "Bryson White"
FROM (SELECT DISTINCT sID FROM Apply WHERE cName = 'Cornell') as cornell;

/*Return each student's sid and the 
number of colleges that the student has applied to*/
SELECT Student.sID, COUNT(DISTINCT cName), "Bryson White"
FROM Student, Apply
WHERE Student.sID = Apply.sID
GROUP BY sID;

/*Find the name, sid of each student, 
and the number of colleges that he/she applied to*/
SELECT sName, Student.sID, COUNT(DISTINCT cName), "Bryson White"
FROM Student, Apply
WHERE Student.sID = Apply.sID
GROUP BY sName, sID;

/*Find the colleges with fewer than 5 applications*/
SELECT cName, "Bryson White"
FROM Apply
GROUP BY cName HAVING count(sID) < 5;

SELECT *
FROM Student;
Insert into Student values (432, 'Kevin', null, 1500);
Insert into Student values (321, 'Lori', null, 2500);
SELECT * 
FROM Student;

SELECT COUNT(*)
FROM Student;

SELECT count(GPA)
FROM Student;

/*Delete Students that have a NULL GPA*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Student WHERE GPA is null;



