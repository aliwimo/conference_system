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
	<link rel="stylesheet" href="css/fontawesome.min.css">
	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
		.Rejected, .Accept{background:#FFF;}
		.Rejected:hover{color:#FFF;}
	</style>
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
                    <li class="nav-item">
                        <a class="nav-link" href="judge">Home</a>
                    </li>
                    <jsp:useBean id="judge" class="dto.Judge" scope="session">
					</jsp:useBean>
                     <li class="nav-item">
                        <a class="nav-link" href="signOut">Sign Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><jsp:getProperty property="firstName" name="judge"/> <jsp:getProperty property="lastName" name="judge"/></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
   	<div class="container h-100 mb-4">
		<div class="row">
			<c:if test="${type == 'no'}">
				<div class="col-lg-12 mx-auto">
					<div class="card bg-light mt-4">
						<h5 class="card-header">Report Judges</h5>
						<form action='../../sendtojudge' method="GET">
							<div class="card-body">
								<p class="mt-0 mb-2">Choose 3 Judges at least ..</p>
								<div id="chooseJudge">
								<c:forEach items="${judge}" var="judge" varStatus="seq1">
									<div class="custom-control custom-checkbox custom-control-inline">
										<input type="checkbox" class="custom-control-input" name="judges[]" id="judge${seq1.count}"
											value="${judge.judgeId}" <c:if test="${seq1.count < 4}"> checked </c:if>>
										<label class="custom-control-label" for="judge${seq1.count}"> ${judge.firstName} ${judge.lastName}</label>
									</div>
								</c:forEach>
									<hr>
									<label  for="endTime">Choose End Time Of Judge Evaluate</label>   
									<input  type="datetime-local" name="endTime" required>
									<input type="hidden" name="reportID" value="${report.reportID}">
								</div>
								<input type="text" class="form-control mt-2" id="judNames" name="judgeNames">
							</div>
							<div class="card-footer text-right pt-2 pb-2">
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" id="automatic">
									<label class="custom-control-label" for="automatic" name="automatic">Simulate</label>
								</div>
								<button type="submit" id="judgesSubmit" class="btn btn-sm btn-primary">Send To Judge</button>
							</div>
						</form>
					</div>
				</div>
			</c:if>
		
			<c:if test="${type == 'result'}">
				<div class="col-lg-12 mx-auto">
					<div class="card bg-light mt-4">
						<div class="card-body">
							<div class="row text-center">
								<div class="col-lg-4 col-md-4">
									<div class="dataTitle text-secondary">Result Date</div>
									<div class="font-weight-bold">${report.makeDecisionTime}</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="dataTitle text-secondary">Rate</div>
									<div class="font-weight-bold">${report.avg}/5</div>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="dataTitle text-secondary">Final Result</div>
									<c:if test="${Accept == 1}"><div class="font-weight-bold text-success">Accepted</div></c:if>
									<c:if test="${Accept != 1}"><div class="font-weight-bold text-danger">Rejected</div></c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		
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
						<c:forEach items="${reportdetails}" var="reportdetails" varStatus="seq1">
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
								<div class="mb-2">${report.writer.firstName} ${writer.lastName}</div>
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
		
		<div class="col-lg-12 mx-auto">
			<div class="card bg-light mt-4">
				<h5 class="card-header">Judges</h5>
				<div class="card-body">
					<c:forEach items="${judgeReports}" var="judgeReports" varStatus="seq1">
						<h6 class="SectionTitle mt-2 mb-4 text-primary"><span>${seq1.count}.</span> Judge's Information & Evaluation</h6>
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Name</div>
								<div class="mb-2">${judgeReports.judge.firstName} ${judgeReports.judge.lastName}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Phone</div>
								<div class="mb-2">${judgeReports.judge.phone}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Email</div>
								<div class="mb-2">${judgeReports.judge.email}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Position</div>
								<div class="mb-2">${judgeReports.judge.position}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Institute</div>
								<div class="mb-2">${judgeReports.judge.institute}</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="dataTitle text-secondary">Fields</div>
								<div class="mb-2"><c:forEach items="${judgeReports.judge.field}" var="field" >${field.fieldName}, </c:forEach></div>
							</div>
						</div>
						<c:if test="${judgeReports.rated == 1}">
							<div class="mt-3" id="judgeComments">
								<div class="alert alert-secondary" role="alert">
									<p class="font-weight-bold mt-1 mb-1">Spelling Language</p>
									<p class="mb-0">${judgeReports.spellingLanguage}</p>
								</div>
								<div class="alert alert-secondary" role="alert">
									<p class="font-weight-bold mt-1 mb-1">Scientific Effect</p>
									<p class="mb-0">${judgeReports.scientificEffect}</p>
								</div>
								<div class="alert alert-secondary" role="alert">
									<p class="font-weight-bold mt-1 mb-1">General Opinion</p>
									<p class="mb-0">${judgeReports.opinion}</p>
								</div>
								<c:if test="${judgeReports.point == 1 or judgeReports.point == 2}">
									<div class="alert alert-danger" role="alert">
										<p class="mb-0">
											<span class="font-weight-bold">Point: </span>${judgeReports.point}/5
											<c:if test="${judgeReports.point == 1}"> (Kesin Red)</c:if>
											<c:if test="${judgeReports.point == 2}"> (Zayif Red)</c:if>
										</p>
									</div>
								</c:if>
								
								<c:if test="${judgeReports.point == 3 or judgeReports.point == 4 or judgeReports.point == 5}">
									<div class="alert alert-success" role="alert">
										<p class="mb-0">
											<span class="font-weight-bold">Point: </span>${judgeReports.point}/5
											<c:if test="${judgeReports.point == 3}"> (Notr)</c:if>
											<c:if test="${judgeReports.point == 4}"> (Kabul)</c:if>
											<c:if test="${judgeReports.point == 5}"> (Kesin Kabul)</c:if>
										</p>
									</div>
								</c:if>
							</div>
						</c:if>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/fontawesome.min.js"></script>
    <script src="js/script.js"></script>
</body>

</html>