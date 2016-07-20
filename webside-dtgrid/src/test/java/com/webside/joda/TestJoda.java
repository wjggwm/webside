package com.webside.joda;

import java.util.Date;
import java.util.Locale;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.junit.Test;

public class TestJoda {

	@Test
	public void testJoda()
	{
		DateTimeFormatter format = DateTimeFormat .forPattern("yyyy-MM-dd HH:mm:ss");    
        //时间解析      
        DateTime dateTime2 = DateTime.parse("2012-12-21 23:22:45", format);      
              
        //时间格式化，输出==> 2012/12/21 23:22:45 Fri      
        String string_u = dateTime2.toString("yyyy/MM/dd HH:mm:ss EE");      
        System.out.println(string_u);      
              
        //格式化带Locale，输出==> 2012年12月21日 23:22:45 星期五      
        String string_c = dateTime2.toString("yyyy年MM月dd日 HH:mm:ss EE",Locale.CHINESE);      
        System.out.println(string_c);    
        
        LocalDate date = LocalDate.parse("2012-12-21 23:22:45", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"));
        Date dates = date.toDate();
        System.out.println(dates);
             
	}
}
