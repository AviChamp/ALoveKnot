<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Register</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/intlTelInput.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/user_signup.css"/>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
   <!--Header-->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
    <div class="container"> 
      <div class="row">
        <div class="col-am-1 col-md-7 col-md-offset-3 col">
          <h1 class="main_heading"><center>Create your Account</center></h1>
          <div class="regestration-wall ">
             <f:form modelAttribute="user" action="saveregister" method="post">
             	<p>Name</p>
             	<div class="name">
             	   <f:input path="firstName" placeholder="First Name" class="form-control name" autofocus="true" required="true"/>
             	   <f:input path="lastName" placeholder="Surname" class="form-control name" autofocus="true" required="true"/> 
             	    </div>    
                <p>Choose your desired email</p>
                <div class="email">
                <f:input path="email"  type="email" placeholder="Avichamp@love.knot" class="form-control" autofocus="true" required="true"/> 
                </div>
                <p>Enter password</p>
                <div class="password">
                <f:input path="password" type="password" placeholder="Password" class="form-control" autofocus="true" required="true"/> 
                </div>
                <div class="bday">
                  <p>Birthday</p>
                    <f:input path="date" placeholder="Date" class="form-control" autofocus="true" required="true"/>
                    <f:select path="month" class="form-control" autofocus="true">
                        <f:options items="${monthList}" />
                    </f:select>
                    <f:input path="year" placeholder="Year" class="form-control" autofocus="true" required="true"/>                 
                </div>
                <p>Gender</p>
                <div class="gender">
                 <f:select path="gender" autofocus="true" class="form-control" required="true" >
                        <f:options items="${genderList}" />
                 </f:select>
                </div>
                <div class="phone">
                   <p>Phone no</p>
                   <f:input path="phonNo" id="phone" class="form-control" autofocus="true" required="true"/>                 
                </div>
                <br>
                <p class="terms">
                    <label>
                      <input type="checkbox" name="remember_me"  >
                      I accept <a href="">Terms & Conditions</a>
                    </label>
                </p>
                <button class="btn btn-lg btn-primary btn-block">Create Account</button>
             </f:form>
          </div>
        </div>
      </div>
    </div>
   <!--Footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
    <!-- Load jQuery from CDN so can run demo immediately -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="<c:url value="/resources/js/intlTelInput.js"/>"></script>
  <script>
    $("#phone").intlTelInput({
      autoPlaceholder: "on",
      dropdownContainer: "body",
      geoIpLookup: function(callback) {
       $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
          var countryCode = (resp && resp.country) ? resp.country : "";
         callback(countryCode);
         });
       },
       nationalMode: false,
       preferredCountries: ['in'],
      utilsScript: "/resources/js/utils.js"
    });
  </script>	
</body>
</html>