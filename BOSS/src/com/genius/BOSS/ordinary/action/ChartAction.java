/*
*Generated by GeniusPlatform. 2016-04-11 15:57:15
*/
package com.genius.BOSS.ordinary.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genius.data.PageDataConfig;
import org.genius.report.ChartEngine;
import org.genius.xml.ResponseXml;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public final class ChartAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		PrintWriter printWriter = response.getWriter();

		/*String[] rowKeys = { "power", "mobile", "govment","water"};
		String[] colKeys = { "2005", "2006", "2007" };
		double[][] data = { { 50, 20, 30 }, { 20, 10D, 40D},
				{ 40, 30.0008D, 38.24D } ,{40,70,90}};

		ChartEngine chart = new ChartEngine(ChartEngine.TYPE_BAR, "Data",
				"Year", "Sale", rowKeys, colKeys, data);*/
		
		ChartEngine chart=new ChartEngine(ChartEngine.TYPE_PIE3D,"Data");
		chart.setPieValue("power",2000);
		chart.setPieValue("mobile",3400);
		chart.setPieValue("govment",400);
		
		String fileName = chart.getChart(session, new PrintWriter(printWriter),
				500, 300);
		String imageUrl = request.getContextPath()
				+ "/servlet/DisplayChart?filename=" + fileName;

		//System.out.println(imageUrl);

		response.setContentType("text/xml;charset=GB2312");

		PrintWriter out = response.getWriter();
		out.println(imageUrl);

		return null;
	}
}
