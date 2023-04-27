<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login and Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="d-flex justify-content-center">
		<h1>Joy Bundler Names</h1>
	</div>
	<div class="container">
		<form:form action="/join" method="post" modelAttribute="newUser">
		<div>
			<form:label path="name" class="form-label">Name:</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name" class="form-control"/>
		</div>
		<div>
			<form:label path="email" class="form-label">Email:</form:label>
			<form:errors path="email" class="text-danger"/>
			<form:input path="email" class="form-control"/>
		</div>
		<div>
			<form:label path="password" class="form-label">Password:</form:label>
			<form:errors path="password" class="text-danger"/>
			<form:input path="password" type="password" class="form-control"/>
		</div>
		<div>
			<form:label path="confirm" class="form-label">Confirm Password:</form:label>
			<form:errors path="confirm" class="text-danger"/>
			<form:input path="confirm" type="password" class="form-control"/>
		</div>
		<input type="submit" value="Join" class="btn btn-success">
	</form:form>
	
	<h1>Login</h1>
	<form:form action="/login" method="post" modelAttribute="login">
		<div>
			<form:label path="email" class="form-label">Email:</form:label>
			<form:errors path="email" class="text-danger"/>
			<form:input path="email" class="form-control"/>
		</div>
		<div>
			<form:label path="password" class="form-label">Password:</form:label>
			<form:errors path="password" class="text-danger"/>
			<form:input path="password" type="password" class="form-control"/>
		</div>
		<input type="submit" value="Login" class="btn btn-info">
	</form:form>
	</div>
</body>
</html>