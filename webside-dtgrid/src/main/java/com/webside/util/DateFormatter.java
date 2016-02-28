package com.webside.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.format.Formatter;

/**
 * springmvc默认只接收String类型，日期类型的需要自定义转换器
 * <p>Description: springmvc日期转换器</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年2月19日 下午1:30:27
 */
public class DateFormatter implements Formatter<Date>{

	@Override
	public String print(Date object, Locale locale) {
		return null;
	}

	@Override
	public Date parse(String text, Locale locale) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = format.parse(text);
		} catch (Exception e) {
			format = new SimpleDateFormat("yyyy-MM-dd");
			date = format.parse(text);
		}
		return date;
	}

}
