#!/bin/bash

mysql -h127.0.0.1 -uroot -proot < starter/department.sql 2>error.log

if [ $? -ne 0 ]; then
    echo "========== MYSQL ERROR =========="
    cat error.log
    echo "================================="
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
#!/bin/bash

echo "Current directory:"
pwd

echo "Repository contents:"
ls -R

mysql -h127.0.0.1 -uroot -proot < starter/department.sql 2>error.log

if [ $? -ne 0 ]; then
    echo "========== MYSQL ERROR =========="
    cat error.log
    echo "================================="
    exit 1
fi

echo "SQL executed successfully."
