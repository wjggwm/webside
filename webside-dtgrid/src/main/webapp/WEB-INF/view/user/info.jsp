<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ctx }/resources/js/datepicker/css/bootstrap-datepicker3.standalone.min.css"/>
<script type="text/javascript" src="${ctx }/resources/js/datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/datepicker/locales/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function() {
    webside.form.userInfo.initButton();
    webside.form.userInfo.initBirthday();
    webside.form.userInfo.validateUserInfoForm();
});
</script>
<style type="text/css">
.noform{
	padding:7px 0px 0px 12px;
	font-size: 14px;
}
</style>
<div class="page-header">
	<h1>
		个人资料
	</h1>
</div>

<div class="row" style="margin-top:5px;">
	<div class="col-xs-12">
		<form class="form-horizontal" role="form" method="post">
			   <div class="form-group">
					<button id="btnEdit" type="button" class="btn btn-success btn-sm">
					  	<i class="fa fa-user-plus"></i>&nbsp;编辑
					</button>
					<button id="btnAdd" type="button" onclick="javascript:$('#userInfoForm').submit();" class="btn btn-success btn-sm" style="display: none;">
					  	<i class="fa fa-user-plus"></i>&nbsp;保存
					</button>
					<button id="btnBack" type="button" onclick="javascript:top.location.href = 'index.html'" class="btn btn-info btn-sm">
						<i class="fa fa-undo"></i>&nbsp;返回
					</button>
				</div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">邮箱:</label>
			      <div class="col-sm-10 noform">
			      	${userEntity.accountName }
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">所属角色:</label>
			      <div class="col-sm-10 noform">
			      	${userEntity.role.name}
			      </div>
			   </div> 
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">用户描述:</label>
			      <div class="col-sm-10 noform">
			         <c:if test="${empty userEntity.description }">无</c:if>
			         <c:if test="${!empty userEntity.description }">${userEntity.description }</c:if>
			      </div>
			   </div> 
		</form>
		<div class="hr hr-dotted"></div>
		<form id="userInfoForm" name="userInfoForm" class="form-horizontal" role="form" method="post">
			<input type="hidden" name="id" id="userInfoId" value="${userEntity.id }">
			<input type="hidden" name="userInfo.id" value="${userEntity.id }">
			<input type="hidden" name="userInfo.email" value="${userEntity.accountName }"/>
			<input type="hidden" name="role.id" value="${userEntity.role.id }">
			<input type="hidden" name="email" value="${userEntity.accountName }">
			<div id="lableDiv">
				<div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">真实姓名:</label>
			      <div class="col-sm-10 noform">
			      	${userEntity.userName }
			      </div>
			   </div> 
				<div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right">性别:</label>
			      <div class="col-sm-10 noform">
					<c:if test="${userEntity.userInfo.sex eq 1}">男</c:if>
					<c:if test="${userEntity.userInfo.sex eq 2}">女</c:if>
			      </div>
				</div>
				<div class="form-group">
				      <label class="control-label col-sm-1 no-padding-right" for="birthday">出生日期:</label>
				      <div class="col-sm-10 noform">
				         <fmt:formatDate value="${userEntity.userInfo.birthday }" pattern="yyyy-MM-dd"/>
			      	</div>
			    </div>   
			    <div class="form-group">
				      <label class="control-label col-sm-1 no-padding-right" for="telephone">手机号码:</label>
				      <div class="col-sm-10 noform">
				         ${userEntity.userInfo.telephone }
			      	</div>
			    </div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="address">联系地址:</label>
			      <div class="col-sm-10 noform">
			         ${userEntity.userInfo.address }
			      </div>
			   </div>
			</div>
			<div id="formDiv" style="display: none;">
				<div class="form-group">
				      <label class="control-label col-sm-1 no-padding-right">姓名:</label>
				      <div class="col-sm-10">
				      <div class="clearfix">
				         <input class="form-control" name="userName" id="userName" type="text"
				          value="${userEntity.userName }" placeholder="姓名..."/>
				          </div>
			      	</div>
			    </div> 
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="userInfo.sex">性别</label>
			      <div class="col-sm-10">
			           <div class="radio">
							<label>
								<input name="userInfo.sex" type="radio" class="ace input-lg" value="1" <c:if test="${userEntity.userInfo.sex eq 1}">checked</c:if>>
								<span class="lbl bigger-110">男</span>
							</label>
							<label>
								<input name="userInfo.sex" type="radio" class="ace input-lg" value="2" <c:if test="${userEntity.userInfo.sex eq 2}">checked</c:if>>
								<span class="lbl bigger-110">女</span>
							</label>
						</div>
			      </div>
			   </div>
				<div class="form-group">
				      <label class="control-label col-sm-1 no-padding-right" for="userInfo.birthday">出生日期</label>
				      <div class="col-sm-10">
				      <div class="clearfix">
				         <input class="form-control date-picker" name="userInfo.birthday" id="birthday" type="text"
				          value="<fmt:formatDate value="${userEntity.userInfo.birthday }" pattern="yyyy-MM-dd"/>" placeholder="出生日期..."/>
			      		</div>
			      	</div>
			    </div>   
			    <div class="form-group">
				      <label class="control-label col-sm-1 no-padding-right" for="userInfo.telephone">手机号码</label>
				      <div class="col-sm-10">
				      <div class="clearfix">
				         <input class="form-control" name="userInfo.telephone" id="telephone" type="text"
				          value="${userEntity.userInfo.telephone }" placeholder="手机号码..."/>
				          </div>
			      	</div>
			    </div>
			   <div class="form-group">
			      <label class="control-label col-sm-1 no-padding-right" for="userInfo.address">联系地址</label>
			      <div class="col-sm-10">
			      <div class="clearfix">
			         <input class="form-control" name="userInfo.address" id="address" type="text"
			         value="${userEntity.userInfo.address }" placeholder="联系地址..."/>
			         </div>
			      </div>
			   </div> 
			</div>   
		</form>
	</div>
</div>