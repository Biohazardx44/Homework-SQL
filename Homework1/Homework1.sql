CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE dbo.Student (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(200) NOT NULL,
    LastName VARCHAR(200) NOT NULL,
    DateOfBirth DATE NOT NULL,
    EnrolledDate DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    NationalIDNumber INT NOT NULL,
    StudentCardNumber SMALLINT NOT NULL
)

CREATE TABLE dbo.Teacher (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(200) NOT NULL,
    LastName VARCHAR(200) NOT NULL,
    DateOfBirth DATE NOT NULL,
    AcademicRank VARCHAR(100) NULL,
    HireDate DATE NOT NULL
)

CREATE TABLE dbo.Grade (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StudentID SMALLINT NOT NULL,
    CourseID SMALLINT NOT NULL,
    TeacherID SMALLINT NOT NULL,
    Grade VARCHAR(10) NULL,
    Comment VARCHAR(500) NULL,
    CreatedDate DATE NULL
)

CREATE TABLE dbo.Course (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(200) NOT NULL,
    Credit SMALLINT NULL,
    AcademicYear SMALLINT NOT NULL,
    Semester VARCHAR(100) NULL
)

CREATE TABLE dbo.GradeDetails (
    Id INT PRIMARY KEY IDENTITY(1,1),
    GradeID SMALLINT NOT NULL,
    AchievementTypeID SMALLINT NOT NULL,
    AchievementPoints TINYINT NULL,
    AchievementMaxPoints TINYINT NULL,
    AchievementDate DATE NULL
)

CREATE TABLE dbo.AchievementType (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(200) NOT NULL,
    [Description] VARCHAR(500) NULL,
    ParticipationRate DECIMAL NULL
)