<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@ page import="com.genius.portal.style.*"%>
<%
	String info;
	boolean update = false;
	String css = "";
	if (session.getAttribute("login") == null
		|| (!session.getAttribute("login").equals("true"))) {
		info = "ϵͳ�ѳ�ʱ�������µ�½��";
		css = "Gp_blue.css";
	} else {
		css = session.getAttribute("style").toString();
		String cssName = request.getParameter("cssName");
		Style style = new Style();
		if (cssName != null) {
			if(cssName.trim().equals(""))cssName="default/fresh";
			if (style.insert(session.getAttribute("userId").toString(),cssName)) {
				info = "�������óɹ������µ�¼����Ӧ���µ���ʽ��";
				update = true;
			} else {
				info = "���ô������������ã�";
			}
		} else {
			info = "��δ���и���ѡ�����������ã�";
		}
	}
%>
<%=update+"#"+info%>