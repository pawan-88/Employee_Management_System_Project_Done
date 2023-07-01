<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored="false"%>
<!DOCTYPE html>
<%-- <html>
<head>
	<style>
body {
    background-image: url("/home/root396/Downloads/img.avif");
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Employee Management System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="addEmp">Add Employee
					</a></li> 
					<li class="nav-item"><a class="nav-link" href="empDetails">Added Employee Details
					</a></li>

					<li class="nav-item"><a class="nav-link" href="register">Register
					</a></li>

					<li class="nav-item"><a class="nav-link" href="login">Login
					</a></li>
				</ul>

			</div>
		</div>
	</nav>

 <jsp:include page="footer.jsp" />
</body>
</html> --%>

<html>
<head>
    <title></title>
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
        
        .jumbotron {
            background-color: #FAD7A0;
            color: #333;
            padding: 60px;
        }
        
        .card {
            background-color: #74B9FF;
            color: white;
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
    <!-- Header Section -->
    <header class="header">
        <h1>Welcome to Your Employee Management System</h1>
        <nav>
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="userAddress">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addEmp">Add Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="empDetails">Employee Details</a>
                </li>
            </ul>
        </nav>
    </header>
    
    <!-- <!-- Main Content Section -->
    <section class="jumbotron">
        <div class="container">
            <h1 class="display-4">Employee Management System</h1>
            <p class="lead">To Manage Employee Details..</p>
            <a class="btn btn-primary btn-lg" href="#" role="button">Learn More</a>
        </div>
    </section>
    
    <section class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Feature 1</h5>
                        <p class="card-text">Comprehensive Employee Database: Maintain a centralized repository of employee information, including personal details, employment history, and qualifications.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Feature 2</h5>
                        <p class="card-text">Performance Evaluation: Implement a performance evaluation system to assess employee performance, set goals,regular activities and facilitate performance reviews...</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Feature 3</h5>
                        <p class="card-text">Leave Management: Automate leave requests, approvals, and tracking, ensuring smooth management of employee time off.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer Section -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Inexture Solutins LLP. All rights reserved.</p>
        </div>
    </footer>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


