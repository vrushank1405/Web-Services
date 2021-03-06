<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS594</title>
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

</head>
<body>
<a href="http://localhost:8080/CS594_WebSerivce/ws/WebService.jsp" >CS594 Web Service</a>
<!-- <h1>CSS3 Graph Animation<small>Tutorial by Alessio Atzeni | <a href="http://www.alessioatzeni.com/blog/css3-graph-animation/">View Tutorial</a></small></h1>
<div class="container">
	<a class="trigger" href="#">Start/Restart Animation</a>
	<div class="content">
        
        
        <div id="layerBall" class="ball">
        	<a href="#"><small>100 Visit</small></a>
        </div>
        <div id="layerPulse" class="pulse"></div>
    	<div class="line"></div>
        
        <div id="layerBall1" class="ball1">
        	<a href="#"><small>300 Visits</small></a>
        </div>
        <div id="layerPulse1" class="pulse1"></div>
        <div class="line1"></div>
        
        <div id="layerBall2" class="ball2">
        	<a href="#"><small>10 Visits</small></a>
        </div>
        <div id="layerPulse2" class="pulse2"></div>
        <div class="line2"></div>
        
        <div id="layerBall3" class="ball3">
        	<a href="#"><small>4251 Visits</small></a>
        </div>
        <div id="layerPulse3" class="pulse3"></div>
        <div class="line3"></div>
        
        <div id="layerBall4" class="ball4">
        	<a href="#"><small>1752 Visits</small></a>
        </div>
        <div id="layerPulse4" class="pulse4"></div>
    
    </div>
</div>
 -->
</body>
</html>