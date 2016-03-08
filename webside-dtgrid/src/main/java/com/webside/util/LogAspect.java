package com.webside.util;

import java.lang.reflect.Method;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.webside.loginfo.model.LogInfoEntity;
import com.webside.loginfo.service.LogInfoService;

/**
 * 
 * 前置通知（@Before）：在某连接点（join point）之前执行的通知，但这个通知不能阻止连接点前的执行（除非它抛出一个异常）
 * 返回后通知（@AfterReturning）：在某连接点（join point）正常完成后执行的通知：例如，一个方法没有抛出任何异常，正常返回
 * 抛出异常后通知（@AfterThrowing）：方法抛出异常退出时执行的通知
 * 后通知（@After）：当某连接点退出的时候执行的通知（不论是正常返回还是异常退出） 环绕通知（@Around）：包围一个连接点（join
 * point）的通知，如方法调用。这是最强大的一种通知类型，环绕通知可以在方法调用前后完成自定义的行为，
 * 它也会选择是否继续执行连接点或直接返回它们自己的返回值或抛出异常来结束执行
 * 
 * <p>
 * Description: 日志记录，添加、删除、修改方法AOP
 * </p>
 * <p>
 * Company: 静之殇工作室
 * </p>
 * 
 * @author wjggwm
 * @date 2016年3月6日 下午11:40:26
 */
@Component
@Aspect
public class LogAspect {

	@Autowired
	private LogInfoService logService;// 日志记录Service

	/**
	 * 添加业务逻辑方法切入点 定义在controller包里的以add为前缀的方法的执行
	 */
	@Pointcut("execution(* com.webside.*.controller.*.add(..))")
	public void insertServiceCall() {
	}

	/**
	 * 修改业务逻辑方法切入点 定义在controller包里的以update为前缀的方法的执行
	 */
	@Pointcut("execution(* com.webside.*.controller.*.update(..)) "
			+ "|| execution(* com.webside.*.controller.*.resetPassword(..)) "
			+ "|| execution(* com.webside.*.controller.*.info(..)) "
			+ "|| execution(* com.webside.*.controller.*.password(..))")
	public void updateServiceCall() {
	}

	/**
	 * 删除业务逻辑方法切入点 定义在controller包里以delete为前缀的方法的执行
	 */
	@Pointcut("execution(* com.webside.*.controller.*.delete*(..))")
	public void deleteServiceCall() {
	}
	
	/**
	 * 删除业务逻辑方法切入点 定义在controller包里以delete为前缀的方法的执行
	 */
	@Pointcut("execution(* com.webside.*.controller.*.permission(..))")
	public void permissionServiceCall() {
	}

	/**
	 * 管理员添加操作日志(后置通知)
	 * 
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
	@AfterReturning(value = "insertServiceCall()", argNames = "rtv", returning = "rtv")
	public void insertServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {
		// 获取登录管理员id
		Long adminUserId = Common.getloginUserId();
		if (adminUserId == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		// 创建日志对象
		LogInfoEntity log = new LogInfoEntity();
		log.setUserId(adminUserId);// 设置管理员id
		log.setAccountName(Common.getloginUserAccountName());
		log.setCreateTime(new Date());// 操作时间
		log.setContent(opContent);// 操作内容
		log.setOperation("insert");// 操作

		logService.log(log);// 添加日志
	}

	/**
	 * 管理员修改操作日志(后置通知)
	 * 
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
	@AfterReturning(value = "updateServiceCall()", argNames = "rtv", returning = "rtv")
	public void updateServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {
		// 获取登录管理员id
		Long adminUserId = Common.getloginUserId();
		if (adminUserId == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		// 创建日志对象
		LogInfoEntity log = new LogInfoEntity();
		log.setUserId(adminUserId);// 设置管理员id
		log.setAccountName(Common.getloginUserAccountName());
		log.setCreateTime(new Date());// 操作时间
		log.setContent(opContent);// 操作内容
		log.setOperation("update");// 操作

		logService.log(log);// 添加日志
	}

	/**
	 * 管理员删除操作日志(后置通知)
	 * 
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
	@AfterReturning(value = "deleteServiceCall()", argNames = "rtv", returning = "rtv")
	public void deleteServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		StringBuffer rs = new StringBuffer();
		rs.append(methodName);
		String className = null;
		for (Object info : joinPoint.getArgs()) {
			// 获取对象类型
			className = info.getClass().getName();
			className = className.substring(className.lastIndexOf(".") + 1);
			rs.append("[参数1，类型:" + className + "，值:(id:"
					+ joinPoint.getArgs()[0] + ")");
		}
		// 创建日志对象
		LogInfoEntity log = new LogInfoEntity();
		log.setUserId(Common.getloginUserId());// 用户编号
		log.setAccountName(Common.getloginUserAccountName());
		log.setCreateTime(new Date());// 操作时间
		log.setContent(rs.toString());// 操作内容
		log.setOperation("delete");// 操作

		logService.log(log);// 添加日志
	}

	/**
	 * 管理员授权操作日志(后置通知)
	 * 
	 * @param joinPoint
	 * @param rtv
	 * @throws Throwable
	 */
	@AfterReturning(value = "permissionServiceCall()", argNames = "rtv", returning = "rtv")
	public void permissionServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {
		// 获取登录管理员id
		Long adminUserId = Common.getloginUserId();
		if (adminUserId == null) {// 没有管理员登录
			return;
		}
		// 判断参数
		if (joinPoint.getArgs() == null) {// 没有参数
			return;
		}
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 获取操作内容
		String opContent = adminOptionContent(joinPoint.getArgs(), methodName);
		// 创建日志对象
		LogInfoEntity log = new LogInfoEntity();
		log.setUserId(adminUserId);// 设置管理员id
		log.setAccountName(Common.getloginUserAccountName());
		log.setCreateTime(new Date());// 操作时间
		log.setContent(opContent);// 操作内容
		log.setOperation("permission");// 操作

		logService.log(log);// 添加日志
	}

	
	/**
	 * 使用Java反射来获取被拦截方法(insert、update)的参数值， 将参数值拼接为操作内容
	 */
	public String adminOptionContent(Object[] args, String mName)
			throws Exception {
		if (args == null) {
			return null;
		}
		StringBuffer rs = new StringBuffer();
		rs.append(mName);
		String className = null;
		int index = 1;
		// 遍历参数对象
		for (Object info : args) {
			// 获取对象类型
			className = info.getClass().getName();
			className = className.substring(className.lastIndexOf(".") + 1);
			rs.append("[参数" + index + "，类型：" + className + "，值：");
			// 获取对象的所有方法
			Method[] methods = info.getClass().getDeclaredMethods();
			// 遍历方法，判断get方法
			for (Method method : methods) {
				String methodName = method.getName();
				// 判断是不是get方法
				if (methodName.indexOf("get") == -1) {// 不是get方法
					continue;// 不处理
				}
				Object rsValue = null;
				try {
					// 调用get方法，获取返回值
					rsValue = method.invoke(info);
					if (rsValue == null) {// 没有返回值
						continue;
					}
				} catch (Exception e) {
					continue;
				}
				// 将值加入内容中
				rs.append("(" + methodName + " : " + rsValue + ")");
			}
			rs.append("]");
			index++;
		}
		return rs.toString();
	}
}
