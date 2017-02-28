<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ include file="../templates/head-meta.jsp"%>


</head>
<script type="text/javascript">

         var app = angular.module("myApp",[]);
         app.controller("myCtrl",function($scope){
        	 
        	 $scope.Email= '';
        	 $scope.EmailError = false;
        	 
        	 $scope.ValidateEmail = function()
        	 {
        		 var reg = /\S+@\S+\.\S+/;
        		 $scope.EmailError = !reg.test($scope.Email);
        	 }
        
        	 $scope.Password= '';
        	 $scope.PasswordError = false;
        	 
        	 $scope.ValidatePassword = function()
        	 {
        		 var reg = /^.{6,15}$/;
        		 $scope.PasswordError = !reg.test($scope.Password);
        	 }
        	 
        	 $scope.Phone= '';
        	 $scope.PhoneError = false;
        	 
        	 $scope.ValidatePhone = function()
        	 {
        	  var reg = /^[7-9][0-9]{9}$/;
        		 $scope.PhoneError = !reg.test($scope.Phone);
        	 }
        	 $scope.City= '';
        	 $scope.CityError = false;
        	 
        	 $scope.ValidateCity = function()
        	 {
        	  var reg = /^$/;
        		 $scope.CityError = reg.test($scope.City);
        	 }
        	 
        	 $scope.Username= '';
        	 $scope.UsernameError = false;
        	 
        	 $scope.ValidateUsername = function()
        	 {
        	  var reg = /^$/;
        		 $scope.UsernameError = reg.test($scope.Username);
        	 }
         } );
</script>
<style>

hr {
    height: 20px;
    color: #123455;
    background-color: #123455;
     border: none;
}



</style>
<myhead style="position:absolute;left:0;top:0;width: 100%;color: #123455;text-align: center;font-size: 50px;font-style:bold;font-family:forte;">GoSSIp GIRl<com style="top:1650px;
    width:1%;text-align: center;font-size: 20px;font-style:italic;font-family:forte;"></com>
    <slogan style=" position:absolute;left:7%;right:7%;top:75%;width: 70%;text-align: center;font-size: 15px;font-style:bold;font-family:monotype corsiva;">-XOXO</slogan></myhead>

<body style="background-color:#FFE4E1" ; ng-app="myApp" ng-controller="myCtrl" >
<br><br><br>
<hr>
	<div class="container">
		<h2 style="color:#123455;font-family: forte;">Login</h2>

		<div class="col-md-12" align="right">
		<a href="aboutus" title="About Us"><i
					class="fa fa-info-circle fa-2x" aria-hidden="true"></i></a>
		</div>
	
		
		<div class="col-md-12">
			<div class="col-md-6">

				<c:if test="${param.error != null}">
					<p class="alert alert-danger">
						<span><b>TRY AGAIN!</b> Invalid Email or password.</span>
					</p>
				</c:if>
				<c:if test="${param.logout != null}">
					<p class="alert alert-success">
						<span>You have been logged out successfully.</span>
					</p>
				</c:if>

			</div>
			<div class="col-md-6" >
			</div>
		</div>


	


		<form action="login" method="post">
			<div class="col-md-6">
				<div class="col-md-6" style="margin-bottom: 20px">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa-lg"
							aria-hidden="true"></i></span> <input id="username" type="text"
							class="form-control" name="username" placeholder="Enter email">
					</div>

				</div>
				<div class="col-md-6" style="margin-bottom: 20px">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg"
							aria-hidden="true"></i></span> <input id="password" type="password"
							class="form-control" name="password" placeholder="Enter password">
					</div>

				</div>
			</div>
			<div class="col-md-6" style="margin-bottom: 20px">
				<div class="col-md-12">
					<input type="submit" value="Log In" class="btn btn-danger" />
				</div>

			</div>
		</form>
	</div>



	<div class="container">
		<h2  style="color:#123455;font-family:forte;">Sign Up</h2>
		<br>
		<div class="col-md-6">

			<div>
				<c:if test="${not empty passwordmismatch}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Password Does't Match
					</p>
				</c:if>

				<c:if test="${not empty useralreadyexists}">
					<p class="alert alert-danger">
						<b>OOPS!</b>&nbsp Username Already Exists
					</p>
				</c:if>

				<c:if test="${not empty success}">
					<p class="alert alert-success">
						<b>GREAT</b>&nbsp Account Created Successfully
					</p>
				</c:if>
			</div>

			<form:form action="adduser" method="post" modelAttribute="user">

				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="text" path="username" class="form-control" ng-model="Username" ng-change="ValidateUsername()"
						placeholder="Enter your name" />
				</div>
				<span class="text text-danger"><span ng-show="UsernameError">This field cannnot be empty</span><form:errors path="username" /></span>



				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-envelope "
						aria-hidden="true"></i></span>
					<form:input type="email" class="form-control" path="email" ng-model="Email" ng-change="ValidateEmail()"
						placeholder="Enter your email Id" />
				</div>
				<span class="text text-danger"><span ng-show="EmailError">Invalid Email Format</span><form:errors path="email" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="password" class="form-control" ng-model="Password" ng-change="ValidatePassword()"
						placeholder="Enter your password" />
				</div>
				<span class="text text-danger"><span ng-show="PasswordError">Password should be between 8 to 20 characters</span><form:errors path="email" /><form:errors path="password" /></span>


				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-lock fa-lg"
						aria-hidden="true"></i></span>
					<form:input type="password" path="cpassword" class="form-control"
						placeholder="re-enter your password" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i
						class="fa fa-map-marker fa-lg" aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="city" ng-model="City" ng-change="ValidateCity()"
						placeholder="Enter your city" />
				</div>
				<span class="text text-danger"><span ng-show="CityError">This field cannnot be empty</span><form:errors path="city" /></span>
				

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-calendar "
						aria-hidden="true"></i></span>
					<form:input type="date" class="form-control" path="dob"
						placeholder="Enter your Date Of Birth" />
				</div>

				<div class="input-group" style="margin-top: 20px">
					<span class="input-group-addon"><i class="fa fa-phone "
						aria-hidden="true"></i></span>
					<form:input type="text" class="form-control" path="phone" ng-model="Phone" ng-change="ValidatePhone()"
						placeholder="Enter the mobile number" />
				</div>
				<span class="text text-danger"><span ng-show="PhoneError">Phone number is not valid. Should be length 10</span><form:errors path="phone" /></span>

				<div class="input-group" style="margin-top: 20px">
					<label class="radio-inline"> <form:radiobutton
							path="gender" value="Male" />Male

					</label> <label class="radio-inline"> <form:radiobutton
							path="gender" value="Female" />Female
					</label>
				</div>

				<div style="margin-top: 20px">
					<input type="submit" value="Sign Up"
						class="btn btn-danger btn-block" />
				</div>

			</form:form>
		</div>

		<div class="col-md-6">
			<img src="${pageContext.request.contextPath}/resources/images/5.jpg" class="img-circle"
				alt="image" />
		</div>

	</div>

	<%@ include file="../templates/footer.jsp"%>
</body>
</html>
