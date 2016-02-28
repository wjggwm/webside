<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>webside-登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="X-UA-Compatible" content="E=edge;chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="webside,响应式前端解决方案,一站式架构设计,基础功能模块" />
<meta name="description" content="webside,响应式前端解决方案,一站式架构设计,基础功能模块" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link
	href="${ctx }/resources/images/webside.ico"
	rel="icon" />
<link
	href="${ctx }/resources/images/webside.ico"
	type="image/x-icon" rel="bookmark" />
<link
	href="${ctx }/resources/images/webside.ico"
	type="image/x-icon" rel="shortcut icon" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="${ctx }/resources/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ctx }/resources/fonts/webside/font-webside.min.css" />
	<!--[if lt IE 8]>
<link rel="stylesheet" href="${ctx }/resources/fonts/webside/font-webside-ie7.min.css"/>
<!--<![endif]-->
<!-- ace styles -->
<link rel="stylesheet"
	href="${ctx }/resources/css/customer/webside-login.min.css" />

<!--[if lte IE 9]>
	<link rel="stylesheet" href="${ctx }/resources/css/ace/ace-part2.min.css" />
<![endif]-->

<!--[if lte IE 9]>
	<link rel="stylesheet" href="${ctx }/resources/css/ace/ace-ie.min.css" />
<![endif]-->
		
<!-- JQuery script -->
<!--[if !IE]><!-->
<script type="text/javascript"
	src="${ctx }/resources/js/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->
<!--[if IE]>
	<script type="text/javascript" src="${ctx }/resources/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<!-- basic scripts -->
<script type="text/javascript">
	if ("ontouchend" in document)
		document.write("<script src='${ctx }/resources/js/jquery/jquery.mobile.custom.min.js'>" + "<"+"script>");
</script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="${ctx }/resources/js/ie/html5shiv.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/js/ie/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${ctx }/resources/js/layer-v2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/particleground/jquery.particleground.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/customer/index/login.js"></script>
<script type="text/javascript">
$(document).ready(function() {
//错误提示信息
if ("${error}" != "") {
		layer.alert('${error}', {icon : 5,shift : 6,time : 0});
	}
});
</script>
</head>
<body>
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf ace-icon  green"></i> <span class="white">WebSide
									V1.0</span>
							</h1>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon icon-coffee blue"></i> 请输入帐号信息
										</h4>

										<div class="space-6"></div>

										<form id="loginform" name="loginform"
											action="${ctx }/login.html"
											method="post">
											<fieldset>
												<label class="block clearfix"> 
												<span class="block input-icon input-icon-right"> 
													<input name="accountName" type="email" class="form-control" placeholder="邮箱" /> 
													<i class="ace-icon icon-user"></i>
												</span>
												</label> 
												<label class="block clearfix"> 
												<span class="block input-icon input-icon-right"> 
													<input name="password" type="password" class="form-control" placeholder="密码" />
													<i class="ace-icon icon-lock"></i>
												</span>
												</label>
												<label class="block clearfix"> 
													<input id="captcha" name="captcha" type="text" class="form-control" placeholder="验证码" style="width:60%;float:left;"/>
												<img id="kaptchaImage" src="${ctx }/captcha.html" style="cursor:pointer; margin-left:10px;" title="点击更换"/>  
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox"
														class="ace" /> <span class="lbl"> 记住我</span>
													</label>

													<button onclick="login();" type="button" 
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon icon-key"></i> <span
															class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

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
									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon icon-arrow-left"></i> 忘记密码
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> 新用户注册 <i
												class="ace-icon icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon icon-key"></i> 密码找回
										</h4>

										<div class="space-6"></div>
										<p>输入您注册时填写的邮箱</p>

										<form id="recoverPassword" name="recoverPassword"
											action="${ctx }/recoverPassword.html"
											method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> 
													<input name="accountName" type="email" class="form-control" placeholder="邮箱" />
														<i class="ace-icon icon-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon icon-lightbulb-o"></i> <span
															class="bigger-110">发送</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> 返回登录 <i
											class="ace-icon icon-arrow-right"></i>
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
											<i class="ace-icon icon-group green"></i> 
											新用户注册
										</h4>

										<div class="space-6"></div>
										<p>请输入你的注册信息:</p>

										<form id="registerform" name="registerform" action="${ctx }/register.html"
											method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input name="accountName"
														type="email" class="form-control" placeholder="邮箱" />
														<i class="ace-icon icon-envelope"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input name="userName"
														type="text" class="form-control" placeholder="真实姓名" />
														<i class="ace-icon icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input name="password"
														type="password" class="form-control"
														placeholder="密码" /> <i class="ace-icon icon-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span id="repassword"
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control"
														placeholder="确认密码" /> <i
														class="ace-icon icon-retweet"></i>
												</span>
												</label> <label class="block"> <input type="checkbox"
													class="ace" /> <span class="lbl"> 我接受 <a
														href="#">用户协议</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon icon-refresh"></i> <span
															class="bigger-110">重置</span>
													</button>

													<button type="button" onclick="register();"
														class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">注册</span> <i
															class="ace-icon icon-arrow-right icon-on-right"></i>
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
