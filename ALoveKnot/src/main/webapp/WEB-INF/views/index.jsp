<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags must come first in the head,then any other content must come after these tags -->

	<title>Home</title>
	<link rel="icon" href="<c:url value="/resources/img/icon.png"/>">

	<!--Bootstrap and CSS-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css"/>">	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
</head>
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
		      <a class="navbar-brand" href="#"><img src="<c:url value="/resources/img/icon.png"/>"></a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="#">Home</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		          </ul>
		        </li>
		        <li><a href="insert">Admin</a></li>
		        <li><a href="#">About</a></li>
		      </ul>
				 <form class="navbar-form navbar-left my-form">
				  <div class="input-group">
				    <input type="text" class="form-control" placeholder="Search">
				    <div class="input-group-btn">
				      <button class="btn btn-default my-btn" type="submit">
				        <i class="glyphicon glyphicon-search"></i>
				      </button>
				    </div>
				  </div>
				</form> 
		      <ul class="nav navbar-nav navbar-right right-search">
		        <li><a href="register">Register</a></li>
		        <li><a href="#">Login</a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
         
        <!--Carousel-->  
		<div id="carousel-example-generic" class=" my-carousel carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="6"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="7"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="8"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="9"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="10"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="11"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="12"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="13"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="14"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="15"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="16"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="17"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="18"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="19"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="20"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="21"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="22"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="23"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="24"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="25"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		 <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="<c:url value="/resources/img/Carousel/1.jpg"/>" alt="...">
		      <div class="carousel-caption">
		       
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/2.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/3.png"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/4.png"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/5.jpg"/>"alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/6.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/7.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/8.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/9.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/10.png"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/11.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div><div class="item">
		      <img src="<c:url value="/resources/img/Carousel/12.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/13.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/14.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/15.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/16.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/17.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/18.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/19.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/20.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/21.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/22.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/23.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/24.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/25.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/img/Carousel/26.jpg"/>" alt="...">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	
	<!--Body-->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-xs-6 main1-img">
				<img class="img-responsive" src="<c:url value="/resources/img/main1.jpg"/>"> 
			</div>
			<div class="col-md-6 col-xs-6 text">
				<p>
			      no shadhi no vidhai bas chudhai hi chudhai
				</p>
			</div>
		</div>
	</div>

    <!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
   <!--jquery (necessay for bootstrap javascript's plugins ) -->
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <!-- include all the compiled plugins(below). or include individual file as needed-->
   <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
   <!--navigation script-->
   <script type="text/javascript" src="<c:url value="/resources/js/navshrink.js"/>"></script>

</body>
</html>