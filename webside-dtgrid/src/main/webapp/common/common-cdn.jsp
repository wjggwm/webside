<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>webside	用心、专业、开源免费</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
<meta name="keywords" content="webside,响应式前端解决方案,RBAC权限管理,一站式架构设计,java web" />
<meta name="description" content="webside,响应式前端解决方案,RBAC权限管理,一站式架构设计,java web" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link href="${ctx }/resources/images/webside.ico" rel="icon"/>
<link href="${ctx }/resources/images/webside.ico" type="image/x-icon" rel="bookmark"/>   
<link href="${ctx }/resources/images/webside.ico" type="image/x-icon" rel="shortcut icon"/>  

<link rel="stylesheet" href="${ctx}/resources/js/bootstrap/bootstrap.min.css"/>
<link href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="${ctx}/resources/fonts/opensans/ace-fonts.min.css"/>
<link rel="stylesheet" href="${ctx}/resources/css/ace/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
<link rel="stylesheet" href="${ctx}/resources/css/customer/webside.min.css"/>
<!--[if lte IE 9]>
	<link rel="stylesheet" href="${ctx}/resources/css/ace/ace-part2.min.css" />
	<link rel="stylesheet" href="${ctx}/resources/css/ace/ace-ie.min.css" />
<![endif]-->
<!-- JQuery script -->

<!-- 非IE浏览器不会识别IE的条件注释，所以这里判断非IE需要如下写法：参照下面jquery-2.1.4.min.js引入的方式 -->
<!--[if !IE]><!-->
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<!--<![endif]-->
<!--[if IE]>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<![endif]-->
<!-- basic scripts -->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)document.write("<script src='//cdn.bootcss.com/jquery-mobile/1.4.5/jquery.mobile.min.js'>" + "<"+"script>");
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
	<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!--[if lt IE 8]>
    <script src="//cdn.bootcss.com/json2/20160511/json2.min.js"></script>
<![endif]-->
<!--[if lte IE 8]>
	<script type="text/javascript" src="${ctx}/resources/js/ie/excanvas.min.js"></script>
<![endif]-->

<script src="//cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="//cdn.bootcss.com/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

<script src="//cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
<!-- 表格 -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/js/dlshouwen.grid.v1.2.1/dlshouwen.grid.min.css" />
<script type="text/javascript" src="${ctx}/resources/js/dlshouwen.grid.v1.2.1/dlshouwen.grid.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/dlshouwen.grid.v1.2.1/i18n/zh-cn.js"></script>
<!-- 校验 -->
<script src="//cdn.bootcss.com/jquery-validate/1.15.1/jquery.validate.min.js"></script>
<script src="//cdn.bootcss.com/jquery-validate/1.15.1/localization/messages_zh.min.js"></script>
<!-- 滚动条 -->
<script src="//cdn.bootcss.com/jquery.nicescroll/3.6.0/jquery.nicescroll.min.js"></script>

<script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="//cdn.bootcss.com/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/bootstrap-switch/3.3.2/js/bootstrap-switch.min.js"></script>
<!-- javascript tools -->
<script src="//cdn.bootcss.com/underscore.js/1.8.3/underscore-min.js"></script>
<script src="//cdn.bootcss.com/purl/2.3.1/purl.min.js"></script>
<!-- 元素动画 -->
<script src="//cdn.bootcss.com/scrollReveal.js/3.3.2/scrollreveal.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/customer/index/index.min.js"></script>
<script type="text/javascript" type="text/javascript">
var sys = sys || {};
sys.rootPath = "${ctx}";
sys.pageNum = 10;
sys.gridStyle = "Bootstrap";
window.scrollreveal = ScrollReveal();
</script> 