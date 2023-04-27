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
<title>Edit Name</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<form:form action="/names/edit/${oneName.id}" method="put" modelAttribute="oneName">
	<form:hidden path="postby"/>
		<div>
			<form:label path="name" class="form-label">Name:</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name" class="form-control"/>
		</div>
		<div>
			<form:label path="gender" class="form-label">Gender:</form:label>
			<form:select path="gender" class="form-control">
			<form:option value="Male"></form:option>
			<form:option value="Female"></form:option>
			<form:option value="Neutral"></form:option>
			</form:select>
		</div>
		<div>
			<form:label path="origin" class="form-label">Origin:</form:label>
			<form:errors path="origin" class="text-danger"/>
			<form:input path="origin" class="form-control"/>
		</div>
		<div>
			<form:label path="meaning" class="form-label">Meaning:</form:label>
			<form:errors path="meaning" class="text-danger"/>
			<form:input path="meaning" class="form-control"/>
		</div>
		<input type="submit" value="Add Name" class="btn btn-success">
	</form:form>
	
	<form action="/names/${oneName.id}" method="post">
	<input type="hidden" name="_method" value="delete"/>
	<input type="Submit" value="Delete" class="btn btn-danger">
	
	<a href="/home">Cancel</a>
	</form>
	</div>
</body>
</html>