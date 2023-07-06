<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

.custom-button {
	background-color: #FF0000; /* Set your desired background color here */
	border-color: #FD79A8;
	border-radius: 0;
	padding: 10px 20px;
	color: white;
}

.custom-button:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

.logout-container {
	position: absolute;
	top: 100px;
	right: 10px;
}

.navbar li {
	margin-right: 15px;
}

.btn.btn-danger {
	background-color: #dc3545;
	color: #fff;
	transition: background-color 0.3s;
}

.btn.btn-danger:hover {
	background-color: #c82333;
}

.navbar a {
	text-decoration: none;
	color: white;
	font-weight: bold;
	font-size: 16px;
	transition: color 0.3s;
}

.logout-container {
	position: absolute;
	top: 100px;
	right: 10px;
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
	background-color: crimson;
	border-color: #FD79A8;
	border-radius: 0;
	transition: background-color 0.3s, border-color 0.3s;
	/* padding-left: 20px; */
}

.btn-primary:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

.btn-primary-up {
	background-color: red;
	border-color: #FD79A8;
	border-radius: 0;
    justify-content: center;
    align-items: center;
    height: 5vh;
	/* padding-left: 20px; */
}

.btn-primary-up:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}
.centered-div {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 10vh;
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

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>

	<header class="header">
		<h1>Employee Management System</h1>
	</header>

	<nav class="navbar">
		<ul>
			<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
			<%-- <li><a href="${pageContext.request.contextPath}/addEmployee">Add
					Employee</a></li> --%>
			<%-- <li><a href="viewDetails/${emp.id}"
				class="btn btn-sm btn-primary-view"
				style="background-color: red; color: white;">View</a></li> --%>
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
								<div class="form-group">
									<!-- <label for="id">ID</label> -->
									<form:input type="hidden" path="id" cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="fullName">Full Name</label>
									<form:input path="fullName" cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<form:input path="email" cssClass="form-control"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<!-- <label for="password">Password</label> -->
									<form:input type="hidden" path="password"
										cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="contactNumber">Contact Number</label>
									<form:input path="contactNumber" cssClass="form-control" />
								</div>
								<div class="form-group">
									<label for="department">Department</label>
									<form:input path="department" cssClass="form-control" />
								</div>
								<div class="form-group">
									<!-- <label for="userType">UserType</label> -->
									<form:input type="hidden" path="userType"
										cssClass="form-control" />
								</div>
								<div class="fabulous-div row">
									<label class="col-sm-12">Addresses:</label>
								</div>

								<c:forEach items="${user.address}" var="address"
									varStatus="addressStatus">
									<div class="address-container">
										<div class="address-separator">
											<hr>
											<span>Address ${addressStatus.index + 1}</span>
											<hr>
											<button class="btn btn-danger" type="button"
												onclick="deleteAddress(${addressStatus.index})">Delete</button>
										</div>
										<div class="form-group">
											<!-- <label for="addressId" >ID</label> -->
											<form:input type="hidden" id="address_${addressStatus.index}"
												path="address[${addressStatus.index}].addressId"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="permanenetAddress">Permanent Address</label>
											<form:input id="address[0].permanenetAddress"
												path="address[${addressStatus.index}].permanenetAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="temporaryAddress">Temporary Address</label>
											<form:input id="address[0].temporaryAddress"
												path="address[${addressStatus.index}].temporaryAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="streetAddress">Street Address</label>
											<form:input id="address[0].streetAddress"
												path="address[${addressStatus.index}].streetAddress"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="city">City</label>
											<form:input id="address[0].city"
												path="address[${addressStatus.index}].city"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="stateProvince">State/Province</label>
											<form:input id="address[0].stateProvince"
												path="address[${addressStatus.index}].stateProvince"
												cssClass="form-control" />
										</div>
										<div class="form-group">
											<label for="country">Country</label>
											<form:input id="address[0].country"
												path="address[${addressStatus.index}].country"
												cssClass="form-control" />
										</div>
									</div>

								</c:forEach>

								<!-- 								<button type="button" onclick="addAddress()">Add Address</button> 
 -->
								<button type="button" onclick="addAddress()"
									style="background-color: green; color: white;">Add</button>

								<button type="button" onclick="removeAddress()"
									style="background-color: red; color: white;">Remove</button>
								
								
									<button type="submit" class="btn btn-primary-up">Update</button>

								<div class="centered-div">
									<a href="${pageContext.request.contextPath }/admin"
										class="btn btn-primary">Back</a>
								</div>
							</form:form>

						</div>
					</div>
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
				</c:if>
			</div>
		</div>
	</div>

	<div class="logout-container">
		<a href="login" class="btn btn-sm btn-danger"> <span
			class="button-text">Log Out</span>
		</a>
	</div>
	<script>
	var address = document.querySelectorAll(".address-container");
	    console.log("Address: "+address.length)

	    var addressIndex = address.length;

	  function addAddress() {
		  var addressContainer = document.createElement('div');
	    addressContainer.className = 'address-container';
	    
	    var addressDiv = document.createElement('div');

	    addressDiv.className = 'address';
	    
	    addressDiv.innerHTML = 
	    	
		    '<div class="form-group">' +
	    	'<label for="permanenetAddress">Permanent Address:</label>'
	      + '<input type="text" id="permanenetAddress" name="address[' + addressIndex + '].permanenetAddress" required><br>'
	      + '<label for="temporaryAddress">Temporary Address:</label>'
	      + '<input type="text" id="temporaryAddress" name="address[' + addressIndex + '].temporaryAddress" required><br>'
	      + '<label for="streetAddress">Street Address:</label>'
	      + '<input type="text" id="streetAddress" name="address[' + addressIndex + '].streetAddress" required><br>'
	      + '<label for="city">City:</label>'
	      + '<input type="text" id="city" name="address[' + addressIndex + '].city" required><br>'
	      + '<label for="stateProvince">State/Province:</label>'
	      + '<input type="text" id="stateProvince" name="address[' + addressIndex + '].stateProvince" required><br>'
	      + '<label for="country">Country:</label>'
	      + '<input type="text" id="country" name="address[' + addressIndex + '].country" required><br>';

	    var addressesDiv = document.getElementsByClassName('address-container')[0];
	    addressesDiv.appendChild(addressDiv);
	    addressIndex++;
	    
	  }
	  
/* 		function removeAddress() {
			var addressDiv = document.getElementById('address');
			var addresses = addressDiv.getElementsByClassName('address');

			if (addresses.length > 1) {
				addressDiv.removeChild(addresses[addresses.length - 1]);
			}
		} */
		
		function removeAddress() {
			var addressDiv = document.getElementById('address');
			var address = addressDiv.getElementsByClassName('address');

			// Check if there is more than one address
			if (address.length > 1) {
				// Remove the last address
				addressDiv.removeChild(address[address.length - 1]);
			}
		}

		function deleteAddress(addressId) {
			/* alert("hello") */
			var id=$("#address_"+addressId).val();
			if (confirm("Are you sure you want to delete this address?")) {
				$.ajax({
					url : "${pageContext.request.contextPath}/deleteAddress/"
							+ id,
					type : "DELETE",
					success : function(response) {
					
						alert(response)
					},
					error : function(xhr, status, error) {
						// Handle the error response
					}
				});
			}
		}
		
		$(document).ready(function() {
			  $("#registerform").validate({
			    

			  });


			});
		
	</script>
	<footer class="footer">
		<p>&copy; 2023 Employee Management System. All rights reserved.</p>
	</footer>

</body>
</html>
