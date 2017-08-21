<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/invoice.css"/>">	
</head>
<body>
<!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<!-- Body -->
  <c:set var="tot" value="0"/>
  <c:forEach var="c" items="${cart}">
    <c:set var="tot" value="${gtot+ c.cartPrice * c.cartQuantity}"/>  
  </c:forEach>
    <c:set var="cgst" value="${tot*.18}"/> 
    <c:set var="sgst" value="${tot*.18}"/> 
    <c:set var="gtot" value="${tot+cgst+sgst}"/> 
<div class="container con">
  <div class="row">
   <div class="receipt-main col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
    <div class="row">
     <div class="receipt-header">
	  <div class="col-xs-6 col-sm-6 col-md-6">
	   <div class="receipt-left">
		<img class="img-responsive" alt="iamgurdeeposahan" src="<c:url value="/resources/img/icon.png"/>" style="width: 150px; ">
	   </div>
	  </div>
	 <div class="col-xs-6 col-sm-6 col-md-6 text-right">
	  <div class="receipt-right">
	    <h3>Love Knot</h3>
		<p>+91 85100-26639 <i class="fa fa-phone"></i></p>
		<p>Avichamp@Love.knot <i class="fa fa-envelope-o"></i></p>
		<p>India <i class="fa fa-location-arrow"></i></p>
	  </div>
	 </div>
	</div>
   </div>
			
   <div class="row">
	<div class="receipt-header receipt-header-mid">
	 <div class="col-xs-8 col-sm-8 col-md-8 text-left">
	  <div class="receipt-right">
		<h5>${user.firstName} ${user.lastName}</h5>
		<p><b>Mobile :</b> ${user.phonNo}</p>
		<p><b>Email :</b> ${user.email}</p>
	  </div>
	 </div>
	 <div class="col-xs-4 col-sm-4 col-md-4">
	  <div class="receipt-left">
	   <h1>Receipt</h1>
	  </div>
	 </div>
	</div>
   </div>
			
   <div>
     <table class="table table-bordered">
       <thead>
        <tr>
         <th>Description</th>
         <th>Amount</th>
        </tr>
       </thead>
       <tbody>
        <c:forEach var="c" items="${cart}">
         <tr>
          <td class="col-md-9">${c.cartServiceName}</td>
          <td class="col-md-3"><i class="fa fa-inr"></i> ${c.cartPrice}/-</td>
         </tr>
         </c:forEach>
        <tr>
          <td class="text-right">
            <p>
              <strong>Total Amount: </strong>
            </p>
		    <p>
              <strong>CGST: </strong>
            </p>
			<p>
            <strong>SGST: </strong>
            </p>
		  </td>
          <td>
            <p>
              <strong><i class="fa fa-inr"></i> ${tot}/-</strong>
            </p>
            <p>
              <strong><i class="fa fa-inr"></i> ${cgst}/-</strong>
            </p>
			<p>
              <strong><i class="fa fa-inr"></i> ${sgst}/-</strong>
            </p>
		  </td>
         </tr>
         <tr>
           <td class="text-right"><h2><strong>Total: </strong></h2></td>
           <td class="text-left text-danger"><h2><strong><i class="fa fa-inr"></i> ${gtot}/-</strong></h2></td>
         </tr>
        </tbody>
       </table>
      </div>		

	<div class="container">
     <div class="row">
       <!-- You can make it whatever width you want. I'm making it full width
             on <= small devices and 4/12 page width on >= medium devices -->
       <div class="col-xs-12 col-md-9 col">
         <div class="panel panel-default credit-card-box ">
          <div class="panel-heading display-table col-md-12" >
           <div class="row display-tr" >
            <h2 style="color: rgb(140, 140, 140);">Thank you for shoping</h2>
            <div class="receipt-right" >                            
              <c:set var = "now" value = "<%= new java.util.Date()%>" />
		      <p><b>Date :</b>  <fmt:formatDate type = "date" value = "${now}" /></p>
            </div>
           </div>                    
          </div>
          <center><a href="${pageContext.request.contextPath}/index" class="btn btn-warning" style="height:50px; width: 100%; font-size:30px; margin-top:30px;">Go to Home <i class="fa fa-angle-right"></i></a></center> 
         </div>
       </div>            
      </div>                
     </div>
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