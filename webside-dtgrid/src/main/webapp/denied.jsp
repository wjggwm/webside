<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>没权限	webside 专业、用心、开源免费</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
		<style type="text/css">
html {
	padding: 30px 10px;
	font-size: 20px;
	line-height: 1.4;
	color: #737373;
	background: #f0f0f0;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

body {
	max-width: 500px;
	_width: 500px;
	padding: 30px 20px 50px;
	border: 1px solid #b3b3b3;
	border-radius: 4px;
	margin: 0 auto;
	box-shadow: 0 1px 10px #a7a7a7, inset 0 1px 0 #fff;
	background: #fcfcfc;
}

h1 {
	margin: 0 10px;
	font-size: 50px;
	text-align: center;
}

h1 span {
	color: #bbb;
}

p {
	margin: 1em 0;
}

ul {
	padding: 0 0 0 40px;
	margin: 1em 0;
}

a {
	color: #2098D1;
}

a:visited {
	color: #0A0113;
}

a:hover {
	color: #2098D1;
}

a:focus {
	outline: thin dotted;
}

a:hover, a:active {
	outline: 0;
}

a, a:visited, a:active {
	text-decoration: none;
	color: #2098D1;
	-webkit-transition: all .3s ease-in-out;
}

a:hover, .glow {
	color: #2098D1;
	text-shadow: 0 0 10px #ff0;
}

.container {
	max-width: 380px;
	_width: 380px;
	margin: 0 auto;
}
/* Underline From Center */
.hvr-underline-from-center {
	display: inline-block;
	vertical-align: middle;
	-webkit-transform: perspective(1px) translateZ(0);
	transform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px transparent;
	position: relative;
	overflow: hidden;
}

.hvr-underline-from-center:before {
	content: "";
	position: absolute;
	z-index: -1;
	left: 50%;
	right: 50%;
	bottom: 0;
	background: #2098D1;
	height: 4px;
	-webkit-transition-property: left, right;
	transition-property: left, right;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
}

.hvr-underline-from-center:hover:before, .hvr-underline-from-center:focus:before,
	.hvr-underline-from-center:active:before {
	left: 0;
	right: 0;
}
/* Overline From Center */
.hvr-overline-from-center {
	display: inline-block;
	vertical-align: middle;
	-webkit-transform: perspective(1px) translateZ(0);
	transform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px transparent;
	position: relative;
	overflow: hidden;
}

.hvr-overline-from-center:before {
	content: "";
	position: absolute;
	z-index: -1;
	left: 50%;
	right: 50%;
	top: 0;
	background: #2098D1;
	height: 4px;
	-webkit-transition-property: left, right;
	transition-property: left, right;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
}

.hvr-overline-from-center:hover:before, .hvr-overline-from-center:focus:before,
	.hvr-overline-from-center:active:before {
	left: 0;
	right: 0;
}
</style>
	</head>
	<body>
		<div class="container">
			<h1>
				没权限 <span>:(</span>
			</h1>
			<p>Sorry,您没权限进行此操作</p>
			<ul>
				<li><a class="hvr-overline-from-center"
					href="<%=basePath%>index.html">返回主页</a></li>
				<li><a id="mailto" class="hvr-underline-from-center"
					href="mailto:wjggwm@126.com?subject=webside%e8%ae%bf%e9%97%ae%e6%9d%83%e9%99%90&body=%e6%82%a8%e5%a5%bd%2c%e8%ae%bf%e9%97%ae%e7%9a%84URI%e6%97%a0%e6%9d%83%e9%99%90%ef%bc%8curi%e5%9c%b0%e5%9d%80%e4%b8%ba%ef%bc%9a">联系管理员</a></li>
			</ul>
		</div>
	</body>
</html>
