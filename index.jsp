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
				</ul>
			</div>
		</div>
	</nav>
	<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-lg-6 mx-auto">
				<div class="card bg-light mt-4">
					<div class="card-body">
						<h5>Welcome to ConMS</h5>
						<p class="mt-4">Please Select Role  to Proceed .. </p>
						<div class="btn-group btn-block mr-2" role="group" aria-label="First group">
							<a href="admin" class="btn btn-success">OKB</a>
							<a href="login?loginType=writer"  class="btn btn-secondary">Writer</a>
							<a href="login?loginType=judge"  class="btn btn-secondary">Judge</a>
						</div>
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