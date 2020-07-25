<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Judge</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <jsp:useBean id="judge" class="dto.Judge" scope="session">
					</jsp:useBean>
                     <li class="nav-item">
                        <a class="nav-link" href="signOut?type=judge">Sign Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><jsp:getProperty property="firstName" name="judge"/> <jsp:getProperty property="lastName" name="judge"/></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<body>
<div class="container h-100">
		<div class="row align-items-center h-100">
			<div class="col-12 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">Rate Report</h5>
					<div class="card-body">
						<form action="judgeRate" method="GET">
							<input type="hidden" name="judgeID" class="form-control"  value="${JudgeID}">
							<input type="hidden" name="reportID" class="form-control"  value="${report.reportID}">
							<input type="hidden" name="type" class="form-control"  value="insertrate">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label for="Point">Point</label>
										<select class="form-control" name="point">
											<option value="1">Kesin Red</option>
											<option value="2">Red</option>
											<option value="3" selected>Notr</option>
											<option value="4">Kabul</option>
											<option value="5">Kesin Kabul</option>
										</select>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="ScientificEffect">Scientific Effect</label>
										<textarea class="form-control" name="ScientificEffect" id="ScientificEffect" rows="3"></textarea>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label for="spellingLanguage">Spelling Language</label>
										<textarea class="form-control" name="spellingLanguage" id="spellingLanguage" rows="3"></textarea>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label for="opinion">General Opinion</label>
										<textarea class="form-control" name="opinion" id="opinion" rows="3"></textarea>
									</div>
								</div>
							</div>
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
   	<div class="container h-100 mb-4">
		<div class="row">
			<div class="col-lg-12 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">${report.title}</h5>
					<div class="card-body">
						<p class="mb-0 text-justify">${report.summery}</p>
						<hr>
						<div class="mb-0 keywordsFields">
							<p class="mb-0 text-left"><span class="badge badge-primary">Keywords</span> <c:forEach items="${report.keyword}" var="keyword" >${keyword}, </c:forEach></p>
							<p class="mb-0 text-left"><span class="badge badge-primary">Fields</span> <c:forEach items="${report.field}" var="field" >${field.fieldName}, </c:forEach></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 mx-auto">
				<div class="card bg-light mt-4">
					<h5 class="card-header">Report Details</h5>
					<div class="card-body">
						<h6 class="SectionTitle mt-0 text-primary">Report Writers</h6>
						<c:forEach items="${reportDetails}" var="reportdetails" varStatus="seq1">
							<div class="row">
								<div class="col-lg-3 col-md-6">
									<div class="dataTitle text-secondary">Name</div>
									<div class="mb-2">${reportdetails.writerFirstName} ${reportdetails.writerLastName}</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<div class="dataTitle text-secondary">Email</div>
									<div class="mb-2">${reportdetails.email}</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<div class="dataTitle text-secondary">Position</div>
									<div class="mb-2">${reportdetails.position}</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<div class="dataTitle text-secondary">Institute</div>
									<div class="mb-2">${reportdetails.institute}</div>
								</div>
							</div>
							<hr>
						</c:forEach>
						<h6 class="SectionTitle mt-0 text-primary">Report Uploader</h6>
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Name</div>
								<div class="mb-2">${report.writer.firstName} ${report.writer.lastName}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Email</div>
								<div class="mb-2">${report.writer.email}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Position</div>
								<div class="mb-2">${report.writer.position}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Institute</div>
								<div class="mb-2">${report.writer.institute}</div>
							</div>
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