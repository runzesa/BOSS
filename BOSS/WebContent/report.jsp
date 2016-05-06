<%@ page contentType="text/html; charset=GBK"%>

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>导出报表123</title>
<%String moduleName=request.getParameter("moduleName"); 
String assemblyName=request.getParameter("assemblyName"); 
%>
<script language="JavaScript">
<!--
var query="<%=request.getQueryString()%>";
function exportreport()
{
	if(document.form1.elements["reporttable"][1].checked){
		document.form1.action="<%=moduleName %>/<%=assemblyName %>Pdf.do?"+query;
	}else if(document.form1.elements["reporttable"][2].checked){
		alert("html");
	}else{
		document.form1.action="<%=moduleName %>/<%=assemblyName %>Excel.do?"+query;
	}
	document.form1.submit();
}
-->
</script>
<style type=text/css>
body {
	font-size: 9pt; margin-bottom: 6px; font-family: 宋体
}
.h1 {
	font-size: 9pt; line-height: 9pt; align: center
}
td {
	font-size: 9pt; font-family: "宋体", "arial", "times new roman"
}
p {
	font-size: 9pt; font-family: "宋体", "arial", "times new roman"
}

</style>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table border="0" width="400" cellspacing="0" cellpadding="0"
	height="330"
	style="background-image: url('images/e_dayin_bg.gif'); background-repeat: no-repeat">
	<tr>
		<td height="83"></td>
	</tr>
	<tr>
		<td height="27">
		<p align="center">&nbsp;请选择需要导出的类型
		</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">
		<form method="post" action="" name="form1">
		<table border="0" width="280" cellspacing="0" cellpadding="0"
			height="148">
			<tr>
				<td width="30" align="center" height="29"><input type="radio"
					id="reporttable" name="reporttable" value="excel"
					style="background-color: #EEFAFF" checked="checked"></td>
				<td width="250" height="29">&nbsp;Excel</td>
			</tr>
			<tr>
				<td width="30" align="center" height="29"><input type="radio"
					id="reporttable" name="reporttable" value="pdf"
					style="background-color: #EEFAFF"></td>
				<td width="250" height="29">&nbsp;PDF</td>
			</tr>
			<tr>
				<td width="30" align="center" height="30"><input type="radio"
					id="reporttable" name="reporttable" value="html"
					style="background-color: #EEFAFF"></td>
				<td width="250" height="30">&nbsp;Html</td>
			</tr>
			<tr>
				<td width="280" align="center" height="30" colspan="2"><a
					href="#" onclick="exportreport()"><img border="0"
					src="images/e_but_login.gif" width="49" height="19"></a></td>
			</tr>
		</table>
		</form>
		</div>
		<p>
		</td>
	</tr>
</table>

</body>

</html>
