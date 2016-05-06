<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*" %>    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>流程发布</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.js" type="text/javascript"></script>
<script language="JavaScript">
	function pageLoad(){
		XMLHttp.sendReq('POST', 'getallxml.do','',getAllXml);
	}
	function getAllXml(xmlObject){
		var xmlDoc = xmlObject.responseXML;
		var xmlName = '';
		var xmlFileName = '';
		var xmlDescribe = '';
		$(xmlDoc).find('xmlinfo > jpdl').each(function(){
			xmlName = $(this).attr('name');
			xmlFileName = $(this).attr('filename');
			xmlDescribe = $(this).attr('description');
			var tabletr = $(
				'<tr align="center" height="20" bgcolor="#FFFFFF"><td>'+xmlName+'</td>'+
				'<td>'+xmlDescribe+'</td>'+
				'<td align="center"><a href="deployForXml.do?name='+xmlFileName+'">发布流程</a></td>'
				//'<td align="center"><a href="#" onclick=\'goXmlEdit("'+xmlName+'");\'>编辑</a></td></tr>'
			);
			$('#deploytable').append(tabletr);
		});
	}
	function goXmlEdit(xmlName){
		window.open('xmledit.jsp?xmlname='+xmlName,'','width=580,height=300');
	}
</script>
</head>

<body class="right_date_body" scroll="auto" onLoad="pageLoad();">
<div class="bmgl_div">
	<div class="yhgl_div">
		流程发布：
	</div>
</div>

<div class="bmgl_div">
<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<thead>
		<tr align="center" style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
			<td height="25">名称</td>
			<td>描述</td>
			<td>发布</td>
		</tr>
	</thead>
	<tbody id="deploytable"></tbody>
</table>

</div>
</body>
</html>

