CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE dbo.Student (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(200),
    LastName VARCHAR(200),
    DateOfBirth DATE,
    EnrolledDate DATE,
    Gender VARCHAR(10),
    NationalIDNumber INT,
    StudentCardNumber SMALLINT
)

CREATE TABLE dbo.Teacher (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(200),
    LastName VARCHAR(200),
    DateOfBirth DATE,
    AcademicRank VARCHAR(100),
    HireDate DATE
)

CREATE TABLE dbo.Grade (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StudentID SMALLINT,
    CourseID SMALLINT,
    TeacherID SMALLINT,
    Grade VARCHAR(10),
    Comment VARCHAR(500),
    CreatedDate DATE
)

CREATE TABLE dbo.Course (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(200),
    Credit SMALLINT,
    AcademicYear SMALLINT,
    Semester VARCHAR(100)
)

CREATE TABLE dbo.GradeDetails (
    Id INT PRIMARY KEY IDENTITY(1,1),
    GradeID SMALLINT,
    AchievementTypeID SMALLINT,
    AchievementPoints TINYINT,
    AchievementMaxPoints TINYINT,
    AchievementDate DATE
)

CREATE TABLE dbo.AchievementType (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(200),
    [Description] VARCHAR(500),
    ParticipationRate DECIMAL
)