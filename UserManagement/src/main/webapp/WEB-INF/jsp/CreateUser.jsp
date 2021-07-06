<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.ucelebi.enums.RoleEnum" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create User</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<div class="container">

		<form:form modelAttribute="User" id="form1">
		  <div class="form-group">
		    <label>Username</label>
		    <form:input path="userName" type="text" class="form-control" placeholder="Enter username" required="required"/>
		    <form:errors path="userName"/>
		  </div>
		  
		  <div class="form-group">
		    <label>Password</label>
		    <form:input path="Password" type="password" class="form-control" placeholder="Enter password" required="required"/>
		    <form:errors path="Password"/>
		  </div>
		  
		  <div class="form-group">
		    <label>Name</label>
		    <form:input path="Name" type="text" class="form-control" placeholder="Enter Name" required="required"/>
		    <form:errors path="Name"/>
		  </div>
		  
		  <div class="form-group">
		    <label>Surname</label>
		    <form:input path="Surname" type="text" class="form-control" placeholder="Enter Surname" required="required"/>
		  </div>
		  
		  <div class="form-group">
		    <label >Email</label>
		    <form:input path="Email" type="email" class="form-control" placeholder="Enter Email" required="required"/>
		  </div>
		  
		  <div class="form-group">
		    <label >Phone</label>
		    <form:input path="Phone" pattern="[0-9\\s]{11}" type="text" class="form-control" placeholder="05xxxxxxxxx" required="required"/>
		  </div>
		  
		  <div class="form-group">
		    <label >BirthDay</label>
		    <form:input path="BirthDay" type="date" class="form-control" placeholder="Enter birthday" required="required"/>
		  </div>
		  
		  <div class="form-group">
		    <label >Address</label>
		    <form:input path="Address" type="text" class="form-control" placeholder="Enter Address" required="required"/>
		  </div>
		  
		  <sec:authorize access="hasRole('ADMIN')">
		  <div class="form-group">
		    <label >Role</label>
		    <form:select path="Role" class="form-control">
		    	<form:option value="${RoleEnum.ROLE_ADMIN}">${RoleEnum.ROLE_ADMIN}</form:option>
		    	<form:option value="${RoleEnum.ROLE_USER}">${RoleEnum.ROLE_USER}</form:option>
		    </form:select>
		  </div>
		  </sec:authorize>
		  <button id="create" type="submit" class="btn btn-primary">Submit</button>
		</form:form>

	</div>
	
	
<script type="text/javascript" src="js/main.js"></script>



</body>
</html>