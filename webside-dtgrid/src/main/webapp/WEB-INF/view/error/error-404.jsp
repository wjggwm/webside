<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
    <title>404 页面没找到-webside 专业、用心、开源免费</title>
    </head>
    <body>
    	<script type="text/javascript" src="http://www.qq.com/404/search_children.js" charset="utf-8" homePageUrl="<%=basePath %>index.html" homePageName="返回"></script>
    </body>
</html>
