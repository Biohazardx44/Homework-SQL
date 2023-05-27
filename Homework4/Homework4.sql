USE SEDC_ACADEMY_HOMEWORK
GO

-- Calculate the count of all grades per Teacher in the system
CREATE VIEW dbo.vw_TeacherGradeCount AS
SELECT t.ID AS TeacherID, t.FirstName, t.LastName, COUNT(g.ID) AS GradeCount
FROM dbo.Teacher AS t
LEFT JOIN dbo.Grade AS g ON t.ID = g.TeacherID
GROUP BY t.ID, t.FirstName, t.LastName
GO

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.ID AS TeacherID, t.FirstName, t.LastName, COUNT(g.ID) AS GradeCount
FROM dbo.Teacher AS t
LEFT JOIN dbo.Grade AS g ON t.ID = g.TeacherID
INNER JOIN dbo.Student AS s ON g.StudentID = s.ID
WHERE s.ID < 100
GROUP BY t.ID, t.FirstName, t.LastName

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.ID AS StudentID, s.FirstName, s.LastName, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM dbo.Student AS s
LEFT JOIN dbo.Grade AS g ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT TeacherID, FirstName, LastName, GradeCount
FROM dbo.vw_TeacherGradeCount
WHERE GradeCount > 200;

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
-- List Student First Name and Last Name next to the other details from previous query
SELECT s.ID AS StudentID, s.FirstName, s.LastName, COUNT(g.ID) AS GradeCount, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM dbo.Student AS s
LEFT JOIN dbo.Grade AS g ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW dbo.vv_StudentGrades AS
SELECT StudentID, COUNT(ID) AS GradeCount
FROM dbo.Grade
GROUP BY StudentID
GO

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW dbo.vv_StudentGrades AS
SELECT s.FirstName, s.LastName, COUNT(g.ID) AS GradeCount
FROM dbo.Student AS s
LEFT JOIN dbo.Grade AS g ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName
GO

-- List all rows from view ordered by biggest Grade Count
SELECT *
FROM dbo.vv_StudentGrades
ORDER BY GradeCount DESC