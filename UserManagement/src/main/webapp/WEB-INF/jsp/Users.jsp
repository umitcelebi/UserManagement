<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.ucelebi.enums.RoleEnum" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<header>

<jsp:include page="navbar.jsp"></jsp:include>
</header>
<sec:authorize access="isAuthenticated()">
<div class="container">
	<a class="btn btn-success btn-sm" href="/user/signUp">Create User</a>
	
	<hr>
	
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>Name</th>
				<th>Surname</th>
				<th>Email</th>
				<th>Phone</th>
				<th>BirthDay</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${users}" var="user">
		<tr>
	        <td><c:out value="${user.id}"/></td>
	        <td><c:out value="${user.name}"/></td>
	        <td><c:out value="${user.surname}"/></td>
	        <td><c:out value="${user.email}"/></td>
	        <td><c:out value="${user.phone}"/></td>
	        <td><fmt:formatDate value="${user.birthDay}" pattern="yyyy-MM-dd" /></td>
	        <sec:authorize access="hasRole('ADMIN')">
	        <td><a onclick="deleteUser(event)" href="/user/admin/delete?id= <c:out value='${user.id}'/> " class="btn btn-info btn-sm" href="#">Delete</a></td>
	        <td><a class="btn btn-primary btn-sm" href="/user/admin/edit?id= <c:out value='${user.id}'/> ">Edit</a></td>
	        </sec:authorize>
      	</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</sec:authorize>

<script type="text/javascript" src="js/main.js"></script>



</body>
</html>