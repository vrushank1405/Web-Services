<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS594</title>
</head>
<body>
	<table border="1px solid #000">
		<tr>
			<th>Project</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${ShowWebServiceDD}" var="entry">
			<tr>
				<td>${entry.webServiceUrl}</td>
				<td><a href="DeleteWebService?Wid=${entry.id}" >Delete</a>
			</tr>
		</c:forEach>
	</table>
</body>
</html>