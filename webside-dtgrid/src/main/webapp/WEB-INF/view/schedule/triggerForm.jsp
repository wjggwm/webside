<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ctx }/resources/js/select2/select2.min.css" />
<script type="text/javascript" src="${ctx }/resources/js/select2/select2.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/select2/zh-CN.js"></script>
<link rel="stylesheet" href="${ctx }/resources/js/datepicker/css/bootstrap-datepicker3.standalone.min.css"/>
<script type="text/javascript" src="${ctx }/resources/js/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
<link rel="stylesheet" href="${ctx }/resources/js/cronGen/cronGen.css"/>
<script type="text/javascript" src="${ctx }/resources/js/cronGen/cronGen.min.js"></script>

<script type="text/javascript">
	$(function() {
		webside.form.schedule.initJobGroup();
		webside.form.schedule.initStartDate();
		webside.form.schedule.initEndDate();
	    webside.form.schedule.validateTriggerForm();
	    $("#cronExpression").cronGen({
	    	direction : 'left' //可选：top|right|bottom|left
	    });
	});
</script>
<div class="page-header">
	<h1>
		<c:if test="${empty scheduleJobEntity.triggerName}">
		新增trigger
		</c:if>
		<c:if test="${!empty scheduleJobEntity.triggerName}">
		编辑trigger
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="triggerForm" name="triggerForm" class="form-horizontal" role="form" method="post">
		<c:if test="${!empty scheduleJobEntity.triggerName}">
			<input type="hidden" name="jobTriggerHide" id="jobTriggerHide" value="${scheduleJobEntity.triggerName }">
		</c:if>
		<input type="hidden" name="jobName" id="jobName" value="${scheduleJobEntity.jobName }"/>
		<input type="hidden" name="jobGroup" id="jobGroup" value="${scheduleJobEntity.jobGroup }"/>
		  <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="triggerName">trigger名称</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="triggerName" id="triggerName" type="text" 
		           value="${scheduleJobEntity.triggerName }" placeholder="trigger名称..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="triggerGroup">trigger组</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="triggerGroup" id="triggerGroup" type="text" 
		           value="${scheduleJobEntity.triggerGroup }" placeholder="trigger组,不填写将使用系统默认..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="startDate">开始时间</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control date-picker" name="startDate" id="startDate" type="text"
		         value="<fmt:formatDate value="${scheduleJobEntity.startDate }" pattern="yyyy-MM-dd"/>" placeholder="开始时间..."/>
		      </div>
		      </div>
		   </div> 
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="endDate">结束时间</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control date-picker" name="endDate" id="endDate" type="text"
		         value="<fmt:formatDate value="${scheduleJobEntity.endDate }" pattern="yyyy-MM-dd"/>" placeholder="结束时间..."/>
		      </div>
		      </div>
		   </div> 
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cronExpression">cron表达式</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cronExpression" id="cronExpression" type="text"
		         value="${scheduleJobEntity.cronExpression }" placeholder="cron表达式..."/>
		      </div>
		      </div>
		   </div> 
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#triggerForm').submit();" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;
	  	<c:if test="${empty scheduleJobEntity.triggerName}">
		添加
		</c:if>
	  	<c:if test="${!empty scheduleJobEntity.triggerName}">
		保存
		</c:if>
	</button>
		<button id="btn" type="button" onclick="webside.common.loadPage('/scheduleJob/jobTriggerListUI.html?jobName=${scheduleJobEntity.jobName }&jobGroup=${scheduleJobEntity.jobGroup }')" class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>