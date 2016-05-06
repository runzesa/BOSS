<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.genius.adminmanager.power.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据添加</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
<!--
function submit(){
	document.form1.action="powerinsert.do";
	document.form1.submit();
}
function openwindow(link){
	window.open(link,'operate','status=yes,width=400,height=600') 
}
function selectSid(){
	for(var  i=0;i<document.form1.sidtype.length;i++){   
    	if  (document.form1.sidtype[i].checked){   
        	if(document.form1.sidtype[i].value=='0'){
				window.open('../userinfo/userstree.jsp?formname=form1&nameinput=sidname&idinput=sid','usertree','scrollbars=yes,status=yes,width=400,height=600'); 
			}else{
				window.open('../department/departmentstree.jsp?formname=form1&nameinput=sidname&idinput=sid','departmenttree','scrollbars=yes,status=yes,width=400,height=600'); 
			}
         }  
     }
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="powerinsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="24" colspan="11" bgcolor="#DFEBF0">
			<div align="center">数据录入</div>
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">角色:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="rolename">
			<%
					{
					String roleId = request.getAttribute("roleId").toString();
					ArrayList list = (ArrayList) request
					.getAttribute("rolenameList");
					Iterator it = list.iterator();
					while (it.hasNext()) {
						RolenameActionBean bean = (RolenameActionBean) it.next();
			%>
			<option value="<%=bean.getId()%>"
				<%if(bean.getId().equals(roleId)){out.print("selected");}%>><%=bean.getName()%>
			</option>
			<%
					}
				}
			%>
		</select></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">判断方法:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input name="sidtype" type=radio  value="0" checked />用户<input name="sidtype" type=radio  value="1" />部门
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">操作:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="text" name="operatename" size="80" />
			<input type="hidden" name="operateid" /> <input type="button"	name="nameselect" value="选择"
			onclick="openwindow('../operate/operatestree.jsp?formname=form1&nameinput=operatename&idinput=operateid')" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">权限范围:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="datatype">
			<logic:iterate id="datatype" name="datatypeList">
				<%
					ArrayList typeList = (ArrayList)request.getAttribute("datatypeList");
					Iterator it1 = typeList.iterator();
					while (it1.hasNext()) {
						DatatypeActionBean dataTypeBean = (DatatypeActionBean)it1.next();
				%>
				<option value="<%=dataTypeBean.getType() %>"><%=dataTypeBean.getRemark()%></option>
			</logic:iterate>
			<%
			}
			%>
		</select></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">S_ID:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="sidname" size="80" /><input
			type="hidden" name="sid" /><input type="button"
			name="nameselect" value="选择" onclick="selectSid()" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">SQL:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<textarea name="sqlcontent" cols="80" rows="8"></textarea></td>
	</tr>

</table>
</form>
</div>
<p align="center">
	<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
</p>
		

</body>

</html>

