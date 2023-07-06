<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin Page</title>

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

.btn.btn-danger {
	background-color: #dc3545;
	color: #fff;
	transition: background-color 0.3s;
}

.btn.btn-danger:hover {
	background-color: #c82333;
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

/* .logout-container {
	display: flex;
	justify-content: flex-end;
	align-items: flex-start;
	margin-top: 5px;
	margin-right: 10px;
} */
.logout-container {
    position: absolute;
    top: 100px;
    right: 10px;
  }

.btn-primary {
	background-color: #FD798;
	border-color: #FD79A8;
}

.btn-primary:hover {
	background-color: #FFA07A;
	border-color: #FFA07A;
}

.nav-item {
	color: red;
}
</style>
</head>
<body>

<%-- <%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%> --%>
	<header class="header">
		<h1>Welcome to Your Website</h1>
		<nav>
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link" href="home">Home</a>
				</li>
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

	<h1>Enjoy Broo You're the Host Of this Page, ${adminUser.fullName}</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header text-center">
						<h4>Employee Details</h4>
						<c:if test="${not empty msg}">
							<h5 class="text-success">${msg}</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<!--                   <th scope="col">Id</th> -->
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<th scope="col">Contact Number</th>
									<th scope="col">Departments</th>
									<!--                   <th scope="col">UserType</th> -->
									<!--                   <th scope="col">Address</th> -->
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody id="addressTableBody">
								<c:forEach items="${empList}" var="emp">
									<tr>
										<%--                     <th scope="row">${emp.id}</th> --%>
										<td>${emp.fullName}</td>
										<td>${emp.email}</td>
										<td>${emp.contactNumber}</td>
										<td>${emp.department}</td>
										<%-- <td>${emp.userType}</td> --%>
										<%-- <td>
                      <ul>
                        <c:forEach items="${emp.address}" var="address">
                          <li>Permanent Address: ${address.permanenetAddress}</li>
                          <li>Temporary Address: ${address.temporaryAddress}</li>
                          <li>Street Address: ${address.streetAddress}</li>
                          <li>City: ${address.city}</li>
                          <li>State/Province: ${address.stateProvince}</li>
                          <li>Country: ${address.country}</li>
                          <br>
                        </c:forEach>
                      </ul>
                    </td> --%>
										<td><a href="viewDetails/${emp.id}"
											class="btn btn-sm btn-primary-view"
											style="background-color: red; color: white;">View</a> <a
											href="editDetails/${emp.id}" class="btn btn-sm btn-primary">Edit</a>
											<a href="deleteEmployees/${emp.id}"
											class="btn btn-sm btn-danger">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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



	<script>
		// Assuming you have an array of addresses called 'addresses' with the necessary address information
		/*  var addresses = [
		   {
		     permanentAddress: "Address 1",
		     temporaryAddress: "Address 2",
		     streetAddress: "Address 3",
		     city: "City 1",
		     stateProvince: "State 1",
		     country: "Country 1"
		   },
		   {
		     permanentAddress: "Address 4",
		     temporaryAddress: "Address 5",
		     streetAddress: "Address 6",
		     city: "City 2",
		     stateProvince: "State 2",
		     country: "Country 2"
		   }
		   // Add more address objects as needed
		 ];
		 */
		// Get the table body element where the address rows will be added
		var tableBody = document.getElementById("addressTableBody");

		// Iterate over the addresses array and generate HTML rows for each address
		addresses.forEach(function(address) {
			// Create a new table row element
			var row = document.createElement("tr");

			// Create table data cells for each address property
			var permanentAddressCell = document.createElement("td");
			permanentAddressCell.textContent = address.permanentAddress;

			var temporaryAddressCell = document.createElement("td");
			temporaryAddressCell.textContent = address.temporaryAddress;

			var streetAddressCell = document.createElement("td");
			streetAddressCell.textContent = address.streetAddress;

			var cityCell = document.createElement("td");
			cityCell.textContent = address.city;

			var stateProvinceCell = document.createElement("td");
			stateProvinceCell.textContent = address.stateProvince;

			var countryCell = document.createElement("td");
			countryCell.textContent = address.country;

			// Append the cells to the row
			row.appendChild(permanentAddressCell);
			row.appendChild(temporaryAddressCell);
			row.appendChild(streetAddressCell);
			row.appendChild(cityCell);
			row.appendChild(stateProvinceCell);
			row.appendChild(countryCell);

			// Append the row to the table body
			tableBody.appendChild(row);
		});
	</script>

	<footer class="footer">
		<p>&copy; 2023 Your Website. All rights reserved. | Design by
			Inexture Solutions LLP...</p>
	</footer>

</body>
</html>
