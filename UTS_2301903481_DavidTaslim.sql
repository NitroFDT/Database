-- Case
--NO 1
CREATE DATABASE MajuUniversityDB
USE MajuUniversityDB

CREATE TABLE Program(
	ProgramID INT PRIMARY KEY,
	ProgramName VARCHAR(255)
)

CREATE TABLE Student (
	StudentID CHAR(10) PRIMARY KEY,
	StudentName VARCHAR(255),
	PlaceOfBirth VARCHAR(255),
	DateOfBirth VARCHAR(255),
	ProgramID INT FOREIGN KEY REFERENCES Program(ProgramID),
	[Address] VARCHAR(255)
)

CREATE TABLE ScoreComponent(
	Component VARCHAR(255) PRIMARY KEY,
	[Description] VARCHAR(255),
	[Weight] DECIMAL (4,2)
)


CREATE TABLE Course (
	CourseID VARCHAR(255) PRIMARY KEY,
	CourseName VARCHAR(255),
	Credit INT
)

CREATE TABLE [Weight] (
	Grade VARCHAR(255) PRIMARY KEY,
	ScoreMin INT,
	ScoreMax INT,
	[Weight] DECIMAL (4,2)
)

CREATE TABLE StudentScore (
	StudentID CHAR(10) FOREIGN KEY REFERENCES Student(StudentID),
	Semester INT,
	CourseID VARCHAR(255),
	TotalScore INT,
	Grade VARCHAR(255) FOREIGN KEY REFERENCES [Weight](Grade),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)

CREATE TABLE StudentScoreDetail (
	StudentID CHAR(10) FOREIGN KEY REFERENCES Student(StudentID),
	Semester INT,
	CourseID VARCHAR(255) FOREIGN KEY REFERENCES Course(CourseID),
	Component VARCHAR(255),
	Score INT CHECK (Score BETWEEN 0 AND 100),
)

INSERT INTO Program VALUES (25, 'Computer Science')
INSERT INTO Program VALUES (26, 'Information Systems')
INSERT INTO Program VALUES (44, 'Accounting')
INSERT INTO Program VALUES (45, 'Management')
INSERT INTO Program VALUES (47, 'International Business')
INSERT INTO Program VALUES (77, 'Communication')

INSERT INTO Student VALUES ('2301234234', 'NADYA STUFANY', 'Makasar', '1990-02-24', 45, 'Jl. Kebon Jeruk Raya No. 55 RT 6 RW 7, Kampung Bahagia')
INSERT INTO Student VALUES ('2301234237', 'JUAN KANAM', 'Bandung', '1991-03-01', 45, NULL)
INSERT INTO Student VALUES ('2301234614', 'RANGGA ADATYI', 'Surabaya', '1996-03-11', 26, 'Jl. Mangga Manalagi No. 27 RT 01 RW 02 Kemanggisan')
INSERT INTO Student VALUES ('2301234734', 'SYLIA KUYEPUTRA', 'Jakarta', '1995-01-10', 45, 'Perumahan Ramainya Luar Biasa Blok A1 No. 200 RT 01')
INSERT INTO Student VALUES ('2301234866', 'RYAN RUSLEN', 'Bekasi', '1997-11-05', 25, 'Jalan Petukangan Utara Raya No. 99, Gang Seggol, RT')
INSERT INTO Student VALUES ('2301234885', 'ANDRUW TANAMAS', 'Riau', '1995-02-17', 25, 'Perumahan Alfa Indah Blok C40 No. 76 Tangerang Selatan')
INSERT INTO Student VALUES ('2301234916', 'AAN AGUNG JULEAN', 'Jambi', '1997-07-09', 26, 'Kampung Buah Mangga Harum Manis N0. 5B, Depan Keb')

INSERT INTO ScoreComponent VALUES ('ASG', 'Assignment', 30.00)
INSERT INTO ScoreComponent VALUES ('MID', 'Mid Test', 35.00)
INSERT INTO ScoreComponent VALUES ('FIN', 'Final Test', 35.00)

INSERT INTO Course VALUES ('ACCT6164', 'Financial Accounting', 2)
INSERT INTO Course VALUES ('COMP6141', 'Interactive Computer Graphic', 4)
INSERT INTO Course VALUES ('COMP6143', 'Mobile Multimedia', 4)
INSERT INTO Course VALUES ('COMP6449', 'Machine Learning', 3)
INSERT INTO Course VALUES ('ENGL6171', 'Academic English I', 3)
INSERT INTO Course VALUES ('FINC6067', 'International Financial Management', 2)
INSERT INTO Course VALUES ('ISYS6440', 'Introduction to Business Databases', 4)
INSERT INTO Course VALUES ('MKTG6286', 'Consumer Psychology and Behavior', 4)
INSERT INTO Course VALUES ('MKTG6287', 'Products and Brand Management', 4)
INSERT INTO Course VALUES ('MKTG6288', 'Digital Business and Analytics', 3)

INSERT INTO [Weight] VALUES ('A', 91, 100, 4.00)
INSERT INTO [Weight] VALUES ('A-', 86, 90, 3.67)
INSERT INTO [Weight] VALUES ('B+', 81, 85, 3.33)
INSERT INTO [Weight] VALUES ('B', 76, 80, 3.00)
INSERT INTO [Weight] VALUES ('B-', 71, 75, 2.67)
INSERT INTO [Weight] VALUES ('C+', 66, 70, 2.33)
INSERT INTO [Weight] VALUES ('C', 61, 65, 2.00)
INSERT INTO [Weight] VALUES ('D', 50, 60, 1.00)
INSERT INTO [Weight] VALUES('E', 1, 49, 0.00)
INSERT INTO [Weight] VALUES ('F', 0, 0, 0.00)

INSERT INTO StudentScore VALUES ('2301234734', 20192, 'ACCT6164', 94, 'A')
INSERT INTO StudentScore VALUES ('2301234734', 20192,'COMP6141', 82, 'B+')
INSERT INTO StudentScore VALUES ('2301234734', 20192, 'COMP6143', 87, 'A-')
INSERT INTO StudentScore VALUES ('2301234734', 20192, 'COMP6449', 89, 'A-')
INSERT INTO StudentScore VALUES ('2301234734', 20192, 'ENGL6171', 91, 'A')
INSERT INTO StudentScore VALUES ('2301234734', 20192, 'ISYS6440', 88, 'A-')

INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ACCT6164', 'ASG', 100)
INSERT INTO StudentScoreDetail VALUES('2301234734', 20192, 'ACCT6164', 'MID', 90)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ACCT6164', 'FIN', 95)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6141', 'ASG', 80)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6141', 'MID', 83)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6141', 'FIN', 85)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6143', 'ASG', 91)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6143', 'MID', 85)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6143', 'FIN', 87)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6449', 'ASG', 90)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6449', 'MID', 90)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'COMP6449', 'FIN', 88)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ENGL6171', 'ASG', 100)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ENGL6171', 'MID', 89)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ENGL6171', 'FIN', 87)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ISYS6440', 'ASG', 95)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ISYS6440', 'MID', 90)
INSERT INTO StudentScoreDetail VALUES ('2301234734', 20192, 'ISYS6440', 'FIN', 80)

-- NO 2A
SELECT *
FROM Course
WHERE Credit > 3

--No 2B
SELECT StudentID, StudentName, Program.ProgramID, ProgramName
FROM Student, Program
WHERE Student.ProgramID = Program.ProgramID

-- No 3
SELECT  Semester, Course.CourseID, CourseName,		[Student] = COUNT(Course.CourseID),		[A] = COUNT(CASE WHEN Grade = 'A' THEN 1 ELSE NULL END),		[A-] = COUNT(CASE WHEN Grade = 'A-' THEN 1 ELSE NULL END),		[B+] = COUNT(CASE WHEN Grade = 'B+' THEN 1 ELSE NULL END),		[B] = COUNT(CASE WHEN Grade = 'B' THEN 1 ELSE NULL END),		[B-] = COUNT(CASE WHEN Grade = 'B-' THEN 1 ELSE NULL END)FROM StudentScore, CourseWHERE StudentScore.CourseID = Course.CourseIDGROUP BY Grade,CourseName,Semester,Course.CourseID,CourseName-- No 4SELECT Student.StudentID,		StudentName,		StudentScore.Semester,		[Credit Semester] = SUM(Credit),		[Semester GPA] = CAST(SUM(CASE WHEN Course.CourseID = StudentScore.CourseID THEN Credit END * CASE WHEN w.Grade = StudentScore.Grade THEN w.Weight END)/							SUM(CASE WHEN Course.courseID = StudentScore.CourseID THEN CREDIT END) AS DECIMAL (4,3)),		[Credit Cumulative]		[Cumulative GPA]FROM Student JOIN StudentScore ON Student.StudentID = StudentScore.StudentIDJOIN Course ON Course.CourseID = StudentScore.CourseID JOIN [Weight] w ON w.Grade = StudentScore.GradeJOIN (SELECT [Credit Cumulative] = SUM(Credit),		[Cumulative GPA] = CAST(SUM(CASE WHEN Course.CourseID = StudentScore.CourseID THEN Credit END * CASE WHEN w.Grade = StudentScore.Grade THEN w.Weight END) /								SUM(CASE WHEN Course.CourseID = StudentScore.CourseID THEN Credit END) AS DECIMAL (4,3)), StudentID 		FROM StudentScore JOIN Course ON Course.CourseID = StudentScore.CourseID JOIN [Weight] w ON w.Grade = StudentScore.Grade		GROUP BY StudentID) gg ON StudentScore.StudentID = gg.StudentIDGROUP BY Student.StudentID, StudentName, StudentScore.Semester, [Credit Cumulative], [Cumulative GPA]-- No 5
-- Membuat stored procedure dengan nama Sp_CreateNewStudent untuk
menambahkan data mahasiswa baru pada tabel Student.
CREATE PROCEDURE Sp_CreateNewStudent	@StudentID CHAR(10),	@StudentName VARCHAR(255),	@PlaceOfBirth VARCHAR(255),	@DateOfBirth VARCHAR(255),	@ProgramID INT,	@Address VARCHAR(255)ASBEGIN	INSERT INTO Student VALUES (@StudentID, @StudentName, @PlaceOfBirth, @DateOfBirth, @ProgramID, @Address)END-- No 6
-- Membuat trigger pada tabel StudentScoreDetail dengan nama
Trigger_UpdateStudentSCore. Trigger ini berfungsi untuk menjaga integritas data nilai
pada tabel StudentScore. Trigger ini akan melakukan update pada TotalScore dan Grade
secara otomatis ketika terjadi perubahan (insert, update, delete) pada Score di tabel
StudentScoreDetail.
CREATE TRIGGER Trigger_UpdateStudentScoreON StudentScoreDetailAFTER INSERT, DELETE, UPDATEAS	DECLARE @skor INT	DECLARE @komponen VARCHAR(255)	DECLARE @nilai VARCHAR(255)	DECLARE @IDbaru VARCHAR(255)	DECLARE @courseBaru VARCHAR(255)	DECLARE @totalSkor INT	DECLARE @skorSetelah INT	DECLARE @skorSebelum INTBEGIN	-- INSERT	IF EXISTS(SELECT *				FROM inserted) AND NOT EXISTS (SELECT *												FROM deleted)	BEGIN	SELECT @IDbaru = StudentID	FROM inserted	SELECT @courseBaru = CourseID	FROM inserted	IF NOT EXISTS (SELECT *					FROM StudentScore					WHERE CourseID = @courseBaru AND @IDbaru = StudentID)	BEGIN
	INSERT INTO StudentScore(StudentID,Semester,CourseID,TotalScore,Grade)
	SELECT StudentID,Semester,CourseID,0,'F'
	FROM inserted
	END

	SELECT @skor = Score
	FROM inserted
	SELECT @komponen = Component
	FROM inserted
	SET @skor = CASE @komponen
		WHEN 'ASG' THEN @skor *30/100
		WHEN 'MID' THEN @skor *35/100
		WHEN 'FIN' THEN @skor *35/100
	END

UPDATE StudentScore
	SET TotalScore = TotalScore + @skor 
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	SELECT @totalSkor = TotalScore
	FROM StudentScore
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	IF @totalSkor = 0
		BEGIN
			SET @nilai = 'F'
		END
	IF @totalSkor > 0 AND @totalSkor < 50
		BEGIN
			SET @nilai = 'E'
	END
	IF @totalSkor > 49 AND @totalSkor < 61
		BEGIN
			SET @nilai = 'D'
	END
	IF @totalSkor > 60 AND @totalSkor < 66
		BEGIN
			SET @nilai = 'C'
	END
	IF @totalSkor > 65 AND @totalSkor < 71
		BEGIN
			SET @nilai = 'C+'
	END
	IF @totalSkor > 70 AND @totalSkor < 76
		BEGIN
			SET @nilai = 'B-'
	END
	IF @totalSkor > 75 AND @totalSkor < 81
		BEGIN
			SET @nilai = 'B'
	END
	IF @totalSkor > 80 AND @totalSkor < 86
		BEGIN
			SET @nilai = 'B+'
	END
	IF @totalSkor > 85 AND @totalSkor < 91
		BEGIN
			SET @nilai = 'A-'
	END
	IF @totalSkor > 90 AND @totalSkor < 101
		BEGIN
			SET @nilai = 'A'
	END
UPDATE StudentScore
	SET Grade = @nilai
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
END

-- UPDATE
IF EXISTS (SELECT *
			FROM inserted) AND EXISTS (SELECT * 
										FROM deleted)
BEGIN
	SELECT @IDbaru = StudentID
	FROM inserted
	SELECT @courseBaru = CourseID
	FROM inserted
	SELECT @skorSebelum = Score
	FROM deleted
	SELECT @skorSetelah = Score
	FROM inserted
	SELECT @komponen = Component
	FROM inserted
	SET @skorSetelah = CASE @komponen
		WHEN 'ASG' THEN @skorSetelah *30/100
		WHEN 'MID' THEN @skorSetelah *35/100
		WHEN 'FIN' THEN @skorSetelah *35/100
END
SET @skorSebelum = CASE @komponen
	WHEN 'ASG' THEN @skorSebelum *30/100
	WHEN 'MID' THEN @skorSebelum *35/100
	WHEN 'FIN' THEN @skorSebelum *35/100
END

UPDATE StudentScore
	SET TotalScore = TotalScore - @skorSebelum
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID

UPDATE StudentScore
	SET TotalScore = TotalScore + @skorSetelah
	WHERE @IDbaru=StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	SELECT @totalSkor = TotalScore
	FROM StudentScore
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	IF @totalSkor = 0
		BEGIN
			SET @nilai = 'F'
		END
	IF @totalSkor > 0 AND @totalSkor < 50
		BEGIN
			SET @nilai = 'E'
	END
	IF @totalSkor > 49 AND @totalSkor < 61
		BEGIN
			SET @nilai = 'D'
	END
	IF @totalSkor > 60 AND @totalSkor < 66
		BEGIN
			SET @nilai = 'C'
	END
	IF @totalSkor > 65 AND @totalSkor < 71
		BEGIN
			SET @nilai = 'C+'
	END
	IF @totalSkor > 70 AND @totalSkor < 76
		BEGIN
			SET @nilai = 'B-'
	END
	IF @totalSkor > 75 AND @totalSkor < 81
		BEGIN
			SET @nilai = 'B'
	END
	IF @totalSkor > 80 AND @totalSkor < 86
		BEGIN
			SET @nilai = 'B+'
	END
	IF @totalSkor > 85 AND @totalSkor < 91
		BEGIN
			SET @nilai = 'A-'
	END
	IF @totalSkor > 90 AND @totalSkor < 101
		BEGIN
			SET @nilai = 'A'
	END

UPDATE StudentScore
	SET Grade = @nilai
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	END

--DELETE
IF EXISTS (SELECT * 
			FROM deleted) AND NOT EXISTS (SELECT *
											FROM inserted)
BEGIN
	SELECT @IDbaru = StudentID
	FROM deleted
	SELECT @courseBaru = CourseID
	FROM deleted
	SELECT @skor = Score
	FROM deleted
	SELECT @komponen = Component
	FROM deleted
	SET @skor = CASE @komponen
		WHEN 'ASG' THEN @skor *30/100
		WHEN 'MID' THEN @skor *35/100
		WHEN 'FIN' THEN @skor *35/100
END

UPDATE StudentScore
	SET TotalScore = TotalScore - @skor
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	SELECT @totalSkor = TotalScore
	FROM StudentScore
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	IF EXISTS(SELECT * 
				FROM StudentScore 
				WHERE CourseID = @courseBaru AND @IDbaru = StudentID AND TotalScore = 0)
BEGIN
	DELETE FROM StudentScore 
	WHERE CourseID = @courseBaru AND @IDbaru = StudentID AND TotalScore=0
END
	IF @totalSkor = 0
		BEGIN
			SET @nilai = 'F'
		END
	IF @totalSkor > 0 AND @totalSkor < 50
		BEGIN
			SET @nilai = 'E'
	END
	IF @totalSkor > 49 AND @totalSkor < 61
		BEGIN
			SET @nilai = 'D'
	END
	IF @totalSkor > 60 AND @totalSkor < 66
		BEGIN
			SET @nilai = 'C'
	END
	IF @totalSkor > 65 AND @totalSkor < 71
		BEGIN
			SET @nilai = 'C+'
	END
	IF @totalSkor > 70 AND @totalSkor < 76
		BEGIN
			SET @nilai = 'B-'
	END
	IF @totalSkor > 75 AND @totalSkor < 81
		BEGIN
			SET @nilai = 'B'
	END
	IF @totalSkor > 80 AND @totalSkor < 86
		BEGIN
			SET @nilai = 'B+'
	END
	IF @totalSkor > 85 AND @totalSkor < 91
		BEGIN
			SET @nilai = 'A-'
	END
	IF @totalSkor > 90 AND @totalSkor < 101
		BEGIN
			SET @nilai = 'A'
	END

UPDATE StudentScore
	SET Grade = @nilai
	WHERE @IDbaru = StudentScore.StudentID AND @courseBaru = StudentScore.CourseID
	END
END