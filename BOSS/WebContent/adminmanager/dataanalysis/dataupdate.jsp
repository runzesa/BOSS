<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.dataanalysis.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	DataAUpdateActionBean bean = (DataAUpdateActionBean) request.getAttribute("module");
	String showtype = "";
	if(bean!=null)showtype = bean.getShowtype();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool.js"></script>
<script type="text/javascript" src="update.js"></script>
<script language="JavaScript">

</script>
<base target="_self"/>
</head>

<body class="right_date_body" onload="load()">
<div class="bmgl_div">
<form method="post" action="dataupdate.do?tabid=<%=request.getParameter("tabid") %>" name="form1" >
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
    <td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">数据编辑</div></td>
  </tr>
  <input type="hidden" name="id" value="<%=bean.getId() %>" />
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" id="name" name="name" value="<%=bean.getName() %>" /></td>
	</tr>
	<tr id="moudlename" style="display:<%=showtype!=null&&showtype.startsWith("3")?"none":"" %>">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块地址:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="modelname2" disabled="disabled" value="<%=bean.getValue() %>"/>
			<input type="hidden" name="modelname" value="<%=bean.getModelName() %>"/>
		<!-- 	<input type=button value="选择" 
			onclick="window.open('../module/moduletree.jsp?formname=form1&nameinput=modelname2&idinput=modelname','moduletree','scrollbars=yes,status=yes,width=400,height=600'); "/>
		-->
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块类型:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype" value="1" onclick="data()" <%=showtype!=null&&showtype.equals("1")?"checked=checked":"" %>/>数据
			<input type="radio" name="showtype" value="2" onclick="chart()" <%=showtype!=null&&showtype.startsWith("2")?"checked=checked":"" %>/>图表
			<input type="radio" name="showtype" value="3" onclick="page()" <%=showtype!=null&&showtype.startsWith("3")?"checked=checked":"" %>/>页面
		</td>
	</tr>
	<tr id=chart style="display:<%=bean!=null&&bean.getShowtype()!=null&&bean.getShowtype().startsWith("2")?"":"none" %>">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">图表类型:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype2" value="1" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("1")?"checked=checked":"" %>/>饼图
			<input type="radio" name="showtype2" value="2" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("2")?"checked=checked":"" %>/>柱形图
			<input type="radio" name="showtype2" value="3" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("3")?"checked=checked":"" %>/>折线图
		</td>
	</tr>
	<tr id="row" style="display:<%=showtype!=null&&showtype.startsWith("3")?"none":"" %>">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">显示行数:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select id=rows name=rows>
		<%for(int i=4;i<=8;i++){ %>
			<option value='<%=i %>' <%=bean!=null&&bean.getRow()!=null&&bean.getRow().trim().equals(i+"")?"selected=selected":"" %>><%=i %></option>
		<%} %>
	</select>行
		</td>
	</tr>
	<tr id="fieldtr" style="display:<%=showtype!=null&&showtype.startsWith("3")?"none":"" %>">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">模块字段:&nbsp;</div>
			<input type="hidden" name="field" id="field"/>
		</td>
		<td bgcolor="#FFFFFF" id="fields">
			<%=bean.getFields() %>
		</td>
		<td id="fieldshiden" style="display:none;"><%=bean.getFieldsAll() %></td>
	</tr>
	<tr id="urltd" style="display:<%=showtype!=null&&showtype.startsWith("3")?"":"none" %>">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">页面地址:&nbsp;</div>
		</td>
		<td bgcolor="#FFFFFF">
			&nbsp;<input type="text" id="urlx" name="urlx" style="width:350px" value="<%=bean.getModelName() %>"/>
		</td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
  <a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
  <a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>
</html>

