<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="<c:url value="/resources/css/login.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
</head>
<body>
	<!--Header-->
	<!--<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>-->
	<div id="formcontainer">
	   <c:if test="${not empty message}">
	      <div class="row">
			<div class="col-am-1 col-md-6 col-md-offset-3">
			   <div class="alert alert-danger">
	               <strong>${message}</strong>
			   </div>
	         </div>
	      </div>  
	   </c:if>
	
		<div class="row">
			<div class="col-am-1 col-md-14 col-md-offset-0">
				<form  id="form" action="${pageContext.request.contextPath}/login" method="post" class="modal-content animate">
					<div class="imgcontainer">
						<img src="<c:url value="/resources/img/profile.png"/>"
							alt="Avatar" class="avatar">
					</div>

					<div class="formcontainer">
						<label><b>Username</b></label> <input type="text"
							placeholder="Enter Username" name="username" required> <label><b>Password</b></label>
						<input type="password" placeholder="Enter Password"
							name="password" required>
						<button type="submit">Login</button>
						<input type="checkbox" checked="checked"> Remember me
					</div>

					<div class="formcontainer" style="background-color: #f1f1f1">
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn">Cancel</button>
						<span class="psw"><a href="#">Forgot password?</a></span>
					</div>
				</form>

			</div>
		</div>
	</div>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
      <!--jquery (necessay for bootstrap javascript's plugins ) -->
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <!-- include all the compiled plugins(below). or include individual file as needed-->
   <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>