<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/insert.css"/>">	
</head>
<body>
    <!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	
<div class="container con">
  <ul class="nav nav-pills nav-bar">
    <li class="active"><a data-toggle="pill" href="#Category">Category</a></li>
    <li><a data-toggle="pill" href="#Vendor">Vendor</a></li>
    <li><a data-toggle="pill" href="#Service">Service</a></li>
    <li><a data-toggle="pill" href="#list">List</a></li>
  </ul>
  
  <div class="tab-content tab">
    <div id="Category" class="tab-pane fade in active">
     <div class="container contain"> 
      <div class="row">
        <div class="col-am-1 col-md-7 col-md-offset-3">
          <center><h1 class="main_heading">Add Category</h1></center>
          <div class="wall ">
             <form action="<c:url value="/saveCat"/>" method="post" class="form-registratiom" >
              <p>Category ID</p>
                   <input type="text" name="cid" placeholder="Category ID" autofocus="true" class="form-control " >                 
              <p>Category Name</p>                    
                    <input type="text" name="categoryname" placeholder="Category Name" autofocus="true" class="form-control ">          
                <button class="btn btn-lg btn-primary btn-block">Create Category</button>
             </form>
          </div>
        </div>
      </div>
    </div>
    </div>
   
    <div id="Vendor" class="tab-pane fade">
    <div class="container contain"> 
      <div class="row">
        <div class="col-am-1 col-md-7 col-md-offset-3">
          <center><h1 class="main_heading">Add Vendor</h1></center>
          <div class="regestration-wall ">
             <form action="<c:url value="/saveVend"/>" method="post" class="form-registratiom" >
              <p>Vendor ID</p>
                   <input type="text" name="vid" placeholder="Vendor ID" autofocus="true" class="form-control">    
                <p>Vendor Name</p>
                    <input type="text" name="vendorname" placeholder="Vendor Name" autofocus="true" class="form-control">  
                <button class="btn btn-lg btn-primary btn-block">Create Vendor</button>
              </form>
          </div>
        </div>
      </div>
    </div> 
    </div>

    <div id="Service" class="tab-pane fade">
    <div class="container contain"> 
      <div class="row">
        <div class="col-am-1 col-md-7 col-md-offset-3">
          <h1 class="main_heading"><center>Add Service</center></h1>
          <div class="regestration-wall ">
             <form action="<c:url value="/saveServ"/>" method="post" enctype="multipart/form-data" class="form-registratiom" >
              <p>Service Name</p>
                   <input type="text" name="servicename" placeholder="Service Name" autofocus="true" class="form-control" >             
                <p>Price</p> 
                   <input type="text" name="price" placeholder="Price" autofocus="true" class="form-control">             
                <p>Stock</p>
                   <input type="text" name="stock" placeholder="Stock" autofocus="true" class="form-control">             
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
                   <input type="text" name="description" placeholder="Discription" autofocus="true" class="form-control" >             
                <p>Upload Image</p> 
                <div class="inputfile-box">
                  <input type="file" name="simage" id="file" class="inputfile" onchange='uploadFile(this)'>
                  <label for="file">
                    <span id="file-name" class="file-box"></span>
                    <span class="file-button">
                      <i class="fa fa-upload" aria-hidden="true"></i>
                      Upload Image
                    </span>
                  </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block">Add Service</button>
             </form>
          </div>
        </div>
      </div>
    </div>
    </div>
    <div id="list" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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