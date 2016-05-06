<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="com.genius.adminmanager.dataanalysis.actionbean.RoleActionBean"%>
<%@page import="java.util.ArrayList"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据添加</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<%@include file="../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="role_dataanalysis.js"></script>
<script type="text/javascript">
<%
	List list2 = (ArrayList)request.getAttribute("styles");
	
	RoleActionBean roleBean = (RoleActionBean)request.getAttribute("roleBean");
	ArrayList titleList = (ArrayList)request.getAttribute("titleList");
	ArrayList dataAList = (ArrayList)request.getAttribute("dataAList");

%>
var style="<%=roleBean.getStyle()%>";
</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="changeTitle()">
<div class="bmgl_div">
<form method="post" action="datainsert.do?act=role&roleid=<%=request.getParameter("roleid")%>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">数据录入</div></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">标签列表:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="titleList" id="titleList" onchange="changeTitle(this)">
			<option value="-1">首页</option>
			<%
			for(int i=0;i<titleList.size();i++){
				RoleActionBean bean = (RoleActionBean)titleList.get(i);
				out.println("<option value=\""+bean.getId()+"\">"+bean.getName()+"</option>");
			}
			%></select>
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">默认模块:&nbsp;</div></td>
		<td bgcolor="#FFFFFF" valign="top"><table width=600px>
			<%
				String table = "";
				int tr = 0;
				for(int i=0;i<dataAList.size();i++){
					RoleActionBean bean = (RoleActionBean)dataAList.get(i);
					String id = bean.getId();
					String name = bean.getName();
					String checkbox = "<input type=checkbox value=\""+id+"\" name='datacheckbox' onclick='check1(this)'/>&nbsp;"+name;			
					if(tr==0)
						table+="<tr>";
					table+="<td >"+checkbox+"</td>";
					tr++;
					if(tr==5){
						table+="</tr>";
						tr=0;
					}
				}
			out.println(table);
			
			%>
		</table>
		<input type="hidden" name="style" id="style" style="width:700px" value=""/>
		</td>
	</tr>
</table>
</form>
</div>


<p align="center"> 
	<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
</p>
</body>

</html>

