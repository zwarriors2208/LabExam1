https://github.com/TulsiMundada/PySpark-AI-Trends-and-Computing-Platforms-/blob/main/M4/sm13/Ex1_FilteringcolumncontentwithPython.ipynb

Q.
Deploy a MySQL_container using following:

Container_Name : Mysql1

MYSQL_ROOT_PASSWORD= root@123

MYSQL_DATABASE = student_db

Map port external port 8000 to MySQL port 3306. Create a table by name students in it as shown:

+Name + Course + Age + City +

+Sam + DAI + 23 + Mumbai +


docker run -d \
  --name Mysql1 \
  -e MYSQL_ROOT_PASSWORD=root@123 \
  -e MYSQL_DATABASE=student_db \
  -p 8000:3306 \
  mysql:latest

docker exec -it Mysql1 mysql -u root -p

USE student_db;

CREATE TABLE students (
    Name VARCHAR(50),
    Course VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO students (Name, Course, Age, City)
VALUES ('Sam', 'DAI', 23, 'Mumbai');

SELECT * FROM students;
+------+--------+-----+--------+
| Name | Course | Age | City   |
+------+--------+-----+--------+
| Sam  | DAI    |  23 | Mumbai |
+------+--------+-----+--------+
