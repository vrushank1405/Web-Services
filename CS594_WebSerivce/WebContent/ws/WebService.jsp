<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>CS594</title>
</head>
<body>
	<form action="WebService?id=0" method="post">
		<table border='1px solid #000' align='center'>
			<tr>
				<td colspan='2' align='center'>Web Service</td>
			</tr>
			<tr>
				<td>Web Service</td>
				<c:choose>
					<c:when test="${WebServiceURL != null }">
						<td><input type="text" name="webServiceUrl"
							value="${WebServiceURL}" />
					</c:when>
					<c:otherwise>
						<td><input type="text" name="webServiceUrl" />
					</c:otherwise>
				</c:choose>


			</tr>


			<tr>
				<td><input type='submit' value='Go'></input></td>
				<!-- <td><input type='reset' name='Reset'></input></td> -->
			</tr>

		</table>

	</form>

	<c:if test="${WSMethod != null}">
		<form action="WebService?id=1" method="post">
			<table border='1px solid #000' align='center'>
				<tr>
					<td>Method</td>
					<td><select name="MethodName">
							<c:forEach items="${WSMethod}" var="entry">
								<c:choose>
									<c:when test="${entry.methodId == MethodId}">
										<option value="${entry.methodId}" selected="selected">${entry.methodName}</option>
									</c:when>
									<c:otherwise>
										<option value="${entry.methodId}">${entry.methodName}</option>
									</c:otherwise>
								</c:choose>

							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input type='submit' value='Get Parameter'></input></td>
					<!-- <td><input type='reset' name='Reset'></input></td> -->
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${ WSParameter != null}">
		<c:if test="${parameterShow != 0 }">
			<form action="WebService?id=2" method="post">
				<table border='1px solid #000' align='center'>
					<c:forEach items="${WSParameter}" var="entry">
						<c:if test="${entry.methodId == MethodId}">
							<tr>
								<td>${entry.parameterName}</td>
								<td><input type="text" name="${entry.parameterName}" /></td>

							</tr>
						</c:if>
					</c:forEach>
					<tr>
						<td>User</td>
						<td><input type='text' name="User"></input></td>

					</tr>
					<tr>
						<td><input type='submit' value='Submit'></input></td>
						<!-- <td><input type='reset' name='Reset'></input></td> -->
					</tr>
				</table>
			</form>
		</c:if>
	</c:if>
	<a href="ShowWSGraph">Response Time Graph</a>
</body>
</html>