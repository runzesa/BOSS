<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.userinfo.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�����</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="yhgl_div">
<%	
	String department_id = (request.getAttribute("departmentId") == null ? "": request.getAttribute("departmentId").toString());
	String department_sign = (request.getParameter("sign") == null ? "": request.getParameter("sign").toString());
	String departmentId = (request.getAttribute("departmentId") == null ? ""
		: request.getAttribute("departmentId").toString());
	String departmentName = (request.getAttribute("departmentName") == null ? ""
		: request.getAttribute("departmentName").toString());
	if (departmentId == null || departmentId.length() <= 0) {
		departmentId = "0";
		departmentName = "������";
		department_sign = "-1";
	}
%> �����ڵ�λ�ã���ͣ�õ��û�&nbsp;&nbsp;
	|&nbsp;<a href="javascript:document.form1.submit()">ɾ�������û�</a>&nbsp;|
	<a href="#" onclick="history.back()">����</a>&nbsp;
</div>
	<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
		<span id="search"></span>
	</form>
</div>

<div class="bmgl_div">
<form method="post" action="userinfodelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
	<td height="25"><div align="center"><a>ѡ��</a></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=username&ordertype=<%=request.getAttribute("ordertype") %>">�û�ID</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('username')" /></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">����</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=role_name&ordertype=<%=request.getAttribute("ordertype") %>">��ɫ����</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('role_name')" /></div></td>
	<td><div align="center"><a>����״̬</a></div></td>
</tr>
<%
	int flag = 0;
	ArrayList mylist = (ArrayList) request.getAttribute("userinfodeleteList");
	Iterator it = mylist.iterator();
	while (it.hasNext()) {
		UserinfoSelectActionBean bean = (UserinfoSelectActionBean) it.next();
		String sign = "";
		String color = "";
		String title = "";
		String s = bean.getSign();
		if(s.equals("0")){
			sign = "��ͣ��";
			color = "red";
			title = "��������û�";
		}else{
			sign = "������";
			color = "green";
			title = "���ͣ���û�";
		}
		if (flag == 1) {
%>
			<tr bgcolor="#FFFFFF">
			  <td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
			  <td><div align="center"><%=bean.getUsername()%></div></td>
			  <td><div align="center"><%=bean.getName()%></div></td>
			  <td><div align="center"><%=bean.getRolename()%></div></td>
			  <td><div align="center"><font color="<%=color %>"><%=sign %></font></div></td>
		  </tr>
<%
			flag = 0;
		} else {
%>
		  <tr bgcolor="#FFFFFF">
			  <td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
			  <td><div align="center"><%=bean.getUsername()%></div></td>
			  <td><div align="center"><%=bean.getName()%></div></td>
			  <td><div align="center"><%=bean.getRolename()%></div></td>
			  <td><div align="center"><font color="<%=color %>"><%=sign %></font></div></td>
		  </tr>
<%
			flag = 1;
		}
	}
%>
		</table>
  </form>
</div>
<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>
</body>

</html>

