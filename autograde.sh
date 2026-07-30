#!/bin/bash

sqlite3 CollegeDB.db < solution.sql > output.txt 2>error.txt

if [ $? -ne 0 ]; then
    echo "SQL Execution Failed"
    exit 1
fi

sqlite3 CollegeDB.db ".tables" > tables.txt

grep -q "Department" tables.txt

if [ $? -ne 0 ]; then
    echo "Department table not found"
    exit 1
fi

sqlite3 CollegeDB.db "PRAGMA table_info(Department);" > schema.txt

grep -q "DepartmentID" schema.txt || exit 1
grep -q "DepartmentName" schema.txt || exit 1
grep -q "HOD" schema.txt || exit 1

echo "All Tests Passed"
