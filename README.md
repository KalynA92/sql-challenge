# sql-challenge

# Pewlett Hackard (a fictional company)

## Task

Completing a research project about people whom Pewlett Hackard (a fictional company) employed during the 1980s and 1990s. Design the tables to hold the data from the CSV 
files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, 
respectively.

## Data Modeling

Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables.

## Data Engineering

Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique.

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.

## Data Analysis

List the employee number, last name, first name, sex, and salary of each employee.

List the first name, last name, and hire date for the employees who were hired in 1986.

List the manager of each department along with their department number, department name, employee number, last name, and first name.

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

List each employee in the Sales department, including their employee number, last name, and first name.

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

## Description

I started by opening each of the CSV files and looking at each of their respective columns in order to begin creating my Entity Relationship Diagram of the tables. I used QuickDBD for this. I used a physical schema method for my ERD to later help with creating the table schema in the data engineering section of the challenge. Through my ERD, I was able to see the relationships between each of the tables, how they interact with eachother through one to one, one to many, and many to many relationships, and how this would help with the data analysis part of the challenge. I then created my table schema creating a table for each CSV files dropping if there was any tables already created in the database. I also specified to cascade in order to drop any tables that are dependant on each other to drop successfully. Before I could import the employees CSV file, I was getting an error that the datestyle was incorrect. Noticing that the datestyle of the CSV was in MDY format, instead of postgres' default format, I altered my database to set the datestyle to match the CSV file, and imported all the CSV files to their repsective tables. I then completed the data analysis with a variety of different methods. To list the salary of each employee, I used an INNER join method joining the employees and salaries tables to return the selected columns. To list employees who were hired in 1986, I used the date part function isolating the year portion of hire date column. To list the manager of each department I used the dept managers table and employees table again using inner join to join the tables and returned the selected columns. I used the where clause looking at the first name column and last name column in the employees table specifiying the first name to be Hercules and using the like function, that they also have a last name starting with the letter B. I used a subquery to return a list of employees from the sales department passing over the employees, dept emp, and deptartments tables. Using inner joins and an or function I was able to list the employees from either the sales or development departments. To get the frequency of shared last names among the employees, I selected the last name column, used the count aggregate and renamed the result. using the employees table, I grouped by the last name column and ordered in by the frequency of the shared last names in a descending fashion.

## References

Quick DBD for ERD creation 

https://www.quickdatabasediagrams.com/

Reference on cascade function

https://www.commandprompt.com/education/what-does-drop-table-cascade-do-in-postgresql/#:~:text=Conclusion-,In%20PostgreSQL%2C%20the%20CASCADE%20option%20is%20used%20with%20the%20DROP,along%20with%20its%20dependent%20objects

Reference on changing a databases datestyle

https://dba.stackexchange.com/questions/19679/how-to-set-postgresql-database-to-see-date-as-mdy-permanently - Line 14 of Data Engineering.sql

Isolating a specific part of a date using a where clause

https://dba.stackexchange.com/questions/206272/selecting-data-based-on-a-specific-time-frame - Line 12 of Data Analysis.sql


Finding the name of a person that starts with a specific letter

https://www.geeksforgeeks.org/sql-query-to-find-the-name-of-a-person-whose-name-starts-with-specific-letter/ - Line 35 of Data Analysis.sql
