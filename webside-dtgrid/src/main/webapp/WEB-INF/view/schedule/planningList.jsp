<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/customer/schedule/planningList.js"></script>
<div class="page-header">
	<shiro:hasPermission name="schedule:addJob">
		<button id="btnAdd" type="button" onclick="webside.common.addModel('/scheduleJob/addJobUI.html')" class="btn btn-primary btn-sm">
		  	<i class="fa fa-plus"></i>&nbsp;添加job
		</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:executeJob">
		<button id="btnDel" type="button" onclick="webside.form.schedule.executeJob('/scheduleJob/executeJob.html', customSearch)" class="btn btn-info btn-sm">
			<i class="fa fa-cogs"></i>&nbsp;执行
		</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:pauseJob">
		<button id="btnDel" type="button" onclick="webside.form.schedule.executeJob('/scheduleJob/pauseJob.html', customSearch)" class="btn btn-warning btn-sm">
			<i class="fa fa-pause"></i>&nbsp;暂停
		</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:resumeJob">
		<button id="btnDel" type="button" onclick="webside.form.schedule.executeJob('/scheduleJob/resumeJob.html', customSearch)" class="btn btn-success btn-sm">
			<i class="fa fa-play"></i>&nbsp;恢复
		</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="schedule:deleteJob">
		<button id="btnDel" type="button" onclick="webside.form.schedule.delModel('/scheduleJob/deleteJob.html', customSearch)" class="btn btn-danger btn-sm">
			<i class="fa fa-remove"></i>&nbsp;删除
		</button>
	</shiro:hasPermission>
</div>
<div class="row" style="margin-top:5px;">
	<div class="col-xs-12 widget-container-col ui-sortable"
		style="min-height: 127px;">
		<!-- #section:custom/widget-box.options.transparent -->
		<div class="widget-box transparent ui-sortable-handle"
			style="opacity: 1; z-index: 0;">
			<div class="widget-header">
				<h4 class="widget-title lighter">计划中Job列表</h4>
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
					<div id="dtGridContainer" class="dlshouwen-grid-container"></div>
					<div id="dtGridToolBarContainer" class="dlshouwen-grid-toolbar-container"></div>
				</div>
			</div>
		</div>
	</div>
	
	
</div>


