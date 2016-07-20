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
<script type="text/javascript" src="${ctx }/resources/js/cronGen/cronGen.js"></script>
<script type="text/javascript">
	$(function() {
		webside.form.schedule.initJobGroup();
		webside.form.schedule.initStartDate();
		webside.form.schedule.initEndDate();
	    webside.form.schedule.validateScheduleForm();
	    $("#cronExpression").cronGen();
	});
</script>
<div class="page-header">
	<h1>
		<c:if test="${empty scheduleJobEntity}">
		新增任务
		</c:if>
		<c:if test="${!empty scheduleJobEntity}">
		编辑任务
		</c:if>
	</h1>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="scheduleForm" name="scheduleForm" class="form-horizontal" role="form" method="post">
		<c:if test="${!empty scheduleJobEntity}">
			<input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum }">
			<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize }">
			<input type="hidden" id="orderByColumn" name="orderByColumn" value="${page.orderByColumn }">
			<input type="hidden" id="orderByType" name="orderByType" value="${page.orderByType }">
			<input type="hidden" name="id" id="jobId" value="${scheduleJobEntity.id }">
		</c:if>
		<input type="hidden" name="jobGroup" id="jobGroup" value="${scheduleJobEntity.jobGroup }">
		<input type="hidden" name="jobClassName" id="jobClassName" value="${scheduleJobEntity.jobClassName }">
		   <div class="form-group">
		      <label class="control-label col-sm-1 no-padding-right" for="jobName">任务名称</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input <c:if test="${!empty scheduleJobEntity}">readonly</c:if> class="form-control" name="jobName" id="jobName" type="text" 
		           value="${scheduleJobEntity.jobName }" placeholder="任务名称..."/>
		      </div>
		      </div>
		   </div>
			<div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="jobGroupSelect">任务组</label>
			      <div class="col-sm-10">
			      <div class="clearfix">
				      <select <c:if test="${!empty scheduleJobEntity}">disabled</c:if> class="form-control" name="jobGroupSelect" id="jobGroupSelect" style="width: 100%">
						<option value=""></option>
						<c:choose>
							<c:when test="${!empty scheduleJobEntity}">
								<c:forEach var="group" items="${jobGroup }">
									<option value="${group.jobClassName }" <c:if test="${scheduleJobEntity.jobGroup eq group.jobName}">selected="selected"</c:if>>${group.jobName }</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="group" items="${jobGroup }">
									<option value="${group.jobClassName }">${group.jobName }</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</select>
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
		      <label class="control-label col-sm-1 no-padding-right" for="description">任务描述</label>
		      <div class="col-sm-10">
		      <div class="clearfix">
		         <input class="form-control" name="JobDesc" id="JobDesc" type="text"
		         value="${scheduleJobEntity.jobDesc }" placeholder="任务描述..."/>
		      </div>
		      </div>
		   </div> 
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#scheduleForm').submit();" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;
	  	<c:if test="${empty scheduleJobEntity}">
		添加
		</c:if>
	  	<c:if test="${!empty scheduleJobEntity}">
		保存
		</c:if>
	</button>
		<button id="btn" type="button" onclick="webside.common.loadPage('/scheduleJob/listUI.html<c:if test="${!empty scheduleJobEntity}">?page=${page.pageNum }&rows=${page.pageSize }&sidx=${page.orderByColumn }&sord=${page.orderByType }</c:if>')" class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>