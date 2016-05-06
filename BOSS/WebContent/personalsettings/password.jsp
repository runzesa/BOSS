<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>更改您的密码</title>
<script type="text/javascript" src="password.js"></script>
</head>
<body class="pwd_body">
<div id="message_box"></div>
<form action="" method="post">
	<div class="pwd_div">
		<div class="pwd_title"><h1>修改密码</h1><span>(<font style="color:#FF0000;font-size:14px;">*</font>号的是必须填写项目)</span></div>
        <div class="pwd_input">
        <span>*</span>您的旧密码：<input name="pwd_bak" id="pwd_bak" type="password"/><br/><br/>
		<span>*</span>输入新密码：<input name="pwd_new1" id="pwd_new1" type="password"/>&nbsp;<font style="color:#FF0000;font-size:12px;">6～16位</font><br/><br/>
		<span>*</span>新密码确认：<input name="pwd_new2" id="pwd_new2" type="password"/></div>
		<div class="userinfo_btns">
			<input name="Submit" type="button" onclick="checkup()" class="btn" value="修改" />
			<input name="Submit2" type="button" onclick="window.close()" class="btn" value="取消" />
		</div>
	</div>
</form>
</body>
</html>
