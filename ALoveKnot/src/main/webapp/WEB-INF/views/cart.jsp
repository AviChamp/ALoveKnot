<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Cart</title>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/serviceDetail.css"/>">	
</head>
<body>
<!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<!-- Body -->
<h2><img alt="cart" src="<c:url value="/resources/img/cart.png"/>"></h2>
<table id="cart" class="table table-hover table-condensed">
  <thead>
    <tr>
     <th>Product Name</th>
     <th>Quantity</th>
     <th>Price</th>
     <th>Image</th>
     <th>Total</th>
     <th>Action</th>
    </tr> 
  </thead>
  <tbody>
    <c:if test="${empty cartInfo}">
         <tr>
           <td colspan="6" allign="center">No Record Exist</td>
         </tr>  
    </c:if>
    <c:set var="gtot" value="0"></c:set>
    <c:forEach var="c" varStatus="st" items="${cartInfo}">
       <tr>
          <td><c:out value="${c.cartServiceName}"></c:out></td>
          <td><c:out value="${c.cartQuantity }"></c:out></td>
          <td><c:out value="${c.cartPrice }"></c:out></td>
          <td><img src="${pageContext.request.contextPath}/resources/<c:out value="${c.cartImage}"></c:out>"></td>
          <td><c:out value="${c.cartQuantity * c.cartPrice}"></c:out></td>
          <td><a class="btn btn-info" role="button" href="${pageContext.request.contextPath}/cart/deleteCart/${c.cartId}">Delete</a></td>
          <c:set var="gtot" value="${gtot+ cartPrice * cartQuantity}"></c:set>
       </tr>
    </c:forEach>
    <tr>
       <td><span class="col-lg-9" allign="right"><c:out value="${gtot}"></c:out></span></td>
    </tr>
  </tbody>
  <tfoot>
     <td><a href="${pageContext.request.contextPath}/index" class="btn btn-warning"><i class="fa fa-angle-left"></i>Continue Shopping</a></td>
     <td><a href="${pageContext.request.contextPath}/checkout" class="btn btn-success btn-block">Checkout<i class="fa fa-angle-right"></i></a></td>  
  </tfoot>
</table>
<!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	<!--jquery (necessay for bootstrap javascript's plugins ) -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- include all the compiled plugins(below). or include individual file as needed-->
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>