package com.webside.util;

import java.text.ParseException;
import java.util.Date;
import java.util.Locale;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.springframework.format.Formatter;

/**
 * 
 * @ClassName: DateFormatterUtil
 * @Description: springmvc日期转换器,springmvc默认只接收String类型，日期类型的需要自定义转换器
 * @author gaogang
 * @date 2016年7月12日 下午4:40:44
 *
 */
public class DateFormatterUtil implements Formatter<Date>{

	@Override
	public String print(Date object, Locale locale) {
		return null;
	}

	/**
	 * 使用joda替代jdk自带的日期格式化类，因为 DateFormat 和 SimpleDateFormat 类不都是线程安全的
	 * 确保不会在多线程状态下使用同一个 DateFormat 或者 SimpleDateFormat 实例
	 * 如果多线程情况下需要访问同一个实例，那么请用同步方法
	 * 可以使用 joda-time 日期时间处理库来避免这些问题，如果使用java 8, 请切换到 java.time包
	 * 你也可以使用 commons-lang 包中的 FastDateFormat 工具类
	 * 另外你也可以使用 ThreadLocal 来处理这个问题
	 */
	@Override
	public Date parse(String text, Locale locale) throws ParseException {
		Date date = null;
		LocalDate localDate = null;
		try {
			localDate = LocalDate.parse(text, DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"));
			date = localDate.toDate();
		} catch (Exception e) {
			localDate = LocalDate.parse(text, DateTimeFormat.forPattern("yyyy-MM-dd"));
			date = localDate.toDate();
		}
		return date;
	}

}
