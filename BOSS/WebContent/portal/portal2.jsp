<%@ page contentType="text/html; charset=gb2312"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>LiuRunze</title>
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script src="../js/tabletools.js" type="text/javascript"></script>
<script src="../js/formtools.js" type="text/javascript"></script>
<script src="portal2.js" type="text/javascript"></script>

<link href="../css/Gp_blue_portal.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE2 {font-size: 14px; color: #3366CC;}
a {
	font-size: 12px;
	color: #3366cc;
	font-weight: bold;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #3366cc;
}
a:hover {
	text-decoration: none;
	color: #3366cc;
}
a:active {
	text-decoration: none;
}

-->
</style>
<script language="JavaScript">
<!--
window.onload=pageLoad;
function openSet(por){
	window.open('portal2openwindow.jsp?portal='+por,'','width=436,height=324,left='+(screen.width-506)/2+',top='+(screen.height-400)/2);
}
-->
</script>
</head>
<body scroll="no">
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
<tr align="center" valign="top">

	<td class="ajax-td" width="32%">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name1">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('1')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata1"></tbody>
					</tr>
				</table>
				<div id='chart1'></div>
				</td>
			</tr>
		</table>	
	</td>

	<td class="ajax-td" width=1%></td>

	<td align="center" valign="top" class="ajax-td" whith="32%">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name2">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('2')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata2"></tbody>
					</tr>
				</table>
				<div id='chart2'></div>
				</td>
			</tr>
		</table>
	</td>
	
	<td class="ajax-td" width=1%></td>

	<td align="center" valign="top" class="ajax-td" whith="32%">		
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name3">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('3')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata3"></tbody>
					</tr>
				</table>
				<div id='chart3'></div>
				</td>
			</tr>
		</table>
	</td>
	
	<td class="ajax-td" width=1%></td>
	
</tr>
	
<tr align="center" valign="top">

	<td class="ajax-td">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name4">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('4')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata4"></tbody>
					</tr>
				</table>
				<div id='chart4'></div>
				</td>
			</tr>
		</table>
	</td>
	
	<td class="ajax-td" width=1%></td>
	
	<td align="center" valign="top" class="ajax-td">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name5">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('5')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata5"></tbody>
					</tr>
				</table>
				<div id='chart5'></div>
				</td>
			</tr>
		</table>
	</td>
	
	<td class="ajax-td" width=1%></td>
	
	<td align="center" valign="top" class="ajax-td">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="8DB2E3"
			style="table-layout:fixed;word-break:break-all">
			<tr>
				<td bgcolor="#FFFFFF" class="ajax-title">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="Fb-blue"><span id="name6">模块名称</span></td>
						<td align="right" class="STYLE2"><a href="#"
							onClick="openSet('6')">编辑</a></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="165" bgcolor="#FFFFFF" valign="top" style="padding:5">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<tbody id="selectdata6"></tbody>
					</td>
				</table>
				<div id='chart6'></div>
				</td>
			</tr>
		</table>
	</td>
	
	<td class="ajax-td" width=1%></td>
	
</tr>

</table>

</body>
</html>
