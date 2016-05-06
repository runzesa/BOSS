<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.genius.adminmanager.operate.*"%>
<%@ page import="com.genius.adminmanager.operate.actionbean.*"%>
<%@ page import="com.genius.adminmanager.role.*"%>
<%@ page import="com.genius.adminmanager.role.actionbean.*"%>
<%@ page import="com.genius.adminmanager.power.*"%>
<%@ page import="com.genius.adminmanager.power.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script language="JavaScript">
<!--
window.onload=pageLoad;
function pageLoad(){
	var key = "<%=request.getAttribute("selectinit")%>";
	var selectkey = key.split(";");
	for(i=0;i<selectkey.length-1;++i){
		var spo = selectkey[i].split(",");
		document.getElementsByName("r"+spo[0]+"o"+spo[1])[0].value = spo[2];
	}
}

function submit(){
	var selects = document.getElementsByTagName("select");
	var endselect = "";
	for(i=0;i<selects.length;++i){
		if(selects[i].name.indexOf("o")!=-1){
			endselect = endselect + selects[i].name + "d" + selects[i].value + ",";
		}
	}
	document.form1.action="operatepower.do?opt="+endselect;
	document.form1.submit();
}

function selectchange(selectname){
	var selects = document.getElementsByTagName("select");
	var svalue = document.getElementsByName(selectname)[0].value;
	for(i=0;i<selects.length;++i){
		var sname = selects[i].name;
		var sname2 = sname.substring(0,sname.indexOf("o"));
		if(selectname == sname2 ){
			selects[i].value=svalue;
		}	
	}
}
-->
</script>
<base target="_self" />
</head>
<%
	ArrayList operateList = new ArrayList();
	Operate operate = new Operate();
	operateList = operate.selectOperateById(request.getParameter("moduleid").toString());
	int operateLen = operateList.size();
	
	ArrayList roleList = new ArrayList();
	Role role = new Role();
	roleList = role.selectAll();
	int roleLen = roleList.size();
	
	ArrayList datatypeList = new ArrayList();
	Power datatype = new Power();
	datatypeList = datatype.datatypeSelect();
%>
<body class="right_date_body">
<div class="bmgl_div">
	<form method="post" action="" name="form1">
		<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<input type="hidden" id="moduleid" name="moduleid" value="<%=request.getParameter("moduleid") %>" />
				<td height="24" colspan="<%=operateLen+2 %>" bgcolor="#DFEBF0"><div align="center">权限管理</div></td>
			</tr>
			<tr style="background:#efefef repeat-x;font-weight:bold;" height="25">
				<td><div align="center">角色</div></td>
				<td><div align="center">操作</div></td>
	<%
			Iterator it = operateList.iterator();
			while(it.hasNext()){
				OperateSelectActionBean operateBean = (OperateSelectActionBean)it.next();
	%>
				<td><div align="center"><%=operateBean.getName() %></div></td>
	<%} %>
			</tr>
	
	<%
			for(int roles = 0;roles<roleLen;++roles){
				RoleSelectActionBean roleBean = (RoleSelectActionBean)roleList.get(roles);
				%>
				<tr align="center"  height="25">
					<td width="150" height="25" bgcolor="#FFFFFF"><%=roleBean.getName() %></td>
					<td height="25" bgcolor="#FFFFFF">
					<select name="r<%=roleBean.getId() %>" style="width:150px" onchange='selectchange("r"+<%=roleBean.getId() %>)' value="角色权限">
						<option value="-1">选择角色权限</option>
						<option value="-1">无权限</option>
					<%
						Iterator datatypeIt = datatypeList.iterator();
				
						while(datatypeIt.hasNext()){
							DatatypeActionBean datatypeBean = (DatatypeActionBean)datatypeIt.next();
					%>	
							<option value="<%=datatypeBean.getType() %>"><%=datatypeBean.getRemark() %></option>
					<%} %>
						</select></td>
				<%
					for(int operates = 0;operates<operateLen;++operates){
						OperateSelectActionBean operateBean = (OperateSelectActionBean)operateList.get(operates);
						%>
						
							<td height="25" bgcolor="#FFFFFF"><select name="r<%=roleBean.getId()%>o<%=operateBean.getId()%>" style="width:150px">
								<option value="-1">无权限</option>
						<%
							Iterator datatypeIt2 = datatypeList.iterator();
				
							while(datatypeIt2.hasNext()){
								DatatypeActionBean datatypeBean = (DatatypeActionBean)datatypeIt2.next();
						%>
								<option value="<%=datatypeBean.getType() %>"><%=datatypeBean.getRemark() %></option>
						<%} %>
							</select></td>
				<%
					}
				%></tr>  <%
			}
	%>
	</table>
</form>
	</div>
	<p align="center">
		<a href="#" onClick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
		<a href="#" onClick="javascript:history.go(-1)"><img border="0"	src="../images/button_b_fh.gif" width="77" height="21" /></a>
	</p>		
</body>
</html>