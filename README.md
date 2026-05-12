Expense Tracker

A web-based Expense Tracker application developed using Java MVC architecture to help users manage and track daily expenses efficiently.

Features
User Registration and Login
Add Daily Expenses
View Expense Records
Delete Expenses
Automatic Total Expense Calculation
Secure Database Connectivity
Technologies Used
Frontend
JSP
HTML
CSS
Backend
Java Servlets
JDBC
Database
PostgreSQL
Server
Apache Tomcat
MVC Architecture

This project follows the MVC (Model-View-Controller) architecture.

Model
Handles database operations and business data using JDBC and PostgreSQL.
View
JSP pages are used to create the user interface and display expense data dynamically.
Controller
Java Servlets handle client requests, process logic, and connect the View with the Model.
How the Project Works
User registers and logs into the application.
Login details are verified using PostgreSQL database.
Users can add expense details such as:
Expense Name
Amount
Category
Date
Expense data is stored in the database using JDBC.
All saved expenses are displayed dynamically on JSP pages.
Users can delete unwanted expenses.
Total expenses are calculated automatically.
Project Structure
ExpenseTracker/
│
├── src/
│   ├── controller/
│   │   ├── LoginServlet.java
│   │   ├── AddExpenseServlet.java
│   │   └── DeleteExpenseServlet.java
│   │
│   ├── model/
│   │   ├── DBConnection.java
│   │   └── Expense.java
│
├── WebContent/
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── addExpense.jsp
│   └── style.css
│
└── database/
    └── expense_tracker.sql
Tools & Environment
Eclipse IDE
Apache Tomcat Server
PostgreSQL Database
Java JDK
Learning Outcomes

Through this project, I learned:

Java Web Development
MVC Architecture
JDBC Connectivity
CRUD Operations
Servlet Handling
Database Management
Full Stack Application Development
Author

Dhuyukshaa Arun Kumar
