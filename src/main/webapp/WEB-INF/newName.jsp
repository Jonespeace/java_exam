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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Name</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<h1>Add a New Name</h1>
	<form:form action="/names/new" method="post" modelAttribute="newName">
	<form:hidden path="postby" value="${userId }"/>
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
	<a href="/home">Cancel</a>
	</div>
</body>
</html>