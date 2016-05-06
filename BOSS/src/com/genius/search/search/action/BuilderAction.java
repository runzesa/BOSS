/*
 *
 *
 * TODO
 * 天成研发部 
 * 
 */
package com.genius.search.search.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.Builder;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public final class BuilderAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Builder builder = new Builder();
		List list = builder.list();
		request.setAttribute("tablelist",list);
		return new ModelAndView("../search/builder.jsp");
	}
}
