<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%-- <c:if test="${empty sessionScope.normalUser}">
    <script>
        window.location.href = "login";
    </script>
</c:if> --%>
<!DOCTYPE html>
<html>
<head>

<!-- <script>
function DisableBackButton() {
	function noBack()
    {
        window.history.forward()
    }
   noBack();
   window.onload = noBack;
   window.onpageshow = function(evt) { if (evt.persisted) noBack() }
   window.onunload = function() { void (0) }
</script> -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="styles.css">
<style>
body {
	background-color: #F6F6F6;
}

.header {
	background-color: #FF7675;
	padding: 20px;
	text-align: center;
	color: white;
}

.jumbotron {
	background-color: #FAD7A0;
	color: #333;
	padding: 60px;
}

.card {
	background-color: 00BFFF;
	color: F0F8FF;
	margin-bottom: 30px;
}

.footer {
	background-color: #FF6B6B;
	padding: 20px;
	text-align: center;
	color: white;
}

.btn-primary {
	background-color: #FD79A8;
	border-color: #FD79A8;
}

.btn-primary:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

.nav-iten {
	color: red;
}
</style>
<style>

/*     background-image: url("/home/root396/Downloads/register.avif");
 */
background-repeat


:

 

no-repeat


;
background-size


:

 

cover


;
background-color


:

 

#dee2e6


;
</style>
<!-- <style>
.placeicon {
	font-family: fontawesome
}
.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}
</style> -->
<meta charset="ISO-8859-1">
<title>login page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
	<header class="header">
		<h1>Welcome to Your Website</h1>
		<nav>
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register">Register</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="service">Services</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
			</ul>
		</nav>
	</header>

	<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="homePage">Employee Management System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="homePage">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="addEmp">Add Employee
					</a></li> 
						<li class="nav-item"><a class="nav-link" href="register">Register
					</a></li>

					<li class="nav-item"><a class="nav-link" href="login">Login
					</a></li>
						</ul>
			</div>
		</div>
	</nav>
 -->
	<br>
	<div class="conatiner p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h3>Login Page</h3>
						<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="userLogin" method="post">

							<div class="mb-3">
								<label>Enter Email</label> <input type="email"
									placeholder="Enter Your Email" name="email" id="txtEmail"
									required="required" class="form-control"
									onkeyup="ValidateEmail();"> <span id="emailError"
									style="color: red"></span>
							</div>

							<div class="mb-3">
								<label>Enter Password</label> <input type="password"
									placeholder="Enter Your Password" name="password" id="password"
									required="required" class="form-control"
									onkeyup="ValidatePassword();"> <span id="passwordError"
									style="color: red"></span>
							</div>

							<div class="mb-3">
								<a href="forgotPassword">Forgot Password?</a>
							</div>

							<button class="btn btn-primary col-md-12">Login</button>

							<div class="card-footer text-center">
								<p>
									Already have an account? <a href="register">Register</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function ValidateEmail() {
			var email = document.getElementById("txtEmail").value;
			var emailError = document.getElementById("emailError");
			emailError.innerHTML = "";

			var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var maxLength = 30; // Maximum length of email

			if (!expr.test(email)) {
				emailError.innerHTML = "Invalid email address.";
			} else if (email.length > maxLength) {
				emailError.innerHTML = "Email address cannot exceed the maximum length of "
						+ maxLength + " characters.";
				// Truncate the email to the maximum length
				email = email.slice(0, maxLength);
				// Update the input field with the truncated email
				document.getElementById("txtEmail").value = email;
			}
		}

		function ValidatePassword() {
			var password = document.getElementById("password").value;
			var passwordError = document.getElementById("passwordError");
			passwordError.innerHTML = "";

			var expr = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			var maxLength = 12; // Maximum length of password

			if (!expr.test(password)) {
				passwordError.innerHTML = "Password must be at least 12 characters long and contain at least one lowercase letter, one uppercase letter, and one number";
			} else if (password.length > maxLength) {
				passwordError.innerHTML = "Password cannot exceed the maximum length of "
						+ maxLength + " characters.";
				// Truncate the password to the maximum length
				password = password.slice(0, maxLength);
				// Update the input field with the truncated password
				document.getElementById("password").value = password;
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>



</body>
<footer class="footer">
	<p>&copy; 2023 Your Website. All rights reserved. | Design by
		Inexture Solutions LLP...</p>
</footer>
</html>