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
<title>Name Details Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<h1>Baby Name Details</h1>
	<h4>Posted By: <c:out value="${oneName.postby.name}"/></h4>
	<h4>Name: <c:out value="${oneName.name}"/></h4>
	<h4>Gender: <c:out value="${oneName.gender}"/></h4>
	<h4>Origin: <c:out value="${oneName.origin}"/></h4>
	<h4>Meaning: <c:out value="${oneName.meaning}"/></h4>
	
	<a href="/names/edit/${oneName.id}">Edit</a>
</body>
</html>