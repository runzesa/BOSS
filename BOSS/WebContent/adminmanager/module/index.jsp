<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.module.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ģ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
		<li class="new"><a href="moduleinsertselect.do">���</a></li>
		<li class="del"><a href="javascript:document.form1.submit()">ɾ��</a></li>
	</ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post" action="moduledelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
                <td height="25"><div align="center">ѡ��</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">����</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
				<td><div align="center">�༭</div></td>
			</tr>
			<%
				int flag = 0;
				ArrayList mylist = (ArrayList) request.getAttribute("moduleList");
				Iterator it = mylist.iterator();
				while (it.hasNext()) {
					ModuleSelectActionBean bean = (ModuleSelectActionBean) it
					.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#F2F9FD" >
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><a href="../operate/select.do?moduleid=<%=bean.getId() %>"><%=bean.getName()%></a></div></td>
				<td><div align="center"><a href="moduleupdateselect.do?updateid=<%=bean.getId() %>">�༭</a></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><a href="../operate/select.do?moduleid=<%=bean.getId() %>"><%=bean.getName()%></a></div></td>
				<td><div align="center"><a href="moduleupdateselect.do?updateid=<%=bean.getId() %>">�༭</a></div></td>
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

