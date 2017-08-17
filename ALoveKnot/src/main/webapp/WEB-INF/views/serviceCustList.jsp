<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Service Customer List</title>
	    
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/serviceCustList.css"/>">	
</head>
<body>
    <!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <div class="container">
      <h1 class="main_heading"><center>Service List</center></h1>
      <table class="table table-hover display" border="1" width="90" align="center">
        <tr>
           <th>S.No</th>
           <th>SID</th>
           <th>Service Name</th>
           <th>Category</th>
           <th>Vendor</th>
           <th>Price</th>
           <th>Stock</th>
           <th style="width:15">Description</th>
           <th>Image</th>
           <th>More Info</th>
        </tr>
        <c:if test="${empty serviceList}">
           <tr><td colspan="10" align="center">No record exists</td></tr>
        </c:if>
        
        <c:forEach var="c" varStatus="st" items="${serviceList}">
          <tr>
           <td><c:out value="${st.count}"></c:out></td>
           <td><c:out value="${c.sid }"></c:out></td>
           <td><c:out value="${c.servicename }"></c:out></td>
           <td><c:out value="${c.category.categoryname }"></c:out></td>
           <td><c:out value="${c.vendor.vendorname }"></c:out></td>
           <td><c:out value="${c.price }"></c:out></td>
           <td><c:out value="${c.stock }"></c:out></td>
           <td class="span2"><c:out value="${c.description }"></c:out></td>
           <td><img src="${pageContext.request.contextPath}/resources/${c.imgname}" height="50px" width="50px"></td>
           <td><a class="btn btn-info" role="button" href="<c:url value="/serviceDetail/${c.sid}"/>">More Details</a></td>
          </tr>
        </c:forEach>
      </table>
     </div> 
    
    <!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	
	<!--jquery (necessay for bootstrap javascript's plugins ) -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- include all the compiled plugins(below). or include individual file as needed-->
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>