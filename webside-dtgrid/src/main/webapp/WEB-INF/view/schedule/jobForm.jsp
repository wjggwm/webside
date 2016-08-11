<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	    $("#cronExpression").cronGen({
	    	direction : 'left' //可选：top|right|bottom|left
	    });
		webside.form.schedule.initTrigger();
	    webside.form.schedule.validateJobForm();
	});
</script>
<style>
legend{width:92%;}
</style>
<div class="page-header">
	<h1>
		新增任务
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="jobForm" name="jobForm" class="form-horizontal" role="form" method="post">
		   <input type="hidden" name="jobGroup" id="jobGroup" value="">
		   <input type="hidden" name="jobClassName" id="jobClassName" value="">
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="jobName">任务名称</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="jobName" id="jobName" type="text" 
		           value="" placeholder="任务名称..."/>
		      </div>
		      </div>
		   </div>
			<div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="jobGroupSelect">任务组</label>
			      <div class="col-sm-10">
			      <div class="clearfix">
				      <select class="form-control" name="jobGroupSelect" id="jobGroupSelect" style="width: 100%">
						<option value=""></option>
						<c:forEach var="group" items="${jobGroup }">
							<option value="${group.jobClassName }">${group.jobName }</option>
						</c:forEach>
					</select>
		      	</div>
		      	</div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="description">任务描述</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="JobDesc" id="JobDesc" type="text"
		         value="" placeholder="任务描述..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="isAddTrigger">触发器</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input type="checkbox" id="isAddTrigger"/>
		      </div>
		      </div>
		   </div>
		   <div id="triggerDiv">
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="triggerName">trigger名称</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="triggerName" id="triggerName" type="text" 
		           value="" placeholder="trigger名称..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="triggerGroup">trigger组</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="triggerGroup" id="triggerGroup" type="text" 
		           value="" placeholder="trigger组,不填写将使用系统默认..."/>
		      </div>
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="startDate">开始时间</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control date-picker" name="startDate" id="startDate" type="text"
		         value="" placeholder="开始时间..."/>
		      </div>
		      </div>
		   </div> 
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="endDate">结束时间</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control date-picker" name="endDate" id="endDate" type="text"
		         value="" placeholder="结束时间..."/>
		      </div>
		      </div>
		   </div> 
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="cronExpression">cron表达式</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="cronExpression" id="cronExpression" type="text"
		         value="" placeholder="cron表达式..."/>
		      </div>
		      </div>
		   </div>
		   </div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#jobForm').submit();" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;
		添加
	</button>
		<button id="btn" type="button" onclick="webside.common.loadPage('/scheduleJob/planningJobListUI.html')" class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>