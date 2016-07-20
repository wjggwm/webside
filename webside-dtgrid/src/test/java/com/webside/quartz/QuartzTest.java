package com.webside.quartz;


import java.util.Date;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.webside.quartz.model.ScheduleJobEntity;
import com.webside.quartz.service.ScheduleJobService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-applicationContext.xml")
public class QuartzTest {
	

	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@Test
	public void testAddJob()
	{
		ScheduleJobEntity job = new ScheduleJobEntity();
		job.setJobName("test");
		job.setJobGroup("test");
		job.setCronExpression("*/5 * * * * ?");
		job.setJobClassName("com.webside.quartz.job.EmailJob");
		//java 8 实现方式
		//LocalDate localDate = LocalDate.parse("2016-07-16 15:23:43",DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		//Date date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
		//joda实现方式
		LocalDate localDate = LocalDate.parse("2016-07-16 15:23:43", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"));
		Date date = localDate.toDate();
		job.setStartDate(date);
		job.setEndDate(localDate.plusDays(10).toDate());
		scheduleJobService.addJob(job);
		
	}

	
	@Test
	public void testGetPlanJobList()
	{
		List<ScheduleJobEntity> jobList = scheduleJobService.getPlanJobList();
		for (ScheduleJobEntity scheduleJobEntity : jobList) {
			System.out.println(scheduleJobEntity.getJobName());
		}
		
	}
	
	@Test
	public void testGetRunningJobList()
	{
		List<ScheduleJobEntity> jobList = scheduleJobService.getRunningJobList();
		for (ScheduleJobEntity scheduleJobEntity : jobList) {
			System.out.println(scheduleJobEntity.getJobName());
		}
	}
}
