CREATE TABLE Student_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    OldGrade VARCHAR(10),
    NewGrade VARCHAR(10),
    UpdateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER Student_Grade_Update_Log
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    IF OLD.Grade <> NEW.Grade THEN
        INSERT INTO Student_Audit (StudentID, OldGrade, NewGrade)
        VALUES (OLD.StudentID, OLD.Grade, NEW.Grade);
    END IF;
END //
DELIMITER ;
DELIMITER //

CREATE PROCEDURE Update_Student_Grade(IN student_id INT, IN math_score INT, IN science_score INT, IN english_score INT)
BEGIN
    DECLARE total_score INT;
    DECLARE new_grade VARCHAR(10);
    
    -- Calculate Total Score
    SET total_score = math_score + science_score + english_score;
    -- Determine Grade
    SET new_grade = 
        CASE 
            WHEN total_score >= 270 THEN 'A'
            WHEN total_score >= 240 THEN 'B'
            WHEN total_score >= 210 THEN 'C'
            ELSE 'D'
        END;
    -- Update Student Record
    UPDATE Students 
    SET Grade = new_grade 
    WHERE StudentID = student_id;
END //
DELIMITER ;

UPDATE Students 
SET Grade = 'B' 
WHERE StudentID = 1;
CALL Update_Student_Grade(1, 90, 85, 88);
SELECT * FROM Student_Audit;

SELECT * FROM Students;
