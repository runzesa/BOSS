<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.userinfo.actionbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="yhgl_div">
<%	String bm_sign = "";
	String bm_statues = "";
	String department_id = (request.getAttribute("departmentId") == null ? "": request.getAttribute("departmentId").toString());
	String department_sign = (request.getParameter("sign") == null ? "": request.getParameter("sign").toString());
	String departmentId = (request.getAttribute("departmentId") == null ? ""
		: request.getAttribute("departmentId").toString());
	String departmentName = (request.getAttribute("departmentName") == null ? ""
		: request.getAttribute("departmentName").toString());
	if (departmentId == null || departmentId.length() <= 0) {
		departmentId = "0";
		departmentName = "根部门";
		department_sign = "-1";
	}
	if(department_sign.equals("0")){
		bm_sign = "启用本部门";
		bm_statues = "【<font color='red'>已注销</font>】";
		
	}else if(department_sign.equals("1")){
		bm_sign = "注销本部门";
		bm_statues = "【<font color='green'>正在使用</font>】";
	}
%> 您选择的部门是：<%=departmentName%><%=bm_statues %>&nbsp;&nbsp;
	<a href="../department/departmentinsertselect.do?departmentid=<%=departmentId %>">添加下级部门</a>&nbsp;|
<%
	if(request.getParameter("departmentid")==null || request.getParameter("departmentid").equals("") || request.getParameter("departmentid").equals("0")){
	}else{ 
%>
	&nbsp;<a href="../department/departmentupdateselect.do?departmentid=<%=departmentId %>">编辑本部门</a>&nbsp;|
	&nbsp;<a href="#" onclick="Sign()"><%=bm_sign %></a>&nbsp;|
<%	
	} 
%>
<script language="JavaScript">
	function Sign(){
		if(confirm("确定要执行此操作吗？")==1)
			ok();
	}
	function ok(){
		var url = "departmentSign.do?departmentid=<%=departmentId %>&sign=<%=department_sign %>";
		location.href=url;
	}
</script>

	<%if(department_sign.equals("0")){
	%>
	&nbsp;<a href="departmentdelete.do?departmentid=<%=departmentId %>">删除本部门</a>&nbsp;|
	<%	
	}else{
		
	}
	%>
	<%if(departmentId != "0"){ %>
	&nbsp;<a href="userinfoinsertselect.do?departmentid=<%=departmentId %>">添加所属用户</a>&nbsp;|
	<%} %>
	
	&nbsp;<a href="selectdelete.do">被停用的用户</a>
</div>
	<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
		<span id="search"></span>
	</form>
</div>

<div class="bmgl_div">
<form method="post" action="userinfodelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
	<td height="25"><div align="center"><a>选择</a></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=username&ordertype=<%=request.getAttribute("ordertype") %>">用户ID</a>
		<img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('username')" /></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">姓名</a>
		<img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=department_name&ordertype=<%=request.getAttribute("ordertype") %>">部门名称</a>
		<img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('department_name')" /></div></td>
	<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=role_name&ordertype=<%=request.getAttribute("ordertype") %>">角色名称</a>
		<img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('role_name')" /></div></td>
	<td><div align="center"><a>启用状态</a></div></td>
	<td><div align="center"><a>编辑</a></div></td>
</tr>
<%
	int flag = 0;
	ArrayList mylist = (ArrayList) request.getAttribute("userinfoList");
	Iterator it = mylist.iterator();
	while (it.hasNext()) {
		UserinfoSelectActionBean bean = (UserinfoSelectActionBean) it.next();
		String sign = "";
		String color = "";
		String title = "";
		String s = bean.getSign();
		if(s.equals("0")){
			sign = "已停用";
			color = "red";
			title = "点击启用用户";
		}else{
			sign = "已启用";
			color = "green";
			title = "点击停用用户";
		}
		if (flag == 1) {
%>
			<tr bgcolor="#FFFFFF">
			  <td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
			  <td><div align="center"><%=bean.getUsername()%></div></td>
			  <td><div align="center"><%=bean.getName()%></div></td>
			  <td><div align="center"><%=bean.getDepartmentname()%></div></td>
			  <td><div align="center"><%=bean.getRolename()%></div></td>
			  <td><div align="center"><a href="userinfosign.do?sign=<%=bean.getSign() %>&userId=<%=bean.getId() %>&department_id=<%=department_id %>" title="<%=title %>"><font color="<%=color %>"><%=sign %></font></a></div></td>
			  <td><div align="center"><a href="userinfoupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
		  </tr>
<%
			flag = 0;
		} else {
%>
		  <tr bgcolor="#FFFFFF">
			  <td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
			  <td><div align="center"><%=bean.getUsername()%></div></td>
			  <td><div align="center"><%=bean.getName()%></div></td>
			  <td><div align="center"><%=bean.getDepartmentname()%></div></td>
			  <td><div align="center"><%=bean.getRolename()%></div></td>
			  <td><div align="center"><a href="userinfosign.do?sign=<%=bean.getSign() %>&userId=<%=bean.getId() %>&department_id=<%=department_id %>" title="<%=title %>"><font color="<%=color %>"><%=sign %></font></a></div></td>
			  <td><div align="center"><a href="userinfoupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
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

