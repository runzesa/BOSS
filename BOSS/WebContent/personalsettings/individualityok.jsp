<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@ page import="com.genius.portal.style.*"%>
<%
	String info;
	boolean update = false;
	String css = "";
	if (session.getAttribute("login") == null
		|| (!session.getAttribute("login").equals("true"))) {
		info = "系统已超时，请重新登陆！";
		css = "Gp_blue.css";
	} else {
		css = session.getAttribute("style").toString();
		String cssName = request.getParameter("cssName");
		Style style = new Style();
		if (cssName != null) {
			if(cssName.trim().equals(""))cssName="default/fresh";
			if (style.insert(session.getAttribute("userId").toString(),cssName)) {
				info = "个性设置成功，重新登录即可应用新的样式！";
				update = true;
			} else {
				info = "设置错误，请重新设置！";
			}
		} else {
			info = "您未进行个性选择，请重新设置！";
		}
	}
%>
<%=update+"#"+info%>