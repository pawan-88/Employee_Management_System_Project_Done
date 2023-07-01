<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is profile file</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
         .header:hover {
            background-color: #FFA07A;
            border-color: pink;
        }
        
        .jumbotron {
            background-color: #FAD7A0;
            color: #333;
            padding: 60px;
        }
        
        .card {
            background-color: 00BFFF;
            color:F0F8FF;
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
        .nav-iten{
        color:red;
        }
    </style>
</head>
<body>	
    <header class="header">
        <h1>Welcome to Your Website</h1>
        <nav>
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </nav>
    </header>

		<%-- <h1>Hello , ${loginuser.fullName }</h1> --%>
		
		<h4>Chill Bro You are User, ${normalUser.fullName }</h4>
		
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header text-center">
						<h4> Employee Details</h4>
						<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>

								<tr>
									<th scope="col">Id</th>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<!-- <th scope="col">Password</th> -->
									<th scope="col">Contact Number</th>
									<th scope="col">Departments</th>
									<th scope="col">UserType</th>
									<th scope="col">PermanenetAddress</th>
									<th scope="col">TemporaryAddress</th>
									<th scope="col">StreetAddress</th>
									<th scope="col">City</th>
									<th scope="col">State/Province</th>
									<th scope="col">Country</th>
									<th scope="col">Action</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${empList }" var="emp">
									<tr>
										<th scope="row">${emp.id }</th>
										<td>${emp.fullName }</td>
										
										<td>${emp.email }</td>
										<%-- <td>${emp.password}</td> --%>
										<td>${emp.contactNumber }</td>
										<td>${emp.department}</td>
										<td>${emp.userType }</td>
										<td>${emp.address[0].permanenetAddress }</td>
										<td>${emp.address[0].temporaryAddress}</td>
										<td>${emp.address[0].streetAddress}</td>
										<td>${emp.address[0].city}</td>
										<td>${emp.address[0].stateProvince}</td>
										<td>${emp.address[0].country}</td>
										<td>
										<a href="editDetails/${emp.id}"
											class="btn btn-sm btn-primary">Edit</a> <a
											href="deleteEmployees/${emp.id }" class="btn btn-sm btn-danger">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
<button class="btn btn-sm btn-danger"><a href="login">LogOut</a></button>

<footer class="footer">
    <p>&copy; 2023 Your Website. All rights reserved. | Design by Inexture Solutions LLP...</p>
</footer>

</body>
</html>