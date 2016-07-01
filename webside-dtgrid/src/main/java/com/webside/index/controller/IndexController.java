package com.webside.index.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.webside.base.basecontroller.BaseController;
import com.webside.exception.SystemException;
import com.webside.logininfo.model.LoginInfoEntity;
import com.webside.logininfo.service.LoginInfoService;
import com.webside.resource.model.ResourceEntity;
import com.webside.resource.service.ResourceService;
import com.webside.role.model.RoleEntity;
import com.webside.role.service.RoleService;
import com.webside.user.model.UserEntity;
import com.webside.user.service.UserService;
import com.webside.util.EndecryptUtils;
import com.webside.util.TreeUtil;

@Controller
@Scope("prototype")
@RequestMapping(value = "/")
public class IndexController extends BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private LoginInfoService loginInfoService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private Producer captchaProducer;

	@RequestMapping(value = "login.html", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String login(HttpServletRequest request) {
		try{
			request.removeAttribute("error");
			return "/login";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}

	/**
	 * 用户登录
	 * 认证过程：
	 * 1、想要得到Subject对象,访问地址必须在shiro的拦截地址内,不然会报空指针
	 * 2、用户输入的账号和密码,存到UsernamePasswordToken对象中,然后由shiro内部认证对比
	 * 3、认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
	 * 4、当以上认证成功后会向下执行,认证失败会抛出异常
	 * 
	 * @param accountName	账户名称
	 * @param password	密码
	 * @return
	 */
	@RequestMapping(value = "login.html", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String userLogin(String accountName, String password, String captcha, Boolean rememberMe, HttpServletRequest request) {
		UsernamePasswordToken token = null;
		try {
			 //从session中取出servlet生成的验证码text值
	        String expected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
	        //获取用户页面输入的验证码
	        if(!captcha.equalsIgnoreCase(expected))
	        {
	        	request.setAttribute("error", "验证码错误！");
				return "/login";
	        }else
	        {
				// 想要得到Subject对象,访问地址必须在shiro的拦截地址内,不然会报空指针
				Subject subject = SecurityUtils.getSubject();
				token = new UsernamePasswordToken(accountName, password);
				//token.setRememberMe(rememberMe);
				subject.login(token);
				if (subject.isAuthenticated()) {
					LoginInfoEntity loginInfo = new LoginInfoEntity();
					Session session = SecurityUtils.getSubject().getSession();
					loginInfo.setUserId(Integer.valueOf(session.getAttribute("userSessionId").toString()));
					loginInfo.setAccountName(accountName);
					loginInfo.setLoginIp(session.getHost());
					loginInfoService.log(loginInfo);
					request.removeAttribute("error");
				} else {
					token.clear();
					request.setAttribute("error", "用户名或密码不正确！");
					return "/login";
				}
	        }
		}catch (UnknownAccountException uae)
		{
			token.clear();
			request.setAttribute("error", "账户不存在！");
			return "/login";
		}
		catch (IncorrectCredentialsException ice)
		{
			token.clear();
			request.setAttribute("error", "密码错误！");
			return "/login";
		}catch (LockedAccountException e) {
			token.clear();
			request.setAttribute("error", "您的账户已被锁定,请与管理员联系或10分钟后重试！");
			return "/login";
		} catch (ExcessiveAttemptsException e) {
			token.clear();
			request.setAttribute("error", "您连续输错5次,帐号将被锁定10分钟!");
			return "/login";
		}catch(ExpiredCredentialsException eca)
		{
			token.clear();
			request.setAttribute("error", "账户凭证过期！");
			return "/login";
		}catch (AuthenticationException e) {
			token.clear();
			request.setAttribute("error", "账户验证失败！");
			return "/login";
		}catch (Exception e)
		{
			token.clear();
			request.setAttribute("error", "登录异常，请联系管理员！");
			return "/login";
		}
		return "redirect:/index.html";
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "index.html", method = RequestMethod.GET)
	public String index(Model model) {
		try
		{
			// 获取登录的bean
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			UserEntity userEntity = (UserEntity)request.getSession().getAttribute("userSession");
			List<ResourceEntity> list = resourceService.findResourcesMenuByUserId(userEntity.getId().intValue());
			List<ResourceEntity> treeList = new TreeUtil().getChildResourceEntitys(list, null);
			model.addAttribute("list", treeList);
			model.addAttribute("menu", JSON.toJSONString(treeList));
			// 登陆的信息回传页面
			model.addAttribute("userEntity", userEntity);
			return "/index";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	
	/**
	 * 用户注册
	 * 
	 * @param userEntity
	 * @return
	 */
	@RequestMapping(value = "register.html", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String register(UserEntity userEntity) {
		try {
			String password = userEntity.getPassword();
			// 加密用户输入的密码，得到密码和加密盐，保存到数据库
			UserEntity user = EndecryptUtils.md5Password(userEntity.getAccountName(), userEntity.getPassword(), 2);
			//设置添加用户的密码和加密盐
			userEntity.setPassword(user.getPassword());
			userEntity.setCredentialsSalt(user.getCredentialsSalt());
			//设置创建者姓名
			userEntity.setCreatorName(userEntity.getUserName());
			userEntity.setCreateTime(new Date());
			//设置锁定状态：未锁定；删除状态：未删除
			userEntity.setLocked(0);
			userEntity.setDeleteStatus(0);
			//通过注册页面注册的用户统一设置为普通用户
			RoleEntity roleEntity = roleService.findByName("普通用户");
			userEntity.setRole(roleEntity);
			// 保存用户注册信息
			userService.insert(userEntity, password);
			return "login";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
		
	}
	

	/**
	 * 用户退出
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout.html", method = RequestMethod.GET)
	public String logout() {
		// 使用权限管理工具进行用户的退出，注销登录
		SecurityUtils.getSubject().logout(); // session
		return "redirect:login.html";
	}
	
	
	@RequestMapping(value = "captcha.html", method = RequestMethod.GET)
    public void kaptcha(HttpServletRequest req, HttpServletResponse rsp) {
		ServletOutputStream out = null;
		try {
	        HttpSession session = req.getSession();
	        rsp.setDateHeader("Expires", 0);
	        rsp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	        rsp.addHeader("Cache-Control", "post-check=0, pre-check=0");
	        rsp.setHeader("Pragma", "no-cache");
	        rsp.setContentType("image/jpeg");
	
	        String capText = captchaProducer.createText();
	        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
	
	        BufferedImage image = captchaProducer.createImage(capText);
	        out = rsp.getOutputStream();
	        ImageIO.write(image, "jpg", out);
	        out.flush();
        }catch(IOException e)
		{
			throw new SystemException(e);
		} finally {
            try {
				out.close();
			} catch (IOException e) {
				throw new SystemException(e);
			}
        }
    }
	

}
