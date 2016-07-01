<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ctx }/resources/js/select2/select2.min.css" />
<script type="text/javascript"
	src="${ctx }/resources/js/select2/select2.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/select2/zh-CN.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	webside.form.resource.initSourceType();
	webside.form.resource.initSourceTree();
	webside.form.resource.initIcon();
	webside.form.resource.initType();
	webside.form.resource.validateResourceForm();
});
</script>
<style>
.iconShow
{
	padding-left: 10px; 
	padding-top: 3px;
}
.source-icon
{
	 width:95%;
	 float:left;
}
@media screen and (max-width: 374px){
	.source-icon
	{
		 width:82%;
	}
}
@media screen and (min-width: 375px) and (max-width: 449px){
	.source-icon
	{
		 width:85%;
	}
}
@media screen and (min-width: 450px) and (max-width: 1279px) {
	.source-icon
	{
		 width:90%;
	}
}
@media screen and (min_width: 1280px) {
	.source-icon
	{
		 width:90%;
	}
}
</style>
<div class="page-header">
	<h1>
		<c:if test="${empty resourceEntity}">
		新增资源
		</c:if>
		<c:if test="${!empty resourceEntity}">
		编辑资源
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top: 5px;">
	<div class="col-xs-12">
		<form id="resourceForm" name="resourceForm" class="form-horizontal" role="form" method="post">
			<c:if test="${!empty resourceEntity}">
				<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }"> 
				<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }"> 
				<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }"> 
				<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
				<input type="hidden" name="id" id="resourceId" value="${resourceEntity.id }">
				<input type="hidden" name="isHide" value="${resourceEntity.isHide }">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="type">资源类型</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<select class="form-control" id="type" name="type"
						style="width: 100%">
						<option value="0"
							<c:if test="${resourceEntity.type eq 0 }">selected="selected"</c:if>>菜单</option>
						<option value="1"
							<c:if test="${resourceEntity.type eq 1 }">selected="selected"</c:if>>按钮</option>
					</select>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="name">上级名称</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<select class="form-control" name="parentId" id="parentId"
						style="width: 100%">
						<option value=""></option>
						<option value=" " <c:if test="${resourceEntity.parentId eq null}">selected="selected"</c:if>>目录菜单</option>
						<c:forEach var="item" items="${select2List }">
							<option value="${item.id }"
								<c:if test="${resourceEntity.parentId eq item.id}">selected="selected"</c:if>>${item.text }</option>
						</c:forEach>
					</select>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right" for="name">资源名称</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<input class="form-control" name="name" id="name" type="text"
						value="${resourceEntity.name }" placeholder="资源名称..." />
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="sourceKey">资源标识</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<input class="form-control" name="sourceKey" id="sourceKey"
						type="text" value="${resourceEntity.sourceKey }"
						placeholder="资源标识..." />
				</div>
				</div>
			</div>
			
			<!-- 
			<c:choose>
				<c:when test="${!empty resourceEntity}">
					<c:if test="${resourceEntity.parentId eq null}">style="display: none;"</c:if>
				</c:when>
				<c:otherwise>style="display: none;"</c:otherwise>
			</c:choose>
			 -->
			<div class="form-group" id="sourceUrlDiv" >
				<label class="control-label col-sm-1 no-padding-right"
					for="sourceUrl">资源URL</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<input class="form-control" name="sourceUrl" id="sourceUrl"
						type="text" value="${resourceEntity.sourceUrl }"
						placeholder="菜单URL..." />
				</div>
				</div>
			</div>
			
			<!-- <c:if test="${resourceEntity.parentId ne null}">style="display: none;"</c:if> -->
			<div id="iconDiv" class="form-group" >
				<label class="control-label col-sm-1 no-padding-right" for="icon">菜单图标</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<input class="form-control source-icon" name="icon" id="icon" type="text"
						value="${resourceEntity.icon }" placeholder="请选择菜单图标..."/> 
					<i id="iconShow" data-rel="tooltip" data-placement="left" data-original-title="点击清除图标" class="<c:if test="${fn:length(resourceEntity.icon) gt 0 }">${resourceEntity.icon } green fa-2x iconShow tooltip-success</c:if>"></i>
				</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1 no-padding-right"
					for="description">资源描述</label>
				<div class="col-sm-10">
				<div class="clearfix">
					<input class="form-control" name="description" id="description"
						type="text" value="${resourceEntity.description }"
						placeholder="资源描述..." />
				</div>
				</div>
			</div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#resourceForm').submit();" class="btn btn-success btn-sm">
		<i class="fa fa-user-plus"></i>&nbsp;
		<c:if test="${empty resourceEntity}">
		添加
		</c:if>
		<c:if test="${!empty resourceEntity}">
		保存
		</c:if>
	</button>
	<button id="btn" type="button"
		onclick="webside.common.loadPage('/resource/listUI.html<c:if test="${!empty resourceEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')"
		class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>