package com.webside.thread;

import java.io.Serializable;

import org.apache.log4j.Logger;

public class WorkerItem implements Runnable, Serializable {

	Logger logger = Logger.getLogger(WorkerItem.class.getSimpleName());
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 执行任务
	 */
	@Override
	public void run() {
		try {
			Thread.sleep(ThreadPool.SLEEP_TIME);
			System.out.print("任务执行了");
		} catch (InterruptedException e) {
			logger.error(e);
		}
		
	}

}
