<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page import="com.genius.adminmanager.role.actionbean.*" %>
<%@ page import="com.genius.adminmanager.power_new.actionbean.*" %>
<%@ page import="com.genius.adminmanager.power_new.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.genius.adminmanager.left.actionbean.UserLeftBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<%@include file="../../jspheader/jquery_header.jsp" %>
<script src="../../js/connectionpool_jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="menutree_role.js"></script>
<script type="text/javascript" language="javascript">
</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="getTopLinks()">
<div class="bmgl_div">
<form method="post" action="" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
<tr bgcolor="#FFFFFF">
	<td width="420px" valign="top">
		<table width="100%" style="height:100%;background-color:#f4f8fc;">
			<tr bgcolor="#FFFFFF">
				<td>
				<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
					<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
						<td height="24" colspan="11" bgcolor="#DFEBF0">
							<div align="center">主菜单列表</div>
						</td>
					</tr>
					<tbody id="toplinks">
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>
					<iframe frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="350px"
						src="menutree.jsp">
					</iframe>
				</td>
			</tr>
		</table>
	</td>
	<td valign="top" valign="top" style="padding: 2px;" >
			<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
				<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
					<td height="24" colspan="11" bgcolor="#DFEBF0">
						<div align="center" id="title">请选择菜单</div>
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
							while (it1.hasNext()) {
								DatatypeActionBean dataTypeBean = (DatatypeActionBean) it1.next();
						%>
							<option value="<%=dataTypeBean.getType() %>" selected="selected"><%=dataTypeBean.getRemark()%></option>
						<%
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
				<a href="javascript:void(0)" onclick="sub2()">
					<img border="0" src="../images/button_b_bc.gif" width="77" height="21" />
				</a>
			</p>
	</td>
</tr>
</table>
</form>
</div>
</body>

</html>

