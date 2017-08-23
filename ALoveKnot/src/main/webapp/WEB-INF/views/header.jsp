<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags must come first in the head,then any other content must come after these tags -->
	<link rel="icon" href="<c:url value="/resources/img/icon.png"/>">

	<!--Bootstrap and CSS-->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/header.css"/>">	
	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
</head>
<body>

<body>
<div class="header">
		<nav class="my-nav navbar navbar-default navbar-inverse navbar-fixed-top ">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header my-collapse">
		      <button type="button" class="navbar-toggle collapsed " data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="<c:url value="/resources/img/icon.png"/>"></a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <c:forEach var="catVal" items="${catList}">
			            <li><a href="${pageContext.request.contextPath}/serviceCustList?cid=<c:out value="${catVal.cid}"></c:out>">${catVal.categoryname}</a></li>
		            </c:forEach>
		          </ul>
		        </li>
		        <sec:authorize access="hasRole('ROLE_ADMIN')">
		          <li><a href="${pageContext.request.contextPath}/admin/insert">Admin</a></li>
		        </sec:authorize>
		        <li><a href="${pageContext.request.contextPath}/aboutUs">About</a></li>
		      </ul>
		     <form class="navbar-form navbar-left my-form">
		        <div class="form-group">
		          <input type="text" id="search" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default my-btn"> <i class="glyphicon glyphicon-search"></i></button>
		      </form>
		       <ul class="nav navbar-nav navbar-right right-search">
		       <c:if test="${pageContext.request.userPrincipal.name==null}">
		        <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
		        <li><a  href="${pageContext.request.contextPath}/login">Login</a></li>
               </c:if>
               <c:if test="${pageContext.request.userPrincipal.name!=null}">
                <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li> 
                <sec:authorize access="hasRole('ROLE_USER')">
                   <li><a href="<c:url value="/cart/myCart"/>"><i class="fa fa-shopping-cart" style="color: #fff;" aria-hidden="true"></i></span></a></li>
                </sec:authorize>
                <li><a href="<c:url value="/logout"/>">Logout</a></li>
               </c:if>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>	
     </div>
    
   <!--jquery (necessay for bootstrap javascript's plugins ) -->
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <!-- include all the compiled plugins(below). or include individual file as needed-->
   <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
   <!--navigation script-->
   <script type="text/javascript" src="<c:url value="/resources/js/navshrink.js"/>"></script>
    	
   </body>
 </html>  