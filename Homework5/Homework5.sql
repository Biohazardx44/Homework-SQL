USE SEDC_ACADEMY_HOMEWORK

--Declare scalar variable for storing FirstName values
--	Assign value ‘Antonio’ to the FirstName variable
--	Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--	Fill the table variable with all Female students
DECLARE @FemaleStudents TABLE (
    StudentId INT,
    StudentName NVARCHAR(200),
    DateOfBirth DATE
)

INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, CONCAT(FirstName, ' ', LastName) AS StudentName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

SELECT *
FROM @FemaleStudents

--Declare temp table that will contain LastName and EnrolledDate columns
--	Fill the temp table with all Male students having First Name starting with ‘A’
--	Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudents (
    LastName NVARCHAR(100),
    EnrolledDate DATE
)

INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT *
FROM #MaleStudents
WHERE LEN(LastName) = 7;

--Find all teachers whose FirstName length is less than 5 and
--	the first 3 characters of their FirstName and LastName are the same
SELECT *
FROM dbo.Teacher
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3);