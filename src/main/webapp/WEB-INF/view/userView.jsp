<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>View Details Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #F6F6F6;
	font-family: Arial, sans-serif;
}

.header {
	background-color: #FF7675;
	padding: 20px;
	text-align: center;
	color: white;
}

.header h1 {
	font-size: 32px;
	margin: 0;
}

.navbar {
	background-color: #FF7675;
	padding: 10px;
}

.navbar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

.navbar li {
	margin-right: 15px;
}

.navbar a {
	text-decoration: none;
	color: white;
	font-weight: bold;
	font-size: 16px;
	transition: color 0.3s;
}

.navbar a:hover {
	color: #FFC8C8;
}

.card {
	background-color: #FAD7A0;
	color: #333;
	margin-bottom: 30px;
}

.card-header {
	background-color: #FFC8C8;
	padding: 20px;
	text-align: center;
	color: white;
	font-size: 24px;
	font-weight: bold;
}

.card-body {
	padding: 20px;
}

.form-control {
	border-radius: 0;
	border-color: #FFC8C8;
	box-shadow: none;
}

.fabulous-div {
	font-weight: bold;
	color: #FF00FF;
	background-color: #F8F8F8;
	padding: 10px;
	border: 2px solid #FF00FF;
	border-radius: 6px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.fabulous-div label {
	font-size: 15px;
	text-transform: uppercase;
}

.address-container {
	padding: 20px;
	background-color: #FFC8C8;
	margin-bottom: 30px;
}

.address-separator {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.logout-container {
	position: absolute;
	top: 100px;
	right: 10px;
}

.address-separator hr {
	border: none;
	border-top: 2px dashed #FF00FF;
}

.btn-primary {
	background-color: #FD79A8;
	border-color: #FD79A8;
	border-radius: 0;
	font-weight: bold;
	text-transform: uppercase;
	transition: background-color 0.3s, border-color 0.3s;
}

.btn-primary:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

.footer {
	background-color: #FF6B6B;
	padding: 20px;
	text-align: center;
	color: white;
	font-size: 14px;
}

.btn.btn-danger {
	background-color: #dc3545;
	color: #fff;
	transition: background-color 0.3s;
}

.btn.btn-danger:hover {
	background-color: #c82333;
}

.footer p {
	margin: 0;
}
</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>

	<header class="header">
		<h1>Welcome to Your Website</h1>
		<nav>
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="register">Register</a></li>
				<li class="nav-item"><a class="nav-link" href="service">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
			</ul>
		</nav>
	</header>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header text-center">
						<h3>View Employee Details</h3>
						<c:if test="${not empty msg}">
							<h5 class="text-success">${msg}</h5>
						</c:if>
					</div>
					<div class="card-body">
						<form method="get" action="empDetails">
							<div class="mb-3 row">
								<label for="fullname" class="col-sm-4 col-form-label">Full
									Name:</label>
								<div class="col-sm-8">
									<input type="text" name="fullName" class="form-control"
										readonly="readonly" value="${user.fullName}" />
								</div>
							</div>
							<div class="mb-3 row">
								<label for="email" class="col-sm-4 col-form-label">Email:</label>
								<div class="col-sm-8">
									<input type="text" name="email" class="form-control"
										readonly="readonly" value="${user.email}" />
								</div>
							</div>
							<div class="mb-3 row">
								<label for="contactNumber" class="col-sm-4 col-form-label">Contact
									Number:</label>
								<div class="col-sm-8">
									<input type="text" name="contactNumber" class="form-control"
										readonly="readonly" value="${user.contactNumber}" />
								</div>
							</div>
							<div class="fabulous-div row">
								<label class="col-sm-12">Addresses:</label>
							</div>
							<c:forEach var="address" items="${user.address}"
								varStatus="addressStatus">
								<div class="address-container">
									<div class="address-separator">
										<hr>
										<span>Address ${addressStatus.index + 1}</span>
										<hr>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">Permanent
											Address:</label>
										<div class="col-sm-8">
											<input type="text" name="permanenetAddress"
												class="form-control" readonly="readonly"
												value="${address.permanenetAddress}" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">Temporary
											Address:</label>
										<div class="col-sm-8">
											<input type="text" name="temporaryAddress"
												class="form-control" readonly="readonly"
												value="${address.temporaryAddress}" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">Street Address:</label>
										<div class="col-sm-8">
											<input type="text" name="streetAddress" class="form-control"
												readonly="readonly" value="${address.streetAddress}" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">City:</label>
										<div class="col-sm-8">
											<input type="text" name="city" class="form-control"
												readonly="readonly" value="${address.city}" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">State/Province:</label>
										<div class="col-sm-8">
											<input type="text" name="stateProvince" class="form-control"
												readonly="readonly" value="${address.stateProvince}" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-4 col-form-label">Country:</label>
										<div class="col-sm-8">
											<input type="text" name="country" class="form-control"
												readonly="readonly" value="${address.country}" />
										</div>
									</div>

								</div>
							</c:forEach>
							<div class="text-center">
								<a href="${pageContext.request.contextPath }/admin"
									class="btn btn-primary">Back</a>
		
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="logout-container">
		<a href="login" class="btn btn-sm btn-danger"> <span
			class="button-text">Log Out</span>
		</a>
	</div>

	<footer class="footer">
		<p>&copy; 2023 Your Website. All rights reserved. | Design by
			Inexture Solutions LLP...</p>
	</footer>

</body>
</html>
