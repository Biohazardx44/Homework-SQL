USE SEDC_ACADEMY_HOMEWORK

-- Find all Students with FirstName = Antonio
SELECT FirstName, LastName
FROM dbo.Student
WHERE FirstName = 'Antonio'

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT FirstName, LastName, DateOfBirth
FROM dbo.Student
WHERE DateOfBirth > '1999-01-01'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT FirstName, LastName, EnrolledDate
FROM dbo.Student
WHERE LastName LIKE 'J%' 
AND EnrolledDate >= '1998-01-01' 
AND EnrolledDate < '1998-02-01'

-- List all Students ordered by FirstName
SELECT FirstName, LastName
FROM dbo.Student
ORDER BY FirstName ASC

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName
FROM dbo.Teacher
UNION
SELECT LastName
FROM dbo.Student

-- Create Foreign key constraints from diagram or with script
ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Student]
FOREIGN KEY(StudentID) REFERENCES [dbo].Student(ID)

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Course]
FOREIGN KEY(CourseID) REFERENCES [dbo].Course(ID)

ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [FK_Grade_Teacher]
FOREIGN KEY(TeacherID) REFERENCES [dbo].Teacher(ID)

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_Grade]
FOREIGN KEY(GradeID) REFERENCES [dbo].Grade(ID)

ALTER TABLE [dbo].[GradeDetails]
ADD CONSTRAINT [FK_GradeDetails_AchievementType]
FOREIGN KEY(AchievementTypeID) REFERENCES [dbo].AchievementType(ID)

-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT CN.[Name] AS CourseName, ATN.[Name] AS AchievementTypeName
FROM dbo.Course AS CN
CROSS JOIN dbo.AchievementType AS ATN

-- List all Teachers without exam Grade
SELECT T.FirstName AS TeacherFirstName, T.LastName AS TeacherLastName, G.TeacherID AS ExamGrade
FROM dbo.Teacher AS T
LEFT JOIN dbo.Grade AS G ON T.ID = G.TeacherID
WHERE G.TeacherID IS NULL