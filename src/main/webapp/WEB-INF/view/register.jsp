<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
    background-color: #F6F6F6;
}

.header {
    background-color: #FF7675;
    padding: 20px;
    text-align: center;
    color: white;
}

.nav {
    list-style-type: none;
    display: flex;
    justify-content: center;
    padding: 0;
}

.nav-item {
    margin: 0 10px;
}
.password{
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
.nav-link {
    color: white;
    text-decoration: none;
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

h1 {
    text-align: center;
    margin-top: 40px;
    margin-bottom: 20px;
}

form {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="email"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button[type="button"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    margin-bottom: 10px;
    border-radius: 4px;
    cursor: pointer;
}

.address {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 4px;
    background-color: #f9f9f9;
}

.address label {
    margin-bottom: 0;
}

.address input[type="text"] {
    margin-bottom: 5px;
}

.address:last-child {
    margin-bottom: 0;
}

</style>
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

<meta charset="ISO-8859-1">
<title>register page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
    <header class="header">
        <h1>Welcome to Your Website</h1>
        <nav>
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="index">Home</a>
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
 -->	<div class="conatiner p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h3>Register Page</h3>
						<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
<%-- 							<c:remove var="msg" /> --%>
						</c:if>
					</div>
					<div class="card-body">
						<form action="createUser" method="post">
							<div class="mb-3">
								<label>Full Name</label> <input type="text"
									name="fullName" placeholder="Enter Your Full Name" class="form-control">
							</div>
							<div class="mb-3">
								<label>Email</label> <input placeholder="Enter Your Email" type="email" name="email"
									class="form-control" aria-describedby="emailHelp">
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Contact
									No. </label> <input type="text" placeholder="Enter Your Contact" class="form-control"
									name="contactNumber" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>

							<div class="mb-3">
								<label>Password</label> <input type="password" placeholder="Enter Your Password" name="password"
									class="form-control">
							</div>
							<div class="mb-3">
								<label>Department</label> <input type="text"
									name="department" placeholder="Enter Your Department" class="form-control">
							</div>
							<div class="mb-3">
								<label>User Type</label> <input type="text" placeholder="Enter Your User Type" name="userType"
									class="form-control">
							</div>
							<div id="address">
			<h2>Addresses:</h2>
			<div class="address">
			 <label
					for="country">PermanenetAddress:</label> <input type="text" id="address[0].permanenetAddress"
					name="address[0].permanenetAddress" required><br> 
					<label
					for="country">TemporaryAddress:</label> <input type="text" id="address[0].temporaryAddress"
					name="address[0].temporaryAddress" required><br> 
					<label
					for="country">StreetAddress:</label> <input type="text" id="address[0].streetAddress"
					name="address[0].streetAddress" required><br> 
					
				<label for="street">City:</label> <input type="text" id="address[0].city"
					name="address[0].city" required><br> 
					<label
					for="city">State/Province:</label> <input type="text" id="address[0].stateProvince"
					name="address[0].stateProvince" required><br> 
					<label
					for="state">Country:</label> <input type="text" id="address[0].country"
					name="address[0].country" required><br>
			</div>
		</div>
							
								<button type="button" onclick="addAddress()">Add Address</button> 
								<button type="button" onclick="removeAddress()">Remove Address</button>
		<br>
		<br> 

							<button class="btn btn-primary col-md-12">Register</button>
							
												<div class="card-footer text-center">
						<p>Already have an account? <a href="login">Login</a></p>
					</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
		var addressIndex = 1;

		function addAddress() {
			var addressDiv = document.createElement('div');
			addressDiv.className = 'address';
			addressDiv.innerHTML = '<label for="permanenetAddress">PermanenetAddress:</label>'
				    + '<input type="text" id="permanenetAddress" name="address[' + addressIndex + '].permanenetAddress" required><br>'
				    +'<label for="temporaryAddress">TemporaryAddress:</label>'
				    + '<input type="text" id="temporaryAddress" name="address[' + addressIndex + '].temporaryAddress" required><br>'
				    +'<label for="streetAddress">StreetAddress:</label>'
					+ '<input type="text" id="streetAddress" name="address[' + addressIndex + '].streetAddress" required><br>'
					+ '<label for="city">City:</label>'
					+ '<input type="text" id="city" name="address[' + addressIndex + '].city" required><br>'
					+ '<label for="stateProvince">State/Province:</label>'
					+ '<input type="text" id="stateProvince" name="address[' + addressIndex + '].stateProvince" required><br>'
					+ '<label for="country">Country:</label>'
					+ '<input type="text" id="country" name="address[' + addressIndex + '].country" required><br>';

			var addressesDiv = document.getElementById('address');
			addressesDiv.appendChild(addressDiv);

			addressIndex++;
		}
	
	    function removeAddress() {
	        var addressDiv = document.getElementById('address');
	        var addresses = addressDiv.getElementsByClassName('address');

	        // Check if there is more than one address
	        if (addresses.length > 1) {
	            // Remove the last address
	            addressDiv.removeChild(addresses[addresses.length - 1]);
	        }
	    }


	</script>
	

	<%-- ------------------------------------------------------------------------------------------
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center fs-3">Registration Page</div>
					<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
							<c:remove var="msg" />
						</c:if>
					<p class="fs-bold text-center">${msg }</p>
					<div class="card-body">
						<form action="createUser" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Full
									Name </label> <input type="text" class="form-control" name="fullName"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1">

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Contact
									No. </label> <input type="text" class="form-control"
									name="contactNumber" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1">
							</div>
							<!-- <div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check</label>
							</div> -->
							<button type="submit" class="btn btn-primary col-md-12">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
 --%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		
		<footer class="footer">
    <p>&copy; 2023 Your Website. All rights reserved. | Design by Inexture Solutions LLP...</p>
</footer>
		
</body>
</html>