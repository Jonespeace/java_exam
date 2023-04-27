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
<title>Name DashBoard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h3>Welcome, <c:out value="${name}"/></h3>
		<a href="/names/new">Add New Name</a>
		
		<a href="/logout">Logout</a>
		<h2>Baby Names</h2>
		<table class="table table-sm table-dark w-50 p-3">
			<thead>
				<tr>
					<th>Name</th>
					<th>Gender</th>
					<th>Origin</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachName" items="${babyNameList}">
				<tr>
					<td><a href="/names/${eachName.id}">
					<c:out value="${eachName.name}"/></a></td>
					<td><c:out value="${eachName.gender}"/></td>
					<td><c:out value="${eachName.origin}"/></td>
				</tr>
				</c:forEach>
			</tbody>
	
		</table>
	</div>
</body>
</html>