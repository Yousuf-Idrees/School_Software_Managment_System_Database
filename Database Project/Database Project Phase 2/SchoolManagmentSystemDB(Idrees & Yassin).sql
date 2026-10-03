--idrees's part
/* Query 1: Students Failing All Subjects (Subquery) */
SELECT 
    S.Student_Username, 
    S.First_Name, 
    S.Last_Name, 
    S.Academic_Year
FROM Student S
WHERE NOT EXISTS (
    -- Subquery: Check if there is ANY subject where the student has a passing grade (>= 50)
    SELECT 1 
    FROM Takes T 
    WHERE T.Student_Username = S.Student_Username 
    AND T.Grade >= 50
)
AND EXISTS (
    -- Ensure the student is actually taking at least one subject (avoid empty records)
    SELECT 1 
    FROM Takes T 
    WHERE T.Student_Username = S.Student_Username
);


/* Query 2: Teachers in Overcrowded Classes (Subquery) */
SELECT 
    T.First_Name, 
    T.Last_Name, 
    T.Subject_Name,
    C.Class_Number,
    C.Capacity
FROM Teacher T
JOIN Teaches Te ON T.Teacher_Username = Te.Teacher_Username
JOIN ClassRoom C ON Te.Class_Number = C.Class_Number
WHERE (
    -- Subquery: Count students in this specific class
    SELECT COUNT(*) 
    FROM Student S 
    WHERE S.Class_Number = C.Class_Number
) > C.Capacity;


/* Query 3: Active Parents with Children in Different Academic Years (Complex Condition) */
SELECT 
    P.Parent_Username, 
    P.First_Name, 
    P.Last_Name,
    COUNT(DISTINCT S.Academic_Year) AS Different_Year_Levels
FROM Parent P
JOIN Child_Of CO ON P.Parent_Username = CO.Parent_Username
JOIN Student S ON CO.Student_Username = S.Student_Username
WHERE P.Parent_Username IN (
    -- Check if parent has ever received an announcement (Active/Contactable)
    SELECT Parent_Username FROM Receives
)
GROUP BY P.Parent_Username, P.First_Name, P.Last_Name
HAVING COUNT(DISTINCT S.Academic_Year) > 1;


/* Query 4: Star Students (High Grades + Perfect Attendance) (Complex Condition) */
SELECT 
    S.Student_Username, 
    S.First_Name, 
    S.Last_Name,
    AVG(T.Grade) as Average_Grade
FROM Student S
JOIN Takes T ON S.Student_Username = T.Student_Username
GROUP BY S.Student_Username, S.First_Name, S.Last_Name
HAVING AVG(T.Grade) >= 90 
AND S.Student_Username NOT IN (
    -- Exclude any student who has EVER been marked 'Absent'
    SELECT A.Student_Username 
    FROM Attendance A 
    WHERE A.Status = 'Absent'
);


--yassin's part


--Query1
SELECT 
    Subject_Name, 
    AVG(Grade) AS Average_Score, 
    COUNT(Student_Username) AS Total_Students
FROM Takes
GROUP BY Subject_Name
HAVING COUNT(Student_Username) > 0;

--Query2
SELECT 
    Status, 
    COUNT(Student_Username) AS Student_Count
FROM Attendance
WHERE Attendance_Date = CAST(GETDATE() AS DATE) -- Or a specific date like '2025-12-28'
GROUP BY Status;

--Query3
SELECT 
    S.First_Name + ' ' + S.Last_Name AS Student_Name,
    CR.Floor,
    T.First_Name + ' ' + T.Last_Name AS Teacher_Name,
    Sub.Name AS Subject
FROM Student S
JOIN ClassRoom CR ON S.Class_Number = CR.Class_Number
JOIN Takes TK ON S.Student_Username = TK.Student_Username
JOIN Subject Sub ON TK.Subject_Name = Sub.Name
JOIN Teacher T ON Sub.Name = T.Subject_Name;

--Query4
SELECT DISTINCT
    S.First_Name AS Student,
    P.Parent_Username,
    P.First_Name + ' ' + P.Last_Name AS Parent_Name,
    T.Teacher_Username,
    T.First_Name + ' ' + T.Last_Name AS Teacher_Name
FROM Student S
JOIN Child_Of CO ON S.Student_Username = CO.Student_Username
JOIN Parent P ON CO.Parent_Username = P.Parent_Username
JOIN Teaches TS ON S.Class_Number = TS.Class_Number
JOIN Teacher T ON TS.Teacher_Username = T.Teacher_Username
WHERE S.Student_Username = 'student_user_123';