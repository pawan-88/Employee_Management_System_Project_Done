<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Employee Management System</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<style>
/* styles.css */

body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f9f9f9;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
}
.footer {
	background-color: #FF6B6B;
	padding: 20px;
	text-align: center;
	color: white;
}

h1 {
  text-align: center;
  margin-bottom: 30px;
  color: #333333;
  font-size: 32px;
}

.content {
  line-height: 1.6;
  color: #555555;
}

h2 {
  margin-bottom: 10px;
  color: #333333;
  font-size: 24px;
}

p {
  margin-bottom: 20px;
}

ol {
  padding-left: 20px;
  margin-bottom: 20px;
}

li {
  margin-bottom: 10px;
}

strong {
  font-weight: bold;
}

a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* Additional colorful styles */

.container {
  background-color: #f6f7f9;
}

h1 {
  color: #333333;
}

h2 {
  color: #555555;
}

.content {
  color: #777777;
}

ol {
  color: #555555;
}

.container {
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

a {
  color: #1e90ff;
}

a:hover {
  color: #ff4500;
}

/* Additional colorful styles */

.container {
  background-color: #fffacd;
}

h1 {
  color: #f06292;
}

h2 {
  color: #ffb74d;
}

.content {
  color: #4caf50;
}

ol {
  color: #9c27b0;
}

.container {
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

a {
  color: #00bcd4;
}

a:hover {
  color: #ff4081;
}

</style>
    <div class="container">
        <h1>About Employee Management System</h1>
        <div class="content">
            <h2>Overview</h2>
            <p>
                The Employee Management System is a comprehensive software solution designed to streamline and automate various processes related to employee management within an organization. It provides a centralized platform for managing employee information, tracking attendance, scheduling shifts, and generating reports. This system aims to enhance efficiency, improve communication, and simplify administrative tasks associated with workforce management.
            </p>

            <h2>Key Features</h2>
            <ol>
                <li>
                    <strong>Employee Database</strong>
                    <p>
                        Our system offers a secure and scalable employee database that allows you to store and manage comprehensive information about each employee, including personal details, contact information, employment history, and more. This centralized database ensures easy access to employee information and simplifies the process of updating and retrieving data.
                    </p>
                </li>
                <li>
                    <strong>Attendance Tracking</strong>
                    <p>
                        Efficiently monitor and track employee attendance through our system. You can record attendance using various methods such as biometric devices, RFID cards, or manual entry. The system automatically calculates work hours, tracks overtime, and provides real-time attendance reports for better workforce management.
                    </p>
                </li>
                <li>
                    <strong>Shift Scheduling</strong>
                    <p>
                        Create and manage employee schedules effortlessly. Our system enables you to define shifts, assign employees to specific time slots, and handle shift changes or substitutions with ease. The intuitive interface allows managers to view and modify schedules conveniently, ensuring adequate coverage and reducing scheduling conflicts.
                    </p>
                </li>
                <li>
                    <strong>Leave Management</strong>
                    <p>
                        Streamline the leave application and approval process with our system. The system allows employees to submit leave requests, and managers can easily review and approve them. This feature ensures efficient leave management, maintains accurate records, and minimizes conflicts between employee availability and scheduled shifts.
                    </p>
                </li>
            </ol>
        </div>
    </div>
</body>
<footer class="footer">
	<p>&copy; 2023 Your Website. All rights reserved. | Design by
		Inexture Solutions LLP...</p>
</footer>
</html>
