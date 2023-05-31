USE SEDC_ACADEMY_HOMEWORK
GO

--Homework 1
CREATE PROCEDURE dbo.sp_CreateGrade (
    @StudentID INT,
    @TeacherID INT,
	@CourseID INT,
    @Grade TINYINT,
    @Comment NVARCHAR(500),
    @CreatedDate DATETIME,
    @TotalGrades INT OUTPUT,
    @MaxGrade TINYINT OUTPUT)
AS
BEGIN
	/*
		Created by: Nikola Ilievski
		Created date: 31.05.2023
		Ticket Number: 420
		Description: 
			- Inserts the grade header info, 
			- Gets the total number of grades for the student, 
			- Gets the MAX grade for the student and teacher.
	*/

    INSERT INTO dbo.Grade (StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
    VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate);

    SELECT @TotalGrades = COUNT(*) FROM dbo.Grade WHERE StudentID = @StudentID;

    SELECT @MaxGrade = MAX(Grade) FROM dbo.Grade WHERE StudentID = @StudentID AND TeacherID = @TeacherID
END
GO

DECLARE @TotalGrades INT;
DECLARE @MaxGrade TINYINT;
DECLARE @CreatedDate DATETIME = GETDATE();

EXEC dbo.sp_CreateGrade
    @StudentID = 169,
    @TeacherID = 55,
    @CourseID = 5,
    @Grade = 10,
    @Comment = 'Random comment',
    @CreatedDate = @CreatedDate,
    @TotalGrades = @TotalGrades OUTPUT,
    @MaxGrade = @MaxGrade OUTPUT;

SELECT @TotalGrades AS TotalGrades;
SELECT @MaxGrade AS MaxGrade;
GO

--Homework 2
CREATE PROCEDURE dbo.sp_CreateGradeDetail (
    @GradeID INT,
    @AchievementTypeID INT,
    @AchievementPoints DECIMAL(10, 2),
    @AchievementMaxPoints DECIMAL(10, 2),
    @AchievementDate DATE,
    @GradePoints DECIMAL(10, 2) OUTPUT)
AS
BEGIN
    /*
        Created by: Nikola Ilievski
        Created date: 31.05.2023
		Ticket Number: 421
        Description:
            - Add details for a specific grade, 
            - Calculate the grade points based on the formula.
    */

    INSERT INTO GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

    SELECT @GradePoints = SUM(CAST(gd.AchievementPoints AS DECIMAL(10, 2)) / gd.AchievementMaxPoints * [at].ParticipationRate)
    FROM dbo.GradeDetails AS gd
    INNER JOIN dbo.AchievementType AS [at] ON gd.AchievementTypeID = [at].ID
    INNER JOIN dbo.Grade AS g ON gd.GradeID = g.ID
    WHERE gd.GradeID = @GradeID;
END
GO

DECLARE @GradePoints DECIMAL(10, 2);
DECLARE @AchievementDate DATETIME = GETDATE();

EXEC dbo.sp_CreateGradeDetail
    @GradeID = 20003,
    @AchievementTypeID = 1,
    @AchievementPoints = 80,
    @AchievementMaxPoints = 100,
    @AchievementDate = @AchievementDate,
    @GradePoints = @GradePoints OUTPUT;

SELECT @GradePoints AS GradePoints;