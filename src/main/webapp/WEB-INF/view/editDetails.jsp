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
	display: none;
}

.footer p {
	margin: 0;
}

#userTypeLabel {
	display: none;
}
</style>

</head>
<body>

	<header class="header">
		<h1>Employee Management System</h1>
	</header>

	<nav class="navbar">
		<ul>
			<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
			<%-- <li><a href="${pageContext.request.contextPath}/addEmployee">Add
					Employee</a></li> --%>
			<li><a href="${pageContext.request.contextPath}/viewDetails">View
					Employee</a></li>
		</ul>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<c:if test="${not empty user}">
					<div class="card">
						<div class="card-header">Edit Employee</div>
						<div class="card-body">
							<form:form modelAttribute="user"
								action="${pageContext.request.contextPath }/updateEmployee"
								method="post">
								<c:if test="false">
									<div class="form-group">
										<label for="id">ID</label>
										<form:input path="id" cssClass="form-control" />
									</div>
								</c:if>
								<div class="form-group">
									<label for="fullName">Full Name</label>
									<form:input path="fullName" cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<form:input path="email" cssClass="form-control"
										readonly="readonly" />
								</div>
								<c:if test="false">
									<div class="form-group">
										<label for="password">Password</label>
										<form:input path="password" cssClass="form-control" />
									</div>
								</c:if>
								<div class="form-group">
									<label for="contactNumber">Contact Number</label>
									<form:input path="contactNumber" cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="department">Department</label>
									<form:input path="department" cssClass="form-control" />
								</div>
								<c:if test="false">
									<div class="form-group">
										<label for="userType">UserType</label>
										<form:input path="userType" cssClass="form-control" />
									</div>
								</c:if>
								<div class="mb-3 fabulous-div">
									<label for="addresses">Addresses:</label>
								</div>
								<c:forEach items="${user.address}" var="address"
									varStatus="addressStatus">
									<div class="address-container">
										<c:if test="false">
											<div class="form-group">
												<label for="addressId">ID</label>
												<form:input path="address[${addressStatus.index}].addressId"
													cssClass="form-control" />
											</div>
										</c:if>
										<%-- <div class="form-group">
											<label for="user">User Address</label>
											<form:input
												path="address[${addressStatus.index}].user"
												cssClass="form-control" />
										</div> --%>
										<div class="form-group">
											<label for="permanenetAddress">Permanent Address</label>
											<form:input
												path="address[${addressStatus.index}].permanenetAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="temporaryAddress">Temporary Address</label>
											<form:input
												path="address[${addressStatus.index}].temporaryAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="streetAddress">Street Address</label>
											<form:input
												path="address[${addressStatus.index}].streetAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="city">City</label>
											<form:input path="address[${addressStatus.index}].city"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="stateProvince">State/Province</label>
											<form:input
												path="address[${addressStatus.index}].stateProvince"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="country">Country</label>
											<form:input path="address[${addressStatus.index}].country"
												cssClass="form-control" />
										</div>
									</div>
									<div class="address-separator">
										<hr />
									</div>
								</c:forEach>

								<button type="submit" class="btn btn-primary">Update</button>
							</form:form>
						</div>
					</div>
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
				</c:if>
			</div>
		</div>
	</div>

	<footer class="footer">
		<p>&copy; 2023 Employee Management System. All rights reserved.</p>
	</footer>

</body>
</html>
