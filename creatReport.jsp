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
            <a class="navbar-brand"><span class="text-primary">Con</span>MS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="writer">Home</a>
                    </li>
                    <jsp:useBean id="writer" class="dto.Writer" scope="session" >
					</jsp:useBean>
                     <li class="nav-item">
                        <a class="nav-link" href="signOut?type=writer">Sign Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><jsp:getProperty property="firstName" name="writer"/> <jsp:getProperty property="lastName" name="writer"/></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-12 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">Create Report</h5>
					<div class="card-body">
						<h5 class="text-center">Report Details</h5><hr>
						<form action="creatreport" method="GET">
							<input type="hidden" name ="writerID" value="<jsp:getProperty property="writerID" name="writer"/>" >
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group" hidden>
										<label for="reportEmail">Email</label>
										<input type="email" name="email" class="form-control" disabled value="<jsp:getProperty property="email" name="writer"/>">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="reportTitle">Title</label>
										<input type="text" name="title" class="form-control" id="reportTitle" placeholder="Title" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="reportKeywords">Keywords</label>
										<input type="text" name="keywords" class="form-control" id="reportKeywords" placeholder="java, multithreading, software">
									</div>									
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label for="reportSummery">Summery</label>
										<textarea class="form-control" name="summery" id="reportSummery" rows="3"></textarea>
									</div>
								</div>
								<div class="col-lg-12" size="3">
									<div class="form-group">
										<label for="reportFields">Fields</label>
										<select class="custom-select" id="reportFields" multiple>
											<c:forEach items="${field}" var="field" varStatus="seq1">
												<option value="${field.fieldID}">${seq1.count}- ${field.fieldName}</option>
											</c:forEach>
										</select>
										<input type="text" class="form-control mt-2" id="fieldsNames" name="fieldsNames" hidden>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-12">
									<h5 class="text-center mb-4 mt-2">First Writer's Details</h5>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >First Writer First Name</label>
										<input type="text" name ="firwrtfirName" class="form-control" id="reportTitle" placeholder="First Name">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >First Writer Last Name</label>
										<input type="text" name ="firwrtlasName" class="form-control" id="reportWriter" placeholder="Last Name">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label >First Writer Email</label>
										<input type="email" name ="firwrtemail" class="form-control" id="reportEmail" placeholder="Email">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >First Writer Position</label>
										<input type="text" name ="firwrtposi" class="form-control" id="reportPosition" placeholder="Position">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >First Writer Institute</label>
										<input type="text"  name ="firwrtinsti" class="form-control" id="reportInstitute" placeholder="Institute">
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-12">
									<h5 class="text-center mb-4 mt-2">Second Writer's Details</h5>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Second Writer First Name</label>
										<input type="text" name ="secwrtfirName" class="form-control" id="reportTitle" placeholder="First Name">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Second Writer Last Name</label>
										<input type="text" name ="secwrtlasName" class="form-control" id="reportWriter" placeholder="Last Name">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label >second Writer Email</label>
										<input type="email" name ="secwrtemail" class="form-control" id="reportEmail" placeholder="Email">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Second Writer Position</label>
										<input type="text" name ="secwrtposi" class="form-control" id="reportPosition" placeholder="Position">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Second Writer Institute</label>
										<input type="text"  name ="secwrtinsti" class="form-control" id="reportInstitute" placeholder="Institute">
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-12">
									<h5 class="text-center mb-4 mt-2">Third Writer's Details</h5>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Third Writer First Name</label>
										<input type="text" name ="thiwrtfirName" class="form-control" id="reportTitle" placeholder="First Name">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Third Writer Last Name</label>
										<input type="text" name ="thiwrtlasName" class="form-control" id="reportWriter" placeholder="Last Name">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label >Third Writer Email</label>
										<input type="email" name ="thiwrtemail" class="form-control" id="reportEmail" placeholder="Email">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Third Writer Position</label>
										<input type="text" name ="thiwrtposi" class="form-control" id="reportPosition" placeholder="Position">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label >Third Writer Institute</label>
										<input type="text"  name ="thiwrtinsti" class="form-control" id="reportInstitute" placeholder="Institute">
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-12">
									<button type="submit" class="col-lg-12 btn btn-primary">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>


	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script.js"></script>
</body>

</html>