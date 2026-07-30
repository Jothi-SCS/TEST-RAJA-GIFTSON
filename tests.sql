.read solution.sql

-- Test 1
SELECT name
FROM sqlite_master
WHERE type='table'
AND name='Department';

-- Test 2
PRAGMA table_info(Department);

-- Test 3
INSERT INTO Department
VALUES
(101,'Computer Science','Dr. Ravi');

SELECT * FROM Department;
