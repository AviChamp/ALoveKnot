<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html" charset=ISO-8859-1">
  <title>Service Detail</title>
    
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/serviceDetail.css"/>">	
</head>
<body>
<!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<!-- Body -->
	<div class="container con">
	  <div class="card">
		<div class="container-fliud">
		  <div class="wrapper row">
			<div class="preview col-md-6">			
			   <div class="preview-pic tab-content">
				  <div class="tab-pane active" id="pic-1"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></div>
				  <div class="tab-pane" id="pic-2"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></div>
				  <div class="tab-pane" id="pic-3"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></div>
				  <div class="tab-pane" id="pic-4"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></div>
				  <div class="tab-pane" id="pic-5"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></div>
			   </div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/${service.imgname}" /></a></li>
						</ul>
						
					</div>
					<div class="details col-md-6">
						<h3 class="product-title"> ${service.servicename}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">${service.description}</p>
						<h4 class="price">Current price: <span>&#8377 ${service.price}</span></h4>
						<h4 class="price">Vendor: <span>${service.vendor.vendorname}</span></h4>
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h5 class="sizes">
							Enter the ammount u want to purchase
						</h5>
						<div >
							<form action="${pageContext.request.contextPath}/cart/addToCart" method="post">
								 <input type="hidden" value="${service.sid}" name="sid"/>
		                         <input type="hidden" value="${service.price}" name="price"/>
		                         <input type="hidden" value="${service.servicename}" name="servicename"/>
             		             <input type="hidden" value="${service.imgname}" name="imgname"/>								 
							     <input type="number" class="form-control" name="cartQuantity" required><br>
								 <p align="right"> 
								    <button id="add-to-cart"class=" btn btn-default" type="submit">add to cart</button>
							     </p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!--jquery (necessay for bootstrap javascript's plugins ) -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- include all the compiled plugins(below). or include individual file as needed-->
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>