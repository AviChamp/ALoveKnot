<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="TIS-620">
  <meta http-equiv="X-UA-Compatible" content="IE-edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags must come first in the head,then any other content must come after these tags -->

  <title>About Us</title>
  <link rel="icon" href="<c:url value="/resources/img/icon.png"/>">

  <!--Bootstrap and CSS-->
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css"/>">  
  <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet'>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
  <style>
   body{font-family:'Open Sans Condensed',sans-serif;font-size:20px; background:#f8f8f8;}
   /* header */
   html,body{height:100%; width:100%;}
   h1,h2,h3{font-weight:700;}
   header{position:relative; width:100%; background-size:cover; background-position:center; background-image:url(<c:url value="/resources/img/header.jpg"/>); text-align:center;}
   header .wel{position: relative;text-align: center;padding: 100px 15px 100px;width: 100%; color:#eee;}
   .wel h1{font-weight:700; color:#fff}.brk{height:4px; border-radius:4px; background:#d9534f; margin:25px auto; display:block; width:60px;}
   .abs-back{background:rgba(29, 21, 24, 0.4); position:absolute; height:100%; width:100%; left:0; top:0;}
   /* who we */
   .who-we{margin-top:50px; margin-bottom:50px;}
   .who-we h2{color:#d9534f;}
    /* cards*/
   .cards-row{padding-top:10px; padding-bottom:50px; background:#eee;}
   .thumbnail{padding:0; margin-top:-700px; border-radius:0; border:none; box-shadow:0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);}
   .thumbnail>img{width:100%; display:block;height: 480px;}
   .thumbnail h3{font-size:26px; color:#336;}
   .thumbnail h3,.card-description{margin:0; padding:8px 0; border-bottom:solid 1px #eee; text-align:center;}
   .thumbnail p{padding-top:8px; font-size:20px;}
   .thumbnail .btn{border-radius:0; box-shadow:0 2px 5px 0 rgba(0,0,0,.16),0 2px 10px 0 rgba(0,0,0,.12); font-size:20px;}
   .team-pic{height:250px !important; width:250px !important; border-radius:50%; margin-top:-125px; box-shadow:0 2px 5px 0 rgba(0,0,0,.4),0 2px 10px 0 rgba(0,0,0,.5); transition:all .2s ease-out;}
   .thumbnail:hover .team-pic{height:300px !important; width:300px !important; margin-top:-150px;}
   .thumbnail p.social{padding-top:15px; text-align:center;}
   .social a{color:#FFF; font-size:18px !important;}
   .social i.fa{height:36px; width:36px; text-align:center; line-height:36px; background:#069; border-radius:50%;}
   .social i.fa.fa-facebook{background:#43609C;}
   .social i.fa.fa-linkedin{background:#428099;}
   .social i.fa.fa-google-plus{background:#ce4d39;}
   /* media */
   @media (min-width:768px) { 
   header{ min-height: 100%;} 
   header .wel{position:absolute; top:50%; transform:translateY(-50%); -moz-transform:translateY(-50%); -webkit-transform: translateY(-50%); -ms-transform: translateY(-50%); padding: 0 50px;}
   .wel-info{max-width:850px; margin-left:auto; margin-right:auto} .
   who-we h2{font-size:42px;} .wel h1{font-size:65px;} header .wel{font-size:26px;} 
   } 
  </style>
 </head>
<body>
<!--Header-->
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
          <div class="input-group search-input">
            <input type="text" class="form-control" id="search" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default my-btn" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </form> 
           <ul class="nav navbar-nav navbar-right right-search">
           <c:if test="${pageContext.request.userPrincipal.name==null}">
            <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
            <li><a  href="${pageContext.request.contextPath}/login">Login</a></li>
               </c:if>
               <c:if test="${pageContext.request.userPrincipal.name!=null}">
                <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li> 
               <sec:authorize access="hasRole('ROLE_USER')">
                <li><a href="<c:url value="/cart/myCart"/>"><i class="fa fa-shopping-cart" style="color: #fff;" aria-hidden="true"></i></a></li>
               </sec:authorize>
                <li><a href="<c:url value="/logout"/>">Logout</a></li>
               </c:if>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </div>


<!--Body-->
<header id="full">
 <div class="abs-back"></div>
  <div class="wel">
   <div class="wel-info">
    <h1>Love Knot About Us </h1>
    <span class="brk"></span>
    <p>As the #1 trusted authority on all things weddings,  Love Knot is the world's largest source for wedding news and inspiration. We &#39;ll help you stay on top of trends to plan a wedding that &#39;s totally you.</p>
   </div>
  </div>
</header>

<div class="container who-we">
 <div class="wel-info text-center">
  <h2>Who We Are?</h2>
   <span class="brk"></span>
    <p>Love Knot had one mission in mind &#45; to help other couples easily navigate every wedding planning detail, both big and small. After all, wedding is a special day in one's life. Combine a whirlwind engagement, an unfamiliar city and an interracial couple and forget it &#45; there was simply no resource with the insight they needed to help them plan. </p>
 </div>
</div>

<div class="container-fluid cards-row">
 <div class="container">
  <div class="row">
   <div style="margin-left: 30px;">
    <div class="col-sm-3 col-md-6 col-md-offset-3">
     <div class="thumbnail">
      <img src="<c:url value="/resources/img/back.jpg"/>" alt="about us page design using bootstrap">
      <img class="team-pic" src="<c:url value="/resources/img/front.jpg"/>">
      <div class="caption">
        <h3>Avadhesh Chamola</h3>
        <p class="card-description">Designer and Devloper at LOVE KNOT</p>
        <p class="social">
          <a href="https://www.facebook.com/itsavichamp"><i class="fa fa-facebook"></i></a> 
          <a href="https://in.linkedin.com/in/avadhesh-chamola-576854136"><i class="fa fa-linkedin"></i></a>
           <a href="https://plus.google.com/108387961922770504478"><i class="fa fa-google-plus"></i></a></p>
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
   <!--navigation script-->
   <script type="text/javascript" src="<c:url value="/resources/js/navshrink.js"/>"></script>

</body>
</html>  
