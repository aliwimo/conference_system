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
    <title>Writer</title>
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
                    <jsp:useBean id="writer" class="dto.Writer" scope="session">
					</jsp:useBean>
                    <c:if test="${j == 1}">
	                    <li class="nav-item">
	                        <a class="nav-link" href="writerjudge?type=asjudge&ID=${writer.writerID }">Switch To Judge</a>
	                    </li>
                    </c:if>
                     <li class="nav-item">
                        <a class="nav-link" href="signOut?type=writer">Sign Out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"><jsp:getProperty property="firstName" name="writer"/> <jsp:getProperty property="lastName" name="writer"/></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <div class="container h-100">
        <div class="row">


            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="card bg-light mt-4">
                    <h5 class="card-header">Uploaded Recently</h5><br>
                    <div class="card-body">
                        <c:if test="${fn:length(recently) > 0}">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Report Title</th>
                                        <th>Writer Name</th>
                                        <th class="text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${recently}" var="reprot" varStatus="seq1">    
                                    <tr>
                                        <td><c:out value="${seq1.count}"></c:out></td>
                                        <td><c:out value="${reprot.title}"></c:out></td>
                                        <td><c:out value="${reprot.writer.firstName}  ${reprot.writer.lastName}"></c:out></td>        
                                        <td class="text-right"><a  href='reportDetailWriter?reportID=<c:out value="${reprot.reportID}"></c:out>&type=no' class="btn btn-sm btn-primary">Show</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${fn:length(recently) == 0}">
                            <p>No Reports Uploaded Recently</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="card bg-light mt-4">
                    <h5 class="card-header">Sended To be Evulated</h5><br>
                    <div class="card-body">
                        <c:if test="${fn:length(sended) > 0}">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Report Title</th>
                                        <th>Writer Name</th>
                                        <th>End Time</th>
                                        <th class="text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sended}" var="reprot" varStatus="seq1">    
                                    <tr>
                                        <td><c:out value="${seq1.count}"></c:out></td>
                                        <td><c:out value="${reprot.title}"></c:out></td>
                                        <td><c:out value="${reprot.writer.firstName}  ${reprot.writer.lastName}"></c:out></td>        
                                        <td><c:out value="${reprot.endTime}"></c:out></td>
                                        <td class="text-right"><a  href='reportDetailWriter?reportID=<c:out value="${reprot.reportID}"></c:out>&type=send' class="btn btn-sm btn-primary">Show</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${fn:length(sended) == 0}">
                            <p>No Reports is Sended</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="card bg-light mt-4">
                    <h5 class="card-header">Previous Reports</h5>
                    <br>
                    <p class = "text-center">The Number of Reports is : ${fn:length(pre)}</p>
                    <div class="card-body">
                        <c:if test="${fn:length(pre) > 0}">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Report ID</th>
                                        <th>Report Title</th>
                                        <th>Average Point</th>
                                        <th>Report Status</th>
                                        <th class="text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pre}" var="pre" varStatus="seq1">    
                                    <tr>
                                        <td><c:out value="${seq1.count}"></c:out></td>
                                        <td><c:out value="${pre.reportID}"></c:out></td>
                                        <td><c:out value="${pre.title}"></c:out></td> 
                                        <td><c:out value="${pre.avg}"></c:out></td>   
                                        <c:if test="${pre.decision == 1}">
                                            <td class="text-success"> Accepted </td>
                                            <td class="text-right"><a href = 'reportDetailWriter?reportID=<c:out value="${pre.reportID}"></c:out>&type=pre' class="btn btn-sm btn-primary">Details</a></td>
                                        </c:if>
                                        <c:if test="${pre.decision == 0}">
                                            <td class="text-danger"> Rejected</td>
                                            <td class="text-right"><a href = 'reportDetailWriter?reportID=<c:out value="${pre.reportID}"></c:out>&type=pre' class="btn btn-sm btn-primary">Details</a></td>
                                        </c:if> 
                                        <c:if test="${pre.decision == -1}">
                                            <td class="text-info">Decision Not Made  Yet</td>
                                            <td class="text-right"><a href = 'reportDetailWriter?reportID=<c:out value="${pre.reportID}"></c:out>&type=pre' class="btn btn-sm btn-primary">Details</a></td>
                                        </c:if>
                                        
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        
                        <c:if test="${fn:length(pre) == 0}">
                            <p>No Reports Accepted or Rejected</p>
                        </c:if>
                    </div>
                </div>
            </div>


            <div class="col-lg-12 col-md-12 mx-auto mt-4 mb-4">
                <a href="getfield?writerID=<jsp:getProperty property="writerID" name="writer"/>" class="btn btn-sm btn-block btn-primary">Create New</a>
            </div>
        </div>
    </div>


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>

</html>