<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Update Service</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/updateServiceform.css"/>">
</head>
<body>
    <!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<div class="container" id="contain"> 
      <div class="row">
        <div class="col-am-1 col-md-7 col-md-offset-3">
          <h1 class="main_heading"><center>Update Service</center></h1>
          <div class="regestration-wall ">
          
             <form action="<c:url value="/admin/servUpdate"/>" method="post" enctype="multipart/form-data" class="form-registratiom" >
                   <input type="hidden" name="sid" value="${serv.sid }">
              <p>Service Name</p>
                   <input type="text" name="servicename" value="${serv.servicename }" placeholder="Service Name" autofocus="true" class="form-control" >             
                <p>Price</p> 
                   <input type="text" name="price" value="${serv.price }" placeholder="Price" autofocus="true" class="form-control">             
                <p>Stock</p>
                   <input type="text" name="stock" value="${serv.stock }" placeholder="Stock" autofocus="true" class="form-control">             
                <p>Category</p>
                <select name="category" required="true" autofocus="true" class="form-control">
                    <option value=""  selected>---Category---</option>
                    <c:forEach items="${catList}" var="cate">
                        <option value="${cate.cid}">${cate.categoryname }</option>
                    </c:forEach>
                </select>
                <p>Vendor</p>
                <select name="vendor" required="true" autofocus="true" class="form-control">
                    <option value=""  selected>---Vendor---</option>
                    <c:forEach items="${vendList}" var="vend">
                        <option value="${vend.vid}">${vend.vendorname }</option>
                    </c:forEach>
                </select>
                <p>Discription</p> 
                   <input type="text" name="description"  value="${serv.description }" placeholder="Discription" autofocus="true" class="form-control" >             
                <p>Upload Image</p> 
                <div class="inputfile-box">
                  <input type="file" name="simage" id="file" class="inputfile" onchange='uploadFile(this)'>
                  <label for="file">
                    <span id="file-name" ></span>
                    <span class="file-button">
                      <i class="fa fa-upload" aria-hidden="true"></i>
                      Upload Image
                    </span>
                  </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block">Update Service</button>
             </form>
          </div>
        </div>
      </div>
    </div>
    <!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	<script>
		function uploadFile(target) {
		    document.getElementById("file-name").innerHTML = target.files[0].name;
		}
	</script>
	<!--jquery (necessay for bootstrap javascript's plugins ) -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- include all the compiled plugins(below). or include individual file as needed-->
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>