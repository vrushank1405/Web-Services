<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS594</title>
</head>
<body class="container">
	<!-- <header class="page-header">
		<h3>CS594 - System Engineering</h3>
	</header> -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="WebService.jsp" style="color: white;">CS594
					- System Engineering </a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="WebService.jsp">Create<span
							class="sr-only">(current)</span></a></li>
					<li><a href="WebServiceOpen">Open</a></li>
					<li><a href="ShowWebService">Show</a></li>
					<li><a href="ShowWSGraph">Response Time Graph</a></li>

				</ul>
			</div>

		</div>
	</nav>

	<!-- MAIN  -->
	<div class="row">

		<div class="col-lg-12">


			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Web Service</b>
				</div>
				<div class="panel-body">

					<section class="col-lg-12">
						<form action="WebService?id=0" method="post">
							<div class="col-lg-3">Web Service</div>
							<div class="col-lg-9">
								<c:choose>
									<c:when test="${WebServiceURL != null }">
										<input class="form-control" type="text" name="webServiceUrl"
											value="${WebServiceURL}" />
									</c:when>
									<c:otherwise>
										<input class="form-control" type="text" name="webServiceUrl" />
									</c:otherwise>
								</c:choose>
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

			<c:if test="${WSMethod != null}">
				<div class="panel panel-default">
					<div class="panel-heading">
						<b>Method</b>
					</div>
					<div class="panel-body">

						<section class="col-lg-12">
							<div class="col-lg-3">Method</div>
							<div class="col-lg-9">

								<form class="col-lg-12" action="WebService?id=1" method="post">
									<select name="MethodName" class="form-control">
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
									</select>
									<div class="col-lg-12">
										<br> <input class="btn btn-primary col-lg-offset-3"
											type='submit' value='Show Parameter'></input>
									</div>
								</form>

							</div>
						</section>


					</div>
				</div>
			</c:if>

			<c:if test="${ WSParameter != null}">
				<c:if test="${parameterShow != 0 }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<b>Parameters</b>
						</div>
						<div class="panel-body">

							<section class="col-lg-12">
								<br />

								<form action="WebService?id=2" method="post">
									<c:forEach items="${WSParameter}" var="entry">
										<c:if test="${entry.methodId == MethodId}">
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

							</section>


						</div>
					</div>
				</c:if>
			</c:if>
			<!-- <a href="ShowWSGraph">Response Time Graph</a><br /> <a
				href="WebServiceOpen">Open</a><br /> <a
				href="ShowWebService">Show</a> -->
		</div>
	</div>
</body>
</html>