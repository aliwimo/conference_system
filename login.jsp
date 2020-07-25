<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
			<div class="col-6 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">Login For <c:if test="${loginType == 'admin' }">OKB</c:if>
												<c:if test="${loginType == 'writer' }">writer</c:if>
												<c:if test="${loginType == 'judge' }">judge</c:if></h5>
					<div class="card-body">
						<form action=
						<c:if test="${loginType == 'admin' }">'admin'</c:if>
						<c:if test="${loginType == 'writer' }">'login'</c:if>
						<c:if test="${loginType == 'judge' }">'login'</c:if>
						 method="GET">
							<div class="form-group">
								<label for="username">Username</label>
								<input type="text" name="userName" class="form-control" id="username" placeholder="Username">
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" name="password" class="form-control" id="password" placeholder="Password" aria-describedby="passwordHelp">
								<input type="hidden" name="type" value=<c:if test="${loginType == 'writer' }">'writer'</c:if>
																	   <c:if test="${loginType == 'judge' }">'judge'</c:if>>
							</div>
							<button type="submit" value="Submit" class="btn btn-primary">Login</button>
							<c:if test="${loginType != 'admin' }"><a href="signup?type=<c:out value = '${loginType}'/>"  class="btn btn-link ml-auto">Create Account</a></c:if>
							
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