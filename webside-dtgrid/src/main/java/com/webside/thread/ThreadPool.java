package com.webside.thread;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

public class ThreadPool {
	
	private static Logger logger = Logger.getLogger(ThreadPool.class.getSimpleName());
	
	/**
     * 最小执行任务数
     */
    private static int WORK_MIN = 3;
    /**
     * 最大执行任务数
     */
    private static int WORK_MAX = 20;
    /**
     * 空闲进程等待新任务的时间
     */
    private static final int KEEP_ALIVE_TIME = 60;
    /**
     * 任务执行间隔时间
     */
    public static final long SLEEP_TIME = 200;
    /**
     * 其他线程池被阻塞，转移到此继续
     */
    private static RejectedExecutionHandler mRejectedExecutionHandler = new RejectedExecutionHandler() {
        @Override
        public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
            if (!executor.isShutdown()) {
                mRejectedThreadPoolExecutor.execute(r);
            }
        }
    };
    
    /**
     * 工作的队列
     */
    private static BlockingQueue<Runnable> mWorkQueue = new ArrayBlockingQueue<Runnable>(3);
    /**
     * 阻塞任务的队列
     */
    private static BlockingQueue<Runnable> mRejectedWorkQueue = new LinkedBlockingQueue<Runnable>();
    /**
     * 默认线程池
     */
    public static ThreadPoolExecutor mThreadPoolExecutor = new ThreadPoolExecutor(WORK_MIN,
    		WORK_MAX, KEEP_ALIVE_TIME, TimeUnit.SECONDS, mWorkQueue,
            mRejectedExecutionHandler);
    /**
     * 阻塞执行的线程池
     */
    private static ThreadPoolExecutor mRejectedThreadPoolExecutor = new ThreadPoolExecutor(
            0, 1, KEEP_ALIVE_TIME, TimeUnit.SECONDS, mRejectedWorkQueue,
            new ThreadPoolExecutor.CallerRunsPolicy());

    /**
     * 添加任务到线程池
     * @param runnable
     */
    public static void start(Runnable runnable)
    {
    	try
    	{
    		mThreadPoolExecutor.execute(runnable);
    	}catch(RejectedExecutionException e)
    	{
    		logger.error(e.getMessage());
    	}catch(NullPointerException e)
    	{
    		logger.error("任务为null："+runnable);
    	}
    }
    
    /**
     * 释放
     */
    public static void destroy() {
        mThreadPoolExecutor.shutdown();
        mRejectedThreadPoolExecutor.shutdown();
    }
    
    
    public static void main(String[] args) {
		/*
		 * 使用方法：
		 * WorkerItem可以是一个需要添加到线程中执行的任务
		 */
    	WorkerItem runnable = new WorkerItem();
		start(runnable);
		
		destroy();
	}
    
    
}
