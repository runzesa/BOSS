/*
 * @version  2008-5-30
 *
 * @author GuanHui
 * 
 * Copyright GuanHui . All rights reserved.
 * 
 */
package com.genius.util;

import java.io.IOException;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomTaskListener extends javax.servlet.http.HttpServlet
		implements ServletContextListener {
	static final long serialVersionUID = 1L;

	Timer timer = new Timer();

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {

		super.service(arg0, arg1);
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		
		System.out.println("定时任务执行已经初始化......");
		
		CustomTask customTask = new CustomTask();
		timer.schedule(customTask, 0, 10000);

	}

	public void contextDestroyed(ServletContextEvent arg0) {

		System.out.println("定时任务执行已经被销毁......");
		
		timer.cancel();
		
	}
}
