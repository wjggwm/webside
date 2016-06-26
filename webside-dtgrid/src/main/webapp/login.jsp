<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>webside-登录</title>
<%@include file="common/common-login.jsp" %>
<script type="text/javascript" src="${ctx }/resources/js/customer/index/login.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/layer-v2.3/layer.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//错误提示信息
	if ("${error}" != "") {
    	layer.alert('${error}', {icon : 5,shift : 6,time : 0});
	}
	
	//页面进行跳转到login.html
	if (window.location.href.indexOf("/login.html") == -1) {
	    if($("#userId").val() == null || $("#userId").val() == "")
	    {
	        top.location.href = "login.html";
	    }else
	    {
	        top.location.href = "index.html";
	    }
	}
	
});
</script>
</head>
<body class="login-layout">
<input id="userId" type="hidden" value="<c:if test="${not empty sessionScope.userSessionId}">${sessionScope.userSessionId }</c:if>"/>
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<img src="${ctx }/resources/images/logo.png"/>
							</h1>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee blue"></i> 请输入帐号信息
										</h4>

										<div class="space-6"></div>

										<form id="loginform" name="loginform"
											action="${ctx }/login.html"
											method="post">
											<fieldset>
												<label class="block clearfix"> 
												<span class="block input-icon input-icon-right"> 
													<input name="accountName" id="accountName" type="email" class="form-control" placeholder="邮箱" /> 
													<i class="ace-icon fa fa-user"></i>
												</span>
												</label> 
												<label class="block clearfix"> 
												<span class="block input-icon input-icon-right"> 
													<input name="password" id="password" type="password" class="form-control" placeholder="密码" />
													<i class="ace-icon fa fa-lock"></i>
												</span>
												</label>
												<label class="block clearfix"> 
													<input id="captcha" name="captcha" type="text" class="form-control" placeholder="验证码" style="width:60%;float:left;"/>
												<img id="kaptchaImage" src="${ctx }/captcha.html" style="cursor:pointer; margin-left:10px;" title="点击更换"/>  
												</label>

												<div class="space"></div>

												<div class="clearfix">
												<input type="hidden" id="rememberMe" name="rememberMe" value="false"/>
													<label class="inline"> <input id="rememberMeCheckBox" type="checkbox"
														class="ace" /> <span class="lbl"> 记住我</span>
													</label>

													<button onclick="login();" type="button" 
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
								<!-- 
										<div class="social-or-login center">
											<span class="bigger-110">第三方帐号登录</span>
										</div>

										<div class="space-6"></div>

										<div class="social-login center">
											<a class="btn btn-primary"> <i
												class="ace-icon icon-qq"></i>
											</a> <a class="btn btn-info"> <i
												class="ace-icon icon-sina-weibo"></i>
											</a> <a class="btn btn-danger"> <i
												class="ace-icon icon-wechat"></i>
											</a>
										</div>
								-->
									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> 忘记密码
											</a>
										</div>
									<!-- 
										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> 新用户注册 <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									 -->
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> 密码找回
										</h4>

										<div class="space-6"></div>
										<p>输入您注册时填写的邮箱</p>

										<form id="recoverPassword" name="recoverPassword"
											action="${ctx }/recoverPassword.html"
											method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input name="accountName" id="recoverAccoutName" type="email" class="form-control" placeholder="邮箱" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button" onclick="resetPassword();"
														class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span
															class="bigger-110">发送</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" id="recoverWidget" data-target="#login-box"
											class="back-to-login-link"> 返回登录 <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-group green"></i> 
											新用户注册
										</h4>

										<div class="space-6"></div>
										<p>请输入你的注册信息:</p>

										<form id="registerform" name="registerform" action="${ctx }/register.html"
											method="post">
											<input type="hidden" name="userInfo.id" />
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input name="accountName" id="registerAccountName"
														type="email" class="form-control" placeholder="真实邮箱,将做为登录系统的账户名" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input name="userName" id="registerUserName"
														type="text" class="form-control" placeholder="真实姓名" />
														<i class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input name="password" id="registerPassword"
														type="password" class="form-control"
														placeholder="密码" /> <i class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input id="registerRePassword" type="password" class="form-control"
														placeholder="确认密码" /> <i
														class="ace-icon fa fa-retweet"></i>
												</span>
												</label> <label class="block"> <input id="registerAccept" type="checkbox"
													class="ace" /> <span class="lbl"> 我接受 <a
														href="#">用户协议</a>
												</span>
												</label>

												<div class="space-10"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">重置</span>
													</button>

													<button type="button" onclick="register();"
														class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 
											返回登录
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

</body>
</html>
