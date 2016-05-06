<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.genius.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>文件上传信息</title>
<link href="../css/editstyle.css" rel=stylesheet type=text/css>
<base target="_self">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" style="overflow-x:hidden;" scroll='auto'>
<table border="0" width="350" cellspacing="0" cellpadding="0" height="330"
	style="background-image: url('../images/icon/upload2_bgi.jpg'); background-repeat: no-repeat">
	<tr>
		<td height="60"></td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center">

		<table border="0" width="300" cellspacing="0" cellpadding="0" height="136">
			<%
				String oldFile = (String)request.getAttribute("oldFile");
				String realFile = (String)request.getAttribute("fileName");
				String name = oldFile;
				String originalName = realFile;
				ArrayList list = (ArrayList) request.getAttribute("fileList");
				Iterator it = list.iterator();
				while (it.hasNext()) {
					FileBean bean = (FileBean) it.next();
					if (name == null) {
						name = bean.getName() + "," + bean.getFolder();
						originalName = bean.getOriginalName();
					} else {
						name = name + bean.getName() + "," + bean.getFolder() + ";";
						originalName = originalName + bean.getOriginalName() + ";";
					}
			%>
			<tr>
				<td align="center" height="45" style='font-size:13;'><b>文件
				<%=bean.getOriginalName()%>已上传，上传字节为：<%=bean.getLength()%>；
				<%
				}
				if(name!=null && !name.equals("")){
					name = name.substring(0,name.length()-1);
					originalName = originalName.substring(0,originalName.length()-1);
				}
				if(((ArrayList) request.getAttribute("fileList")).size()==0){
				%></b>
			<tr>
				<td align="center" height="45" style='font-size:13;'><b>操作成功</b>
				<%} %>
				</td>
			</tr>
			<%
				String nameInput = request.getAttribute("nameinput").toString();
				String valueInput = request.getAttribute("valueinput").toString();
			%>
			<script language="JavaScript">
			<!--
 				function changeparent(){
 				window.opener.document.getElementById('<%=valueInput %>').value='<%=name%>';
 				window.opener.document.getElementById('<%=nameInput %>').innerText='<%=originalName %>';
 				window.close();
 					}
			-->
			</script>
			<tr>
				<td align="center" height="45">
					<input onclick="changeparent()" value="确定" type="button" /></td>
			</tr>
		</table>

		</div>
		</td>
	</tr>
</table>

<p>
</body>
</html>


