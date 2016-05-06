<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.role.actionbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>角色管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<script type="text/javascript">
function changeOptions(sel){
	for(var i=0;i<sel.options.length;i++){
		var option = sel.options[i];
		if(option.selected){
			var iframe1 = document.getElementById("iframe1");
			if(option.value!="-1"){
				iframe1.src="menutree_role.jsp?roleid="+option.value+"&roleName="+option.text;
				iframe1.style.display = "";
				table1.style.display = "none";
				document.getElementById("a1").style.display="";
				document.getElementById("a2").style.display="";
				document.getElementById("a3").style.display="none";
				document.getElementById("a1").onclick=function(){goto1(option.value)};
				document.getElementById("a2").onclick=function(){goto2(option.value)};
				document.getElementById("a3").onclick=function(){goto3(option.value)};
			}else{
				iframe1.src="#";
				iframe1.style.display = "none";
				document.getElementById("a1").style.display="";
				document.getElementById("a2").style.display="";
				document.getElementById("a3").style.display="none";
				document.getElementById("a1").onclick=function(){};
				document.getElementById("a2").onclick=function(){};
				document.getElementById("a3").onclick=function(){};
			}
			break;
		}
	}
}
/**
 * 前往原权限列表
 * @param id 角色id
 */
function goto1(id){
	document.getElementById("a1").style.display="none";
	document.getElementById("a2").style.display="";
	document.getElementById("a3").style.display="";
	var iframe1 = document.getElementById("iframe1");
	iframe1.src="../power/select.do?roleid="+id;
}

/**
 * 前往模块列表
 * @param id
 */
function goto2(id){
	document.getElementById("a1").style.display="";
	document.getElementById("a2").style.display="none";
	document.getElementById("a3").style.display="";
	var iframe1 = document.getElementById("iframe1");
	iframe1.src="../power_new/index2.jsp?act=index&roleid="+id;
}

/**
 * 返回菜单列表的跳转
 * @param id
 */
function goto3(id){
	document.getElementById("a1").style.display="";
	document.getElementById("a2").style.display="";
	document.getElementById("a3").style.display="none";
	var iframe1 = document.getElementById("iframe1");
	iframe1.src="../left/menutree_role.jsp?roleid="+id;
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
			<li class="new" style="float: right"><a href="javascript:void(0)" id="a1">高级</a></li>
     		<li class="new" style="float: right"><a href="javascript:void(0)" id="a2">模块列表</a></li>
     		<li class="new" style="float: right"><a href="javascript:void(0)" id="a3" style="display:none">菜单列表</a></li>
		</ul>
	</div>
</div>
<table  width="100%" cellpadding="0" cellspacing="1">
	<tr bgcolor="#ffffff">
		<td height="500" class="right_date_body" valign="top">
			<div id="table1" style="margin-left: 5px;margin-right: 5px">
				<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
					<tr >
						<td height="24" colspan="11" bgcolor="#FFFFFF"><div align="center">请先选择角色！</div></td>
					</tr>
				</table>
			</div>
			<iframe id="iframe1" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="480px"
					src="#" style="display:none">
			</iframe>
		</td>
	</tr>
</table>
</body>

</html>

