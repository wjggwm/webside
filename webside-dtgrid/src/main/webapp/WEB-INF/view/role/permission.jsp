<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link type="text/css" rel="stylesheet" href="${ctx }/resources/js/jstree/themes/default/style.css"/>
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.min.js"></script>   
<script type="text/javascript" src="${ctx }/resources/js/jstree/jstree.checkbox.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/underscore/underscore-min.js"></script> 
<script type="text/javascript">
$(function() {
    webside.form.resource.authorize.initResourceTree();
});
</script>  
<div class="page-header">
	<h1>
		权限设置-<small>[${roleEntity.name }]</small>
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="permissionForm" name="permissionForm" class="form-horizontal" role="form" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }">
		<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }">
		<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }">
		<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
		<input type="hidden" id="id" name="id" value="${roleEntity.id }">
		   <!-- 资源树 -->
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="description">资源</label>
		      <div class="col-sm-10">
		         <div id="tree"></div>
		      </div>
		   </div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="webside.form.resource.authorize.commitPerm('/role/permission.html' , '/role/listUI.html')" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;
		保存
	</button>
		<button id="btn" type="button" onclick="webside.common.loadPage('/role/listUI.html?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }')" class="btn btn-info btn-sm">
		<i class="fa fa-trash-o"></i>&nbsp;返回
	</button>
</div>