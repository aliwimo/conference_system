<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<title>CMS</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="index"><span class="text-primary">Con</span>MS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="index">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="signOut?type=${sessionScope.type}">Login</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-6 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">Sign Up ${sessionScope.type}</h5>
					<div class="card-body">
						<form action = "signup?type=${sessionScope.type}"  method="GET" >
						<input name = "type"  value = "${sessionScope.type}" type=hidden>
							<div class="form-group">
								<label for="firstname">First Name</label>
								<input name="firstName" type="text" class="form-control" id="firstname" placeholder="First Name">
							</div>
							<div class="form-group">
								<label for="lastname">Last Name</label>
								<input name="lastName" type="text" class="form-control" id="lastname" placeholder="Last Name">
							</div>
							<div class="form-group">
								<label for="email">Email</label>
								<input name="email" type="email" class="form-control" id="email" placeholder="Email">
							</div>
							<div class="form-group">
								<label for="phone">Phone</label>
								<input name="phone" type="number" class="form-control" id="phone" placeholder="05XXXXXXXXX">
							</div>
							<div class="form-group">
								<label for="Institute">Institute</label>
								<input name="institute" type="text" class="form-control" id="Institute" placeholder="Institute">
							</div>
							<div class="form-group">
								<label for="Position">Position</label>
								<input name="position" type="text" class="form-control" id="position" placeholder="Student..">
							</div>
							<div class="form-group">
								<label for="username">Username</label>
								<input name="userName" type="text" class="form-control" id="username" placeholder="Username For Login">
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<input name="password" type="password" class="form-control" id="password" placeholder="Password"
									aria-describedby="passwordHelp">
							</div>
							<c:if test="${sessionScope.type == 'judge' }">
								<div class="form-group">
									<label for="reportFields">Fields</label>
									<select class="custom-select" id="reportFields" multiple>
										<option value="Mathematics">Mathematics</option>
										<option value="Physics">Physics</option>
										<option value="Computer Science">Computer Science</option>
										<option value="Programming">Programming</option>
										<option value="Software">Software</option>
										<option value="Hardware">Hardware</option>
									</select>
									<input type="text" name="fields" class="form-control mt-2" id="fieldsNames">
								</div>
							</c:if>
							<c:if test="${sessionScope.type == 'judge' }">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" name="checkbox" class="custom-control-input" id="customCheck1">
									<label class="custom-control-label" for="customCheck1">Be a Writer Also?</label>
								</div><br>
							</c:if>
							<button type="submit" class="btn btn-primary">Creat Account</button>
							<button type="button" class="btn btn-link ml-auto">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script.js"></script>
</body>

</html>