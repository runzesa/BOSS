<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>主页定制</title>
<script type="text/javascript" src="userindexsetting_new.js"></script>
<script type="text/javascript" src="../js/connectionpool_jquery.js"></script>
<style type="text/css">
#menu { float:left; width:100%; background:#efefef; font-size:93%; line-height:normal; border-bottom:1px solid #666; }
#menu ul { margin:0; padding:5px 10px 0 10px; list-style:none; }
#menu li { display:inline; margin:0; padding:0; }
#menu a { float:left; background:url("../portal/newportal/img/tableft.gif") no-repeat left top; margin:0; padding:0 0 0 4px; text-decoration:none; }
#menu a span { float:left; display:block; background:url("../portal/newportal/img/tabright.gif") no-repeat right top; padding:5px 10px 3px 5px; color:#000; }
#menu a span { float:none; }
#menu a:hover span { color:#333; }
#menu a:hover { background-position:0% -42px; }
#menu a:hover span { background-position:100% -42px; }
#menu #current a { background-position:0% -42px; }
#menu #current a span { background-position:100% -42px; }
</style>

<script language="JavaScript">
<!--
window.onload = function(){
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
        	<div id="menu">
				<ul id="tabs"></ul>
			</div>
        	<input type="hidden" id="tabid" name="tabid"/>
		<div class="userindexset_input">
			<div class="userindexset_checkbox">
        		<table border=0 width="98%" align="center" id="set_module_area" style="margin-top:10px">
					<tbody id="modelarea">
						<tr height="38">
							<td align="center"><select style="width:110px;" id="s_1"><option value="0">无</option></select></td>
							<td align="center"><select style="width:110px;" id="s_2"><option value="0">无</option></select></td>
						</tr>
						<tr height="38">
							<td align="center"><select style="width:110px;" id="s_3"><option value="0">无</option></select></td>
							<td align="center"><select style="width:110px;" id="s_4"><option value="0">无</option></select></td>
						</tr>
					</tbody>
				</table>
        	</div>
        </div>
		<div class="userinfo_btns">
			<input type="button" value="保存" onclick="sub()" class="btn" />
			<input type="button" onclick="window.close();" value="关闭" class="btn" />
		</div>
	</div>
</form>
<div id="nav_area"></div>

</body>
</html>