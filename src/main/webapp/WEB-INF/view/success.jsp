<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>/</title>
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


	<h1 class="text-center">Hey Bro Your Registration Sucessfully...</h1>
	<hr>
	<h2>Name : ${user.fullName }</h2>
	<h2>Email : ${user.email }</h2>
	<h2>Contact No. : ${user.contactNumber }</h2>
	<h2>Password : ${user.password }</h2>
	
	<footer class="footer">
    <p>&copy; 2023 Your Website. All rights reserved. | Design by Inexture Solutions LLP...</p>
</footer>
	
</body>
</html>