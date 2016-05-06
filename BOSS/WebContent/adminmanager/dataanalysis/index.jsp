<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.role.actionbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据分析</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<script type="text/javascript">
function changeOptions(sel){
	for(var i=0;i<sel.options.length;i++){
		var option = sel.options[i];
		if(option.selected){
			var iframe1 = document.getElementById("iframe1");
			var table1 = document.getElementById("table1");
			if(option.value!="-1"){
				iframe1.src="select.do?act=index&roleid="+option.value;
				iframe1.style.display = "";
				table1.style.display = "none";
			}else{
				iframe1.src="#";
				iframe1.style.display = "none";
				table1.style.display = "";
			}
		}
	}
}
</script>
<base target="_self" />
</head>
<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
		<li><span id="title1">选择角色：</span></li>
		<li class="new">
			<select onchange="changeOptions(this)">
				<option value="-1">--请选择--</option>
			<%
				ArrayList<?> mylist = (ArrayList<?>) request.getAttribute("roleList");
				Iterator<?> it = mylist.iterator();
				while (it.hasNext()) {
					RoleSelectActionBean bean = (RoleSelectActionBean) it.next();
					out.print("<option value=\""+bean.getId()+"\">"+bean.getName()+"</option>");
				}
			%>
			</select>
		</li>
	</ul>
</div>
</div>
<table  width="100%" cellpadding="0" cellspacing="1">
	<tr bgcolor="#ffffff">
		<td height="400" class="right_date_body" valign="top">
			<div style="margin-left: 5px;margin-right: 5px" id="table1">
				<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
					<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
						<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">首页数据：为各角色的首页设置不同主菜单下的默认显示模块。</div></td>
					</tr>
					<tr >
						<td height="24" colspan="11" bgcolor="#FFFFFF"><div align="center">请先选择角色！</div></td>
					</tr>
				</table>
			</div>
			<iframe id="iframe1" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="400px"
					src="#" style="display:none">
			</iframe>
		</td>
	</tr>
</table>
</body>

</html>

