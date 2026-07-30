name: SQL Autograding

on:
  push:
  pull_request:

jobs:
  autograde:
    runs-on: ubuntu-latest

    services:
      mysql:
        image: mysql:8.0
        env:
          MYSQL_ROOT_PASSWORD: root
        ports:
          - 3306:3306
        options: >-
          --health-cmd="mysqladmin ping -proot"
          --health-interval=10s
          --health-timeout=5s
          --health-retries=5

    steps:

      - uses: actions/checkout@v4

      - name: Install MySQL Client
        run: sudo apt-get update && sudo apt-get install -y mysql-client

      - name: Wait for MySQL
        run: |
          until mysql -h127.0.0.1 -uroot -proot -e "SELECT 1"
          do
            sleep 2
          done

      - name: Run Student SQL
        run: |
          mysql -h127.0.0.1 -uroot -proot < starter/department.sql

      - name: Execute Tests
        run: |
          chmod +x tests/run_tests.sh
          ./tests/run_tests.sh
