/*
 * �������� 2005-7-20
 *
 * TODO
 * ����з���
 * 
 */
package com.genius.search.search.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.genius.search.search.TypeForm;

/**
 * @author yangy
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TypeListAction implements Controller {
	

	/* ���� Javadoc��
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse arg3) throws ServletException, IOException {	
		// TODO �Զ����ɷ������
		String currentPage=arg2.getParameter("currentPage");//��ǰҳ����
        TypeForm form=new TypeForm();
        ArrayList list=new ArrayList();
        int userid=0;
        userid = Integer.parseInt(arg2.getAttribute("userId").toString());

			if (userid == 0) {
				arg3.sendRedirect("../login.jsp");
				return null;
				
			}				
				//int deptid=((UserBean)new UserBeanFactory().getBean(userid)).getDeptid();
				int power=1;
				list = form.list();
//				arg2.setAttribute("toolbar",p.getToolBar("searchtypelistaction.do?1=1"));
				arg2.setAttribute("list",list);
				

		return new ModelAndView("../search/typelist.jsp");
	}
}
