<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<c:if test="${WSGraph != null}">
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization
					.arrayToDataTable([
							[ "webServiceUrl", "Miliseconds", {
								role : 'style'
							} ],
							<c:forEach var="dataIntValue" items="${WSGraph}">[
									'Project :<c:out value="${dataIntValue.webServiceUrl}"/>',
									<c:out value="${dataIntValue.responseTime}"/>,
									'blue'], </c:forEach> ]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "WebService Performance:",
				width : 1100,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("columnchart_values"));
			chart.draw(view, options);
		}
	</script>
</c:if>
</head>
<body class="container">
	
 <nav class="navbar navbar-inverse"> 
	<div class="container-fluid">
	
	<div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="WebService.jsp" style="color:white;">CS594 - System Engineering</a>
    </div>
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li ><a href="WebService.jsp">Create</a></li>
      <li><a href="WebServiceOpen">Open</a></li>
      <li><a href="ShowWebService">Show</a></li>
      <li class="active"><a href="ShowWSGraph">Response Time Graph <span class="sr-only">(current)</span></a></li>
      
      </ul>
      </div>
	
	</div>
	</nav> 
	
	<!-- MAIN  -->
<!-- 	<a href="../ws/WebService.jsp">Back</a> -->
	<form action="ShowWSGraph" method="post">
		<table class="table">
			<tr>
				<td><label>Project</label>
				<input type="text" name="NoOfProjects" />
				<input type="submit" value="Show Graph" /></td>
			</tr>
			
		</table>


	</form>
	<c:if test="${WSGraph != null }">
	<div class="panel panel-default">
						<div class="panel-heading">Graph</div>
		<div id="columnchart_values" style="width: 100%;"></div>
		</div>
	</c:if>
</body>
</html>