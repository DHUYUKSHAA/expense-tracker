# Expense Tracker

A web-based Expense Tracker application developed using Java MVC architecture to help users manage and track daily expenses efficiently.

---

## Features
- User Registration and Login
- Add Daily Expenses
- View Expense Records
- Delete Expenses
- Automatic Total Expense Calculation
- Secure Database Connectivity

---

## Technologies Used

### Frontend
- JSP
- HTML
- CSS

### Backend
- Java Servlets
- JDBC

### Database
- PostgreSQL

### Server
- Apache Tomcat

---

## MVC Architecture

This project follows the MVC (Model-View-Controller) architecture.

- **Model**  
  Handles database operations using JDBC and PostgreSQL.

- **View**  
  JSP pages are used to create the user interface and display data dynamically.

- **Controller**  
  Java Servlets handle requests, process business logic, and connect the frontend with the database.

---

## How the Project Works

1. User registers and logs into the application  
2. Login details are verified using PostgreSQL database  
3. Users can add expense details such as:
   - Expense Name
   - Amount
   - Category
4. Expense data is stored in the database using JDBC  
5. Saved expenses are displayed dynamically on JSP pages  
6. Users can delete unwanted expense records  
7. Total expenses are calculated automatically  

---

## Project Structure

```plaintext
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
```

---

## Tools & Environment
- Eclipse IDE
- Apache Tomcat Server
- PostgreSQL Database
- Java JDK

---

## Learning Outcomes
- Java Web Development
- MVC Architecture
- JDBC Connectivity
- CRUD Operations
- Servlet Handling
- Database Management
- Full Stack Application Development

---

## Author
Dhuyukshaa Arunkumar
