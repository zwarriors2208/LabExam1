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


pip install mysql-connector-python
import mysql.connector

# Connect to MySQL container
conn = mysql.connector.connect(
    host='127.0.0.1',    # Host is localhost
    port=8000,           # Port mapped to MySQL container
    user='root',         # MySQL username
    password='root@123', # MySQL password
    database='student_db' # The database to connect to
)

# Create a cursor object using the connection
cursor = conn.cursor()

# SQL query to insert a new student record
insert_query = """
INSERT INTO students (Name, Course, Age, City)
VALUES (%s, %s, %s, %s)
"""

# Data to insert
student_data = ('Alice', 'Python', 22, 'New York')

# Execute the query
cursor.execute(insert_query, student_data)

# Commit the transaction
conn.commit()

# Print confirmation
print("Data inserted successfully!")

# Optional: Verify the insertion by fetching data from the table
cursor.execute("SELECT * FROM students")
rows = cursor.fetchall()

# Print the rows
print("\nStudents Table:")
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
