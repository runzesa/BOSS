<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>流程流转</title>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.js" type="text/javascript"></script>
<script src="../js/jquery.simplemodal.js" type="text/javascript"></script>
<script src="checkout.js" type="text/javascript"></script>
<script language="JavaScript">

</script>
</head>

<body class="right_date_body" scroll="auto">
<div id="message_box"></div>
<div class="gzl_date_top">
    <div><h1>流程流转</h1></div>
</div>
<div class="gzl_date">
	<form name="form1" action="" method="post" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<thead id='currentdata'>
				<tr><th colspan='3'>流程流转</th></tr>
			</thead>
			<tbody id='nextdata'>
				<tr><th colspan='3'>流转至</th></tr>
			</tbody>
		</table>
	</form>
<div style="margin:20px 0 0 0;text-align:center;">
	<input style="width:60px;" type="button" value="确定" onclick="taskSubmit();" />&nbsp;&nbsp;&nbsp;&nbsp;
	<input style="width:60px;" type="button" value="取消" onclick="self.close();" />
</div>
</div>
</body>
</html>

