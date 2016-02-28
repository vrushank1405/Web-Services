<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<title>CS594</title>
</head>
<body>
	<header class="page-header">
		<h3>CS594 - System Engineering</h3>
	</header>
	<div class="row">

		<div class="col-lg-12">


			<div class="panel panel-primary">
				<div class="panel-heading">Web Service</div>
				<div class="panel-body">

					<section class="col-lg-12">
						<form action="WebServiceOpen?id=0" method="post">
							<div class="col-lg-3">Web Service</div>
							<div class="col-lg-9">
								<select name="WSName" class="form-control">
									<c:forEach items="${WebServiceDD}" var="entry">

										<option value="${entry.webServiceUrl}">${entry.webServiceUrl}</option>


									</c:forEach>
								</select>

							</div>
							<br />
							<div class="col-lg-12">
								<br /> <input class="btn btn-primary  text-center center-block"
									type='submit' value='Show Method'></input>
							</div>

						</form>
					</section>



				</div>
			</div>


			<div class="panel panel-primary">
				<div class="panel-heading">Method</div>
				<div class="panel-body">

					<section class="col-lg-12">
						<div class="col-lg-3">Method</div>
						<div class="col-lg-9">
							<c:if test="${WSMethodOpen != null}">
								<form class="col-lg-12" action="WebServiceOpen?id=1" method="post">
									<select name="MethodName" class="form-control">
										<c:forEach items="${WSMethodOpen}" var="entry">
											<c:choose>
												<c:when test="${entry.methodId == MethodIdOpen}">
													<option value="${entry.methodId}" selected="selected">${entry.methodName}</option>
												</c:when>
												<c:otherwise>
													<option value="${entry.methodId}">${entry.methodName}</option>
												</c:otherwise>
											</c:choose>

										</c:forEach>
									</select>
									<div class="col-lg-12">
										<br> <input class="btn btn-primary col-lg-offset-3"
											type='submit' value='Show Parameter'></input>
									</div>
								</form>
							</c:if>
						</div>
					</section>


				</div>
			</div>



			<div class="panel panel-primary">
				<div class="panel-heading">Parameters</div>
				<div class="panel-body">

					<section class="col-lg-12">
						<br />
						<c:if test="${ WSParameterOpen != null}">
							<c:if test="${parameterShowOpen != 0 }">
								<form action="WebServiceOpen?id=2" method="post">
									<c:forEach items="${WSParameterOpen}" var="entry">
										<c:if test="${entry.methodId == MethodIdOpen}">
											<div class="col-lg-3">${entry.parameterName}</div>
											<div class="col-lg-9">
												<input class="form-control" type="text"
													name="${entry.parameterName}" /><br />
											</div>
										</c:if>
									</c:forEach>
									<div class="col-lg-3">User</div>
									<div class="col-lg-9">
										<input class="form-control" type='text' name="User"></input>
									</div>
									<div class="col-lg-12">
										<br /> <input
											class="btn btn-primary  text-center center-block"
											type='submit' value='Save To Database'></input>
									</div>
								</form>
							</c:if>
						</c:if>
					</section>


				</div>
			</div>

			<a href="ShowWSGraph">Response Time Graph</a>
		</div>
	</div>
</body>
</html>