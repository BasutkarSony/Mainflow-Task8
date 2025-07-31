# Student Management System - Task 8

## Overview  
This project demonstrates advanced SQL automation using triggers and stored procedures. The focus is on creating an AFTER UPDATE trigger to automatically log changes to student grades, and a reusable procedure to update grades based on total performance.

## Tasks Performed

1. Created an audit table (`Student_Audit`) for logging grade changes.
2. Developed an AFTER UPDATE trigger (`Student_Grade_Update_Log`) that automatically inserts a log record when a student's grade changes.
3. Built a stored procedure (`Update_Student_Grade`) to recalculate and update a student’s grade based on their math, science, and English scores.
4. Validated trigger and procedure functionality by performing updates and checking both the audit and students tables.

## How to Run

1. Use any MySQL client such as MySQL Workbench or phpMyAdmin.
2. Run the `Task-8.sql` script sequentially:
    - Create the audit table and trigger.
    - Create the stored procedure.
    - Test the trigger by updating a student's grade.
    - Call the procedure to update a student’s grade with new scores.
3. Use `SELECT * FROM Student_Audit;` and `SELECT * FROM Students;` to validate the results after each action.
