<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
    webside.form.user.validateUserPasswordForm();
}); 
</script>
<div class="page-header">
	<h1>
		修改密码
	</h1>
</div>

<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form id="userPassword" name="userPassword" class="form-horizontal" role="form" method="post">
			<input type="hidden" name="id" value="${userEntity.id }">
			<input type="hidden" name="userName" value="${userEntity.userName }">
		    <input type="hidden" name="accountName" value="${userEntity.accountName }"/>
			<div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="password">新密码</label>
			      <div class="col-sm-10">
			      	<div class="clearfix">
			         <input class="form-control" name="password" id="password" type="password"
			          value="" placeholder="密码..."/>
			          </div>
		      	</div>
		    </div>   
		    <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="repassword">确认密码</label>
			      <div class="col-sm-10">
			      <div class="clearfix">
			         <input class="form-control" name="repassword" id="repassword" type="password"
			          value="" placeholder="确认密码..."/>
			      </div>
		      	</div>
		    </div>
		</form>
		<div class="hr hr-dotted"></div>
	</div>
</div>
<div class="center">
	<button id="btnAdd" type="button" onclick="javascript:$('#userPassword').submit();" class="btn btn-success btn-sm">
	  	<i class="fa fa-user-plus"></i>&nbsp;保存
	</button>
	<button id="btnBack" type="button" onclick="javascript:top.location.href = 'index.html'" class="btn btn-info btn-sm">
		<i class="fa fa-undo"></i>&nbsp;返回
	</button>
</div>