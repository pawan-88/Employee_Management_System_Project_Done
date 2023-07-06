<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Management System - Services</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

.footer {
	background-color: #FF6B6B;
	padding: 20px;
	text-align: center;
	color: white;
}

h1 {
	text-align: center;
}

h2 {
	margin-top: 30px;
}

form {
	margin-top: 20px;
	border: 1px solid #ccc;
	padding: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
}
.btn-primary {
	background-color: #FD79A8;
	border-color: #FD79A8;
	border-radius: 0;
	font-weight: bold;
	text-transform: uppercase;
	transition: background-color 0.3s, border-color 0.3s;
}

.centered-div {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 10vh;
}
.btn-primary:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

input[type="text"] {
	width: 100%;
	padding: 5px;
	margin-bottom: 10px;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

p {
	margin-top: 10px;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<h1>Employee Management System - Services</h1>

	<h2>Add Employee</h2>
	<form action="/employees/add" method="POST">
		<!-- Employee details input fields -->
		<label for="firstName">First Name:</label> <input type="text"
			id="firstName" name="firstName" required> <br> <label
			for="lastName">Last Name:</label> <input type="text" id="lastName"
			name="lastName" required> <br>

		<!-- Other employee details -->
		<!-- ...

    Submit button -->
		<button type="submit">Add Employee</button>
	</form>

	<h2>Update Employee</h2>
	<form action="/employees/update" method="POST">
		<!-- Employee ID input field -->
		<label for="employeeId">Employee ID:</label> <input type="text"
			id="employeeId" name="employeeId" required> <br>

		<!-- Updated employee details input fields -->
		<label for="updatedFirstName">First Name:</label> <input type="text"
			id="updatedFirstName" name="updatedFirstName" required> <br>

		<label for="updatedLastName">Last Name:</label> <input type="text"
			id="updatedLastName" name="updatedLastName" required> <br>

		<!-- Other updated employee details -->
		<!-- ...

    Submit button -->
		<button type="submit">Update Employee</button>
	</form>

	<h2>Delete Employee</h2>
	<form action="/employees/delete" method="POST">
		<!-- Employee ID input field -->
		<label for="employeeIdToDelete">Employee ID:</label> <input
			type="text" id="employeeIdToDelete" name="employeeIdToDelete"
			required> <br>

		<!-- Confirmation message -->
		<p>Are you sure you want to delete this employee?</p>

		<!-- Confirm button -->
		<button type="submit">Delete Employee</button>
	</form>
	<div class="centered-div">

		<a href="${pageContext.request.contextPath }/home"
			class="btn btn-primary">Back</a>

	</div>

</body>
<footer class="footer">
	<p>&copy; 2023 Your Website. All rights reserved. | Design by
		Inexture Solutions LLP...</p>
</footer>
</html>
