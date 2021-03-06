<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
body {
	background: #161616 url(pattern_40.gif) top left repeat;
	margin: 0;
	padding: 0;
	font: 12px normal Verdana, Arial, Helvetica, sans-serif;
	height: 100%;
	color:#fff;
}

* {margin: 0; padding: 0; outline: none;}

img {border: none;}

a { 
	text-decoration:none; 
	color:#00c6ff;
}

h1 {
	font: 4em normal Arial, Helvetica, sans-serif;
	padding: 20px;	margin: 0;
	text-align:center;
	color:#bbb;
}

h1 small{
	font: 0.2em normal  Arial, Helvetica, sans-serif;
	text-transform:uppercase; letter-spacing: 0.2em; line-height: 5em;
	display: block;
}

h2 {
	font: 2em normal Arial, Helvetica, sans-serif;
	padding-bottom:30px;
	color:#fff;
	display:block;
}

.container {
	width: 960px;
	margin: 0 auto; 
	overflow: hidden;
}

.content {
	width:960px;
	height:300px;
	margin:0 30px;
	padding-top:450px;
	position:relative;
}

/* GRAPH */

.line, .line1, .line2, .line3 {
	background:#2187e7; 
	width:0px;
	height:1px;
}

.running .line {
	-moz-transform:rotate(-10deg);
	-moz-transform-origin: 0 -2em;
	-moz-animation:move 1s linear forwards;
	
	-webkit-transform:rotate(-10deg);
	-webkit-transform-origin: 0 -2em;
	-webkit-animation:move 1s linear forwards;
}

.running .line1 {
	-moz-transform:rotate(30deg);
	-moz-transform-origin: 14em 30em;
	-moz-animation:move1 1s 1s linear forwards;
	
	-webkit-transform:rotate(30deg);
	-webkit-transform-origin: 14em 30em;
	-webkit-animation:move1 1s 1s linear forwards;
}
.running .line2 {
	-moz-transform:rotate(-65deg);
	-moz-transform-origin: 20em -22em;
	-moz-animation:move2 1s 2s linear forwards;
	
	-webkit-transform:rotate(-65deg);
	-webkit-transform-origin: 20em -22em;
	-webkit-animation:move2 1s 2s linear forwards;
}
.running .line3 {
	-moz-transform:rotate(48deg);
	-moz-transform-origin: 51em 39em;
	-moz-animation:move3 1s 3s linear forwards;
	
	-webkit-transform:rotate(48deg);
	-webkit-transform-origin: 51em 39em;
	-webkit-animation:move3 1s 3s linear forwards;
}

.running .ball,.running  .ball1,.running  .ball2,.running  .ball3,.running  .ball4 {
	background-color:#2187e7; 
	background-image: -moz-linear-gradient(90deg, #2187e7 25%, #a0eaff); 
	background-image: -webkit-linear-gradient(90deg, #2187e7 25%, #a0eaff); 

	width:10px;
	height:10px;
	border-radius:50px;
	
	position:absolute;
	z-index:99;
	
	-moz-transform:scale(0);
	-moz-animation:point 0.1s linear forwards;
	
	-webkit-transform:scale(0);
	-webkit-animation:point 0.1s linear forwards;
}

.running .pulse,.running .pulse1,.running  .pulse2,.running  .pulse3,.running  .pulse4 {
	width:12px;
	height:12px;
	border-radius:30px;
	border: 1px solid #00c6ff;
	box-shadow: 0 0 5px #00c6ff;
	position:absolute;
	
	-moz-transform:scale(0);
	-moz-animation:pulse 1s ease-out;
	
	-webkit-transform:scale(0);
	-webkit-animation:pulse 1s ease-out;
}

/* TOOLTIP */

.ball a, .ball1 a, .ball2 a, .ball3 a, .ball4 a {
	float:left;
	height:10px;
	width:10px;
	text-decoration:none;
	position:relative;
}

.ball a small, .ball1 a small, .ball2 a small, .ball3 a small, .ball4 a small { 
	background:#000; 
	text-align:center; 
	width:70px; 
	padding:5px; 
	border-left:1px solid #111; border-top:1px solid #111; border-right:1px solid #333; border-bottom:1px solid #333; 
	border-radius:3px; 
	display:none; 
	color:#fff; 
	font-size:0.8em; 
	text-indent:0;
}

.ball a:hover small, .ball1 a:hover small, .ball2 a:hover small, .ball3 a:hover small, .ball4 a:hover small { 
	display:block; 
	position:absolute; 
	top:0px; 
	left:50%; 
	margin:-40px; 
	z-index:9999; 
	
	-moz-animation:tooltip .25s linear;  
	
	-webkit-animation:tooltip .25s linear; 
} 

/* COORDINATE POINTS */
.ball  { top:445px; left:0; }
.ball1 { top:411px; left:196px; }
.ball2 { top:511px; left:372px; }
.ball3 { top:151px; left:544px; }
.ball4 { top:371px; left:744px; }

.pulse  { top:443px; left:-2px; }
.pulse1 { top:409px; left:194px; }
.pulse2 { top:509px; left:370px; }
.pulse3 { top:149px; left:542px; }
.pulse4 { top:369px; left:742px; }

/* CONTROL LAYER DELAY */

#layerBall, #layerPulse   { -moz-animation-delay:0s; -webkit-animation-delay:0s; }
#layerBall1, #layerPulse1 { -moz-animation-delay:0.9s; -webkit-animation-delay:0.9s; }
#layerBall2, #layerPulse2 { -moz-animation-delay:1.9s; -webkit-animation-delay:1.9s; }
#layerBall3, #layerPulse3 { -moz-animation-delay:2.9s; -webkit-animation-delay:2.9s; }
#layerBall4, #layerPulse4 { -moz-animation-delay:4s; -webkit-animation-delay:4s; }

/* ANIMATION */

@-moz-keyframes move {
	0%   { width:0px;}
	100% { width:200px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5); }
}
@-moz-keyframes move1 {
	0%   { width:0px;}
	100% { width:200px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5);}
}
@-moz-keyframes move2 {
	0%   { width:0px;}
	100% { width:400px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5);}
}
@-moz-keyframes move3 {
	0%   { width:0px;}
	100% { width:300px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5);}
}

@-moz-keyframes point {
	0%  {-moz-transform:scale(0,0);}
	100%{-moz-transform:scale(1,1);}	
}

@-moz-keyframes pulse {
	0%   {-moz-transform: scale(0);opacity: 0;}
    10%  {-moz-transform: scale(1);opacity: 0.5;}
	50%  {-moz-transform: scale(1.75);opacity: 0;}
    100% {-moz-transform: scale(0);opacity: 0;}  
} 

@-moz-keyframes tooltip {
	0%  { -moz-transform:scale(0,0); opacity:0;}
	50% { -moz-transform:scale(1.2,1.2); opacity:0.3; }
	75% { -moz-transform:scale(0.9,0.9); opacity:0.7;}
	100%{ -moz-transform:scale(1,1); opacity:1;}
}

@-webkit-keyframes move {
	0%   { width:0px;}
	100% { width:200px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5); }
}
@-webkit-keyframes move1 {
	0%   { width:0px;}
	100% { width:200px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5); }
}
@-webkit-keyframes move2 {
	0%   { width:0px;}
	100% { width:400px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5); }
}
@-webkit-keyframes move3 {
	0%   { width:0px;}
	100% { width:300px; box-shadow:0px 0px 5px 1px rgba(0,198,255,0.5); }
}

@-webkit-keyframes point {
	0%  {-webkit-transform:scale(0,0);}
	100%{-webkit-transform:scale(1,1);}	
}

@-webkit-keyframes pulse {
	0%   {-webkit-transform: scale(0);opacity: 0;}
    10%  {-webkit-transform: scale(1);opacity: 0.5;}
	50%  {-webkit-transform: scale(1.75);opacity: 0;}
    100% {-webkit-transform: scale(0);opacity: 0;}  
} 

@-webkit-keyframes tooltip {
	0%  { -webkit-transform:scale(0,0); opacity:0;}
	50% { -webkit-transform:scale(1.2,1.2); opacity:0.3; }
	75% { -webkit-transform:scale(0.9,0.9); opacity:0.7;}
	100%{ -webkit-transform:scale(1,1); opacity:1;}
}

/* Trigger button for javascript */

.trigger {
	background: #000000;
	background: -moz-linear-gradient(top, #161616 0%, #000000 100%);
	background: -webkit-linear-gradient(top, #161616 0%,#000000 100%);
	border-left:1px solid #111; border-top:1px solid #111; border-right:1px solid #333; border-bottom:1px solid #333; 
	font-family: Verdana, Geneva, sans-serif;
	font-size: 0.8em;
	text-decoration: none;
	text-transform: lowercase;
	text-align: center;
	color: #fff;
	padding: 10px;
	border-radius: 3px;
	display: block;
	margin: 0 auto;
	width: 140px;
}
		
.trigger:hover {
	background: -moz-linear-gradient(top, #202020 0%, #161616 100%);
	background: -webkit-linear-gradient(top, #202020 0%, #161616 100%);
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js" type="text/javascript"></script>
<script>		
$(document).ready(function() {
	$('.content').removeClass('running');	    
		$('.trigger').click(function() {
			$('.content').removeClass('running').delay(10).queue(function(next){
				$(this).addClass('running');
		        next();
		    });
		    return false;
		});
});
</script>
<link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/html-css/CSS3-Graph-Animation/index.html" />

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
									'#5bc0de'], </c:forEach> ]);

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
      <li><a href="ShowWebService">Project Management</a></li>
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
				<td><label>Number of Projects</label>
				<input  type="text" name="NoOfProjects" />
				<input class="btn btn-info" type="submit" value="Show Graph" /></td>
			</tr>
		</table>
	</form>
	<c:if test="${WSGraph != null }">
	<div class="panel panel-info">
						<div class="panel-heading">Graph</div>
		<div id="columnchart_values" style="width: 100%;"></div>
		</div>
		
	</c:if>
	</body>
</html>