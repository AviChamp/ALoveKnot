<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Service Detail</title>
    
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
</head>
<body>
<!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <div class="container">
      <center><h1 class="main_heading">Service Detail</h1></center>
       <div class="row">
			<div class="col-md-6 item-photo">
               <img src="${pageContext.request.contextPath}/resources/${service.imgname}"
                           style="max-width:100%; margin-top:50px; "/>
		    </div>
		    <div class="col-md-7">
		       <h2>${service.servicename}</h2>
		       <h4>${service.description}</h4>
		       <h5>${service.price}</h5>
		       <h5>${service.vendor.vendorname}</h5>
		    </div>
		    <br>
		    <div class="section">
		        <form action="${pageContext.request.contextPath}/addToCart" method="post">
		          <input type="hidden" value="${service.sid}" name="sid"/>
		          <input type="hidden" value="${service.price}" name="price"/>
		          <input type="hidden" value="${service.servicename}" name="servicename"/>
		          <input type="hidden" value="${service.imgname}" name="imgname"/>
		          <label><h3>Mention quantity of service for purchase</h3></label>
		          <input type="number" class="form-control" name="cartQuantity" required>
		        </form>
		    </div>
		</div>
    </div> 		    

</body>
</html>