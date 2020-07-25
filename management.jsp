<%@page import="dto.Report"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
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
                    <li class="nav-item">
                        <a class="nav-link" href="management">Home</a>
                    </li>
                    <jsp:useBean id="okb" class="dto.OKB" scope="session">
					</jsp:useBean>
                     <li class="nav-item">
                        <a class="nav-link" href="../signOut?type=okb">Sign Out</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link"><jsp:getProperty property="firstName" name="okb"/></a>
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
                                        <td class="text-right"><a  href='management/reportDetailOkb?reportID=${reprot.reportID}&type=no' class="btn btn-sm btn-primary">Show</a></td>
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
                                        <td class="text-right"><a  href='management/reportDetailOkb?reportID=${reprot.reportID}&type=send' class="btn btn-sm btn-primary">Show</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${fn:length(sended) == 0}">
                            <p>No Reports Sended</p>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="card bg-light mt-4">
                    <h5 class="card-header">Waiting to Make Decision</h5><br>
                    <div class="card-body">
                        <c:if test="${fn:length(wait) > 0}">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Report Title</th>
                                        <th>Writer Name</th>
                                        <th>Average Point</th>
                                        <th class="text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${wait}" var="reprot" varStatus="seq1">    
                                    <tr>
                                        <td><c:out value="${seq1.count}"></c:out></td>
                                        <td><c:out value="${reprot.title}"></c:out></td>
                                        <td><c:out value="${reprot.writer.firstName}  ${reprot.writer.lastName}"></c:out></td>        
                                        <td><c:out value="${reprot.avg}"></c:out></td>
                                        <td class="text-right"><a  href='management/reportDetailOkb?reportID=${reprot.reportID}&type=decision' class="btn btn-sm btn-primary">Show</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${fn:length(wait) == 0}">
                            <p>No Reports Waiting for Decision</p>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 mx-auto">
                <div class="card bg-light mt-4">
                    <h5 class="card-header">Report With Decision</h5><br>
                    <div class="card-body">
                        <c:if test="${fn:length(AcceptedOrRejected) > 0}">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Report Title</th>
                                        <th>Writer Name</th>
                                        <th>Avreg Point</th>
                                        <th>Decision</th>
                                        <th class="text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${AcceptedOrRejected}" var="reprot" varStatus="seq1">    
                                    <tr>
                                        <td><c:out value="${seq1.count}"></c:out></td>
                                        <td><c:out value="${reprot.title}"></c:out></td>
                                        <td><c:out value="${reprot.writer.firstName} ${reprot.writer.lastName}"></c:out></td>        
                                        <td><c:out value="${reprot.avg}"></c:out></td>
                                        <c:if test="${reprot.decision == 1}"><td class="text-success">Accepted</td></c:if>
                                        <c:if test="${reprot.decision != 1}"><td class="text-danger">Rejected</td></c:if>
                                        <td class="text-right"><a  href='management/reportDetailOkb?reportID=${reprot.reportID}&type=result' class="btn btn-sm btn-primary">Show</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${fn:length(AcceptedOrRejected) == 0}">
                            <p>No Reports Accepted or Rejected</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br><br>


    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/script.js"></script>
</body>

</html>