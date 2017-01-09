<%@ page language="java" import="java.util.*" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page session="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
<title>500 系统异常-webside 专业、用心、开源免费</title>
<style>
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
			500错误 <span>:(</span>
		</h1>
		<p>抱歉,系统出错了</p>
		<ul>
			<li><a class="hvr-overline-from-center"
				href="<%=basePath%>index.html">请刷新再试试</a></li>
			<li><a class="hvr-underline-from-center"
				href="mailto:wjggwm@126.com?subject=webside%e7%b3%bb%e7%bb%9f%e5%bc%82%e5%b8%b8&body=%e6%82%a8%e5%a5%bd%2cwebside%e7%b3%bb%e7%bb%9f%e5%8f%91%e9%80%81%e6%9c%aa%e7%9f%a5%e9%94%99%e8%af%af%2c%e8%af%b7%e5%b0%bd%e5%bf%ab%e5%a4%84%e7%90%86.">或联系管理员</a></li>
		</ul>
	</div>
</body>
</html>
