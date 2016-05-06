<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.power_new.actionbean.*"%>
<%@ page import="com.genius.adminmanager.power_new.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>角色管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<script src="index2.js" type="text/javascript"></script>
<script src="../../js/connectionpool.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
function loadPage(){
	document.getElementById("rolename").value = getPra("roleid");
}
</script>
<base target="_self" />
</head>
<body class="right_date_body" onload="loadPage()">
<div class="bmgl_div">
<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr bgcolor="#FFFFFF">
		<td width="380px" valign="top" style="padding: 2px;">
			<iframe src="select.do?act=powerList" frameborder="0" height="500px" marginheight="0" marginwidth="0" width="100%">
			</iframe>
		</td>
		
		<td valign=top class="right_date_body" style="padding: 2px;" >
		<form method="post" action="powerinsert.do">
			<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
				<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
					<td height="24" colspan="11" bgcolor="#DFEBF0">
						<div align="center" id="title">请选择模块</div>
						<input type="hidden" id="rolename" name="rolename"/>
						<input type="hidden" id="operateids" name="operateids"/>
					</td>
				</tr>
				
				<tbody id="action" style="display:none">
					<tr>
						<td height="25" bgcolor="#FFFFFF"><div align="right">操作权限:&nbsp;</div></td>
						<td bgcolor="#FFFFFF" width="80%">
							<table width="100%" border=0>
								<tbody id="nodes"></tbody>
							</table>
							<div id="hiddens" style="display:none"></div>
						</td>
					</tr>
				</tbody>
				<tbody id="select" style="display:none">
					<tr>
						<td height="25" bgcolor="#FFFFFF"><div align="right">权限范围:&nbsp;</div></td>
						<td bgcolor="#FFFFFF">&nbsp;<select name="datatype" id="datatype">
						<%
							Power_newExt power = new Power_newExt();
							ArrayList<?> typeList = power.datatypeSelect();
							Iterator<?> it1 = typeList.iterator();
							int i=0;
							while (it1.hasNext()) {
								DatatypeActionBean dataTypeBean = (DatatypeActionBean) it1.next();
						%>
							<option value="<%=dataTypeBean.getType() %>" <%=i==0?"selected":""%>><%=dataTypeBean.getRemark()%></option>
						<%
								i=1;
							}
						%>
							</select>
						</td>
					</tr>
					<tr>
						<td height="25" bgcolor="#FFFFFF"><div align="right">S_ID:&nbsp;</div></td>
						<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="sid" id="sid" style="width:200px" /></td>
					</tr>
					<tr>
						<td height="25" bgcolor="#FFFFFF"><div align="right">SQL:&nbsp;</div></td>
						<td bgcolor="#FFFFFF">&nbsp;<textarea name="sqlcontent" id="sqlcontent" style="width:95%" rows="8" ></textarea></td>
					</tr>
				</tbody>
			</table>
			
			<p align="center" id="subbutton" style="display:none">
				<a href="javascript:void(0)" onclick="sub()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
			</p>
		</form>

		</td>
	</tr>
</table>
</div>
</body>
</html>

