<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%@include file="../jspheader/insert_header.jsp" %>
<title>�����</title>
<script language="JavaScript">
<!--
function changeSkpe(){
	var zz = document.getElementById("cssName");
	var xy = zz.options[zz.selectedIndex].value; 
	if(xy == "default/fresh")
		document.getElementById("photo1").src="../images/s-JM/jianyue.jpg";
    else if(xy=="round/fresh")
    	document.getElementById("photo1").src="../images/s-JM/shishang.jpg";
    else
        document.getElementById("photo1").src="../images/s-JM/keji.jpg"
}
function update(){
	messageBox.loading("save");
	var cssName = document.getElementById("cssName").value;
	XMLHttp.sendReq('POST', "individualityok.jsp?cssName="+cssName, "", function(xmlObj){
		var text = xmlObj.responseText;
		var val = text.split("#");
		var bool = val[0];
		if(bool){
			messageBox.alert("���óɹ������µ�¼����Ӧ������ʽ��","success",function(){
				window.close();
			});
		}else{
			messageBox.alert("����ʧ�ܣ�","error");
		}
	});
}
-->
</script>
</head>
<%
if (session.getAttribute("login") == null
		|| (!session.getAttribute("login").equals("true"))) {
	response.sendRedirect("individualityok.jsp");
}
%>
<body class="individuality_body">
<div id="message_box"></div>
<form method="post" action="individualityupdate.jsp" name="form1">
<div class="individuality_div" style="height:225px">
	<div class="individuality_title"><h1>���Ԥ��</h1></div>
        <div class="individuality_content">
        	<div><img id="photo1" src="../images/s-JM/jianyue.jpg" width="285" height="156" /></div>
        	<span>
        	<select name="cssName" id="cssName" multiple="multiple"  onchange="changeSkpe()" >
				<option value="default/fresh">��Լ</option>
         		<option value="round/fresh">ʱ��</option>
         		<option value="round/blue">�Ƽ�</option>
         	</select>
        	</span>
        </div>
        <div class="userinfo_btns">
	   		<input name="Submit" type="button" value="�޸�" onclick="update()" style="width:60px;" />
	    	<input name="Submit2" type="button" value="ȡ��" onclick="window.close()" style="width:60px;" />
		</div>
</div>
</form>
</body>
</html>
