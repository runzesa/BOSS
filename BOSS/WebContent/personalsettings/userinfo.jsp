<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>�������ĸ�������</title>
<script type="text/javascript" src="userinfo.js"></script>
</head>
<body class="userinfo_body" onload="pageLoad()">
<div id="message_box"></div>
<form action="" method="post">
	<div class="userinfo_div">
		<div class="userinfo_title"><h1>��������</h1><span>(����������������ַ������������Ϣ)</span></div>
		<div class="userinfo_input">
			��&nbsp;����<input name="name" id="name" type="text"/><br/><br/>
			ס&nbsp;ַ��<input name="address" id="address" type="text"/><br/><br/>
			��&nbsp;����<input name="mobile" id="mobile" type="text"/><br/><br/>
			�̶��绰��<input name="phone" id="phone" type="text"/><br/><br/>
			�����ʼ���<input name="email" id="email" type="text"/></div>
		<div class="userinfo_btns">
			<input name="Submit" type="button" onclick="update()" class="btn" value="�޸�" />
			<input name="Submit2" type="button" onclick="window.close()" class="btn" value="ȡ��" />
		</div>
	</div>
</form>
</body>
</html>
