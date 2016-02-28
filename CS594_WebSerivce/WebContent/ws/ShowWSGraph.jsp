<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				width : 900,
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
<body>
	<a href="../ws/WebService.jsp">Back</a>
	<form action="ShowWSGraph" method="post">
		<table border="1px solid #000">
			<tr>
				<td><label>Project</label></td>
				<td><input type="text" name="NoOfProjects" /></td>
			</tr>
			<tr>

				<td colspan="2"><input type="submit" value="Show Graph" /></td>
			</tr>
		</table>


	</form>
	<c:if test="${WSGraph != null }">
		<div id="columnchart_values" style="width: 1000px; height: 300px;"></div>
	</c:if>
</body>
</html>