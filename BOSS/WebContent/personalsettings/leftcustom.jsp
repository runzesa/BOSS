<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Pragma" content="no-cache" />
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<%@include file="../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/jquery.jstree.js"></script>
<link type="text/css" rel="stylesheet" href="../css/jstree/!treestyle2.css"/>
<link type="text/css" rel="stylesheet" href="../css/jstree/!treestyle.css"/>
<script src="../js/messagebox.js" type="text/javascript"></script>
<script src="../js/jquery.simplemodal-1.4.4.js" type="text/javascript"></script>
<script type="text/javascript" src="leftcustom.js"></script>
<title>常用功能</title>

<script type="text/javascript">
var userId = '<%=session.getAttribute("userId")%>';
if(userId == 'null'){
	alert('对不起,系统已超时。');
	returnValue = false;
	window.close();
}
</script>

<!--<script src="../adminmanager/css/jsframework.js"></script>-->
<style type="text/css">
	.cdgl_div{display:block;overflow:hidden;margin:5px;padding:5px;border: solid 1px #ccc;background-color:#edf1f1;font-family:"宋体";}
	.bmgl_left{ float:left;border: solid 1px #ccc;background-color:#efefef;padding:6px;}
	.custom_title_table{height:380px;overflow:hidden;overflow-y:auto;}
</style>
</head>

<body class="custom_body" onload="loadTree();pageLoad();">
<div id="message_box"></div>
<form action="" method="post">
<div class="custom_div">
	<div class="custom_title"><h1>更改您的常用功能:</h1></div>
	<span style="margin:10px 0 10px 0;display:block;">从下列选项中选择要添加的常用模块</span>
	<table border="0" height="280px" cellpadding="0" cellspacing="0" >
		<tr>
			<td width="200px" valign="top">
				<div class="bmgl_left" style="overflow-y: auto;width:200px;height:246px;" id="tree">
				<!--script language="JavaScript">
					var data={};
					data["-1_1"] = "text: /根目录; XMLData: updateLeftSelectChild.do?pid=0&formname=" +
						"&nameinput=" + "&idinput=";
					Using("System.Web.UI.WebControls.MzTreeView");
					var a = new MzTreeView();
					a.dataSource = data
					a.setJsDataPath("/");
					a.setXmlDataPath("/");
					a.autoSort=false;
					a.useCheckbox=false
					a.canOperate=true;
					document.write(a.render());
					a.expandLevel(1);
				</script-->
				</div>
				<input type="hidden" name="selectedModule" id="selectedModule"/>
			</td>
			<td align="center" width="100px">
				<input style="width:36px" type="button" onclick="addToRight()" value="&gt;&gt;" title="添加到常用功能列表"/>
				<br/><br/>
				<input style="width:36px" type="button" onclick="removeModule()" value="&lt;&lt;" title="从常用功能列表中删除"/>
			</td>			
			<td valign="top" width="200px">
				<div style="border:1px solid #CCC;background-color:#efefef;width:200px;height:246px;">
					<select size="16" multiple="multiple" style="width:200px;height:260px;clip:rect(1 200 260 1);position:absolute;background-color:#efefef;" id="userList" name="userList" >
					</select>
				</div>
			</td>
		</tr>
	</table>
		<div class="userinfo_btns">
			<input type="button" value="保存" onclick="sub()" class="btn" />
			<input type="button" onclick="window.close();" value="关闭" class="btn" />
		</div>
	</div>
</form>
</body>
</html>
