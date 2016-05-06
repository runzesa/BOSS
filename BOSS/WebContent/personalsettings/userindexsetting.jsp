<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>主页定制</title>
<link rel="stylesheet" type="text/css" href="../portal/index/css/demo_default.css" id="demo_theme" />
<script type="text/javascript" src="../portal/jsre.js" classpath="../portal/lib/demo_lib_110_userindexsetting.js"></script>
<script type="text/javascript" src="userindexsetting.js"></script>
<script language="JavaScript">
<!--
_import("com.bluepower.ui.DemoPage");
var uid = '<%=session.getAttribute("userId")%>';
var sDefault = "简介";
var dp = new DemoPage();
var sCookie = dp.getStyle("modules");
if(!sCookie || sCookie == ''){
	sCookie = sDefault;
	dp.setStyle("modules", sDefault);
}
window.onload = function(){
	dp.init(sCookie);
	pageLoad();
}
-->
</script>
</head>

<body class="userindexset_body">
<div id="message_box"></div>
<form action="" method="post">
	<div class="userindexset_div">
		<div class="userindexset_title">
			<h1>主页定制</h1><span>&nbsp;(可以定制您的主页)</span>
		</div>
		<div class="userindexset_input">
        	<h2>请选择样式：</h2>
        	<span>
        	1栏：<input type="radio" name="d_column" checked="checked" value="1" />
        		(主页面中将模块集中显示为一列)<br/>
			2栏：<input type="radio" name="d_column" value="2" />
				(主页面中将模块分开显示为两列)<br/>
			3栏：<input type="radio" name="d_column" value="3" />
				(主页面中将模块分散显示为三列)</span>
		</div>
		<div class="userindexset_input">
        	<h2>请选择模块：</h2>
			<div class="userindexset_checkbox">
        		<table border=0 id="set_module_area">
					<tbody id="modelarea"></tbody>
				</table>
        		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        	</div>
        </div>
		<div class="userinfo_btns">
			<input type="button" value="确定" onclick="sub(dp)" class="btn" />
			<input type="button" onclick="window.close();" value="取消" class="btn" />
		</div>
	</div>
</form>
<div id="nav_area"></div>

</body>
</html>