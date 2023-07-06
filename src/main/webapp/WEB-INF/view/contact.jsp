<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<style>

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
body {
	font-family: Arial, sans-serif;
	background-image: url("https://example.com/background-image.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-color: #f5f5f5;
}
.footer {
	background-color: #FF6B6B;
	padding: 20px;
	text-align: center;
	color: white;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 30px;
	color: #333333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	color: #333333;
}

.form-group input[type="text"], .form-group textarea {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border-radius: 4px;
	border: 1px solid #cccccc;
	background-color: #ffffff;
}

.form-group textarea {
	height: 120px;
}

.form-group button {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #ff8c00;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.form-group button:hover {
	background-color: #ff7034;
}

.logo {
	text-align: center;
	margin-bottom: 30px;
}

.logo img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<div class="container">
		<div class="logo">
			<img
				src="https://img.freepik.com/free-vector/business-team-brainstorming-discussing-startup-project_74855-6909.jpg?w=740&t=st=1688557211~exp=1688557811~hmac=0cdf6e847c48834d5f5b033fe26aafbea13d19e6eafdc7f86e5ecbf85c660e67"
				alt="Your Logo">
		</div>
		<h1>Contact Us</h1>
		<form action="/submitContactForm" method="post">
			<div class="form-group">
				<label for="name">Your Name:</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div class="form-group">
				<label for="email">Your Email:</label> <input type="text" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="message">Message:</label>
				<textarea id="message" name="message" required></textarea>
			</div>
			<div class="form-group">
				<button type="submit">Send Message</button>
			</div>
		</form>
	<div class="centered-div">

		<a href="${pageContext.request.contextPath }/home"
			class="btn btn-primary">Back</a>

	</div>
	</div>
</body>
<footer class="footer">
	<p>&copy; 2023 Your Website. All rights reserved. | Design by
		Inexture Solutions LLP...</p>
</footer>
</html>
