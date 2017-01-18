<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<style type="text/css">
.noform{
	padding:7px 0px 0px 12px;
	font-size: 14px;
}
</style>
<div class="page-header">
	<h1>
		session详情
	</h1>
</div>

<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form" method="post">
			   <div class="form-group">
					<button id="btnBack" type="button" onclick="webside.common.loadPage('/session/listUI.html')" class="btn btn-info btn-sm"  style="margin-left: 13px;">
						<i class="fa fa-undo"></i>&nbsp;返回
					</button>
				</div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">session ID:</label>
			      <div class="col-sm-10 noform">
			      	${userSessionEntity.sessionId }
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">账户:</label>
			      <div class="col-sm-10 noform">
			         ${userSessionEntity.accountName }
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">IP:</label>
			      <div class="col-sm-10 noform">
			      	${userSessionEntity.host }
			      </div>
			   </div> 
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">创建时间:</label>
			      <div class="col-sm-10 noform">
			         <fmt:formatDate value="${userSessionEntity.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			      </div>
			   </div> 
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">最后交互时间:</label>
			      <div class="col-sm-10 noform">
			         <fmt:formatDate value="${userSessionEntity.lastAccess }" pattern="yyyy-MM-dd HH:mm:ss"/>
			      </div>
			   </div>
		</form>
	</div>
</div>