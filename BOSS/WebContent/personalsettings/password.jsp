<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>������������</title>
<script type="text/javascript" src="password.js"></script>
</head>
<body class="pwd_body">
<div id="message_box"></div>
<form action="" method="post">
	<div class="pwd_div">
		<div class="pwd_title"><h1>�޸�����</h1><span>(<font style="color:#FF0000;font-size:14px;">*</font>�ŵ��Ǳ�����д��Ŀ)</span></div>
        <div class="pwd_input">
        <span>*</span>���ľ����룺<input name="pwd_bak" id="pwd_bak" type="password"/><br/><br/>
		<span>*</span>���������룺<input name="pwd_new1" id="pwd_new1" type="password"/>&nbsp;<font style="color:#FF0000;font-size:12px;">6��16λ</font><br/><br/>
		<span>*</span>������ȷ�ϣ�<input name="pwd_new2" id="pwd_new2" type="password"/></div>
		<div class="userinfo_btns">
			<input name="Submit" type="button" onclick="checkup()" class="btn" value="�޸�" />
			<input name="Submit2" type="button" onclick="window.close()" class="btn" value="ȡ��" />
		</div>
	</div>
</form>
</body>
</html>
