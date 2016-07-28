<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/customer/schedule/triggerList.js"></script>
<div class="page-header">
	<button id="btnAdd" type="button" onclick="webside.common.loadPage('/scheduleJob/planningJobListUI.html')" class="btn btn-grey btn-sm">
	  	<i class="fa fa-reply"></i>&nbsp;返回
	</button>
	<shiro:hasPermission name="schedule:addTrigger">
	<button id="btnAdd" type="button" onclick="webside.common.addModel('/scheduleJob/addTriggerUI.html?jobName=${scheduleJobEntity.jobName }&jobGroup=${scheduleJobEntity.jobGroup }')" class="btn btn-primary btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;添加
	</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:editTrigger">
	<button id="btnEdit" type="button" onclick="webside.form.schedule.editModel('/scheduleJob/editTriggerUI.html')" class="btn btn-info btn-sm">
		 <i class="fa fa-pencil-square-o"></i>&nbsp;编辑
	</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:deleteTrigger">
	<button id="btnDel" type="button" onclick="webside.form.schedule.delModel('/scheduleJob/deleteTrigger.html', customSearch)" class="btn btn-danger btn-sm">
		<i class="fa fa-remove"></i>&nbsp;删除
	</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:pauseTrigger">
	<button id="btnDel" type="button" onclick="webside.form.schedule.executeJob('/scheduleJob/pauseTrigger.html', customSearch)" class="btn btn-warning btn-sm">
		<i class="fa fa-pause"></i>&nbsp;暂停
	</button>
	</shiro:hasPermission>
		<shiro:hasPermission name="schedule:resumeTrigger">
	<button id="btnDel" type="button" onclick="webside.form.schedule.executeJob('/scheduleJob/resumeTrigger.html', customSearch)" class="btn btn-success btn-sm">
		<i class="fa fa-play"></i>&nbsp;恢复
	</button>
	</shiro:hasPermission>
</div>
<div class="input-group">
     <input id="searchKey" type="text" class="input form-control" placeholder="任务名称...">
     <span class="input-group-btn">
         <button id="btnSearch" class="btn btn-primary btn-sm" type="button"> <i class="fa fa-search"></i> 搜索</button>
     </span>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12 widget-container-col ui-sortable"
		style="min-height: 127px;">
		<!-- #section:custom/widget-box.options.transparent -->
		<div class="widget-box transparent ui-sortable-handle"
			style="opacity: 1; z-index: 0;">
			<div class="widget-header">
				<h4 class="widget-title lighter">[${scheduleJobEntity.jobGroup }.${scheduleJobEntity.jobName }]-trigger列表</h4>
				<div class="widget-toolbar no-border">
					<a href="#" data-action="fullscreen" class="orange2"> 
						<i class="ace-icon fa fa-arrows-alt"></i>
					</a> 
					<a href="#" data-action="collapse" class="green"> 
						<i class="ace-icon fa fa-chevron-up"></i>
					</a>
				</div>
			</div>

			<div class="widget-body" style="display: block;">
				<div class="widget-main padding-6 no-padding-left no-padding-right">
					<input id="jobName" type="hidden" value="${scheduleJobEntity.jobName }">
					<input id="jobGroup" type="hidden" value="${scheduleJobEntity.jobGroup }">
					<div id="dtGridContainer" class="dlshouwen-grid-container"></div>
					<div id="dtGridToolBarContainer" class="dlshouwen-grid-toolbar-container"></div>
				</div>
			</div>
		</div>
	</div>
	
	
</div>


