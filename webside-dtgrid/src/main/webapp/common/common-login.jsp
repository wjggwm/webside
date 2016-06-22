<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
<meta name="keywords" content="webside,响应式前端解决方案,一站式架构设计,基础功能模块" />
<meta name="description" content="webside,响应式前端解决方案,一站式架构设计,基础功能模块" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link href="${ctx }/resources/images/webside.ico" rel="icon" />
<link href="${ctx }/resources/images/webside.ico" type="image/x-icon" rel="bookmark" />
<link href="${ctx }/resources/images/webside.ico" type="image/x-icon" rel="shortcut icon" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${ctx }/resources/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/resources/fonts/fontawesome/font-awesome.min.css"/>
<link rel="stylesheet" href="${ctx}/resources/fonts/opensans/ace-fonts.min.css"/>
<link rel="stylesheet" href="${ctx}/resources/css/ace/ace.min.css"/>
<!--[if lte IE 9]>
	<link rel="stylesheet" href="${ctx }/resources/css/ace/ace-part2.min.css" />
<![endif]-->

<!--[if lte IE 9]>
	<link rel="stylesheet" href="${ctx }/resources/css/ace/ace-ie.min.css" />
<![endif]-->
		
<!-- JQuery script -->
<!--[if !IE]><!-->
<script type="text/javascript" src="${ctx }/resources/js/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->
<!--[if IE]>
	<script type="text/javascript" src="${ctx }/resources/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<!-- basic scripts -->
<script type="text/javascript">
	if ("ontouchend" in document)
		document.write("<script src='${ctx }/resources/js/jquery/jquery.mobile.custom.min.js'>" + "<"+"script>");
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="${ctx }/resources/js/ie/html5shiv.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/js/ie/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" type="text/javascript">
var sys = sys || {};
sys.rootPath = "${ctx}";
sys.pageNum = 10;
sys.gridStyle = "Bootstrap";
</script> 