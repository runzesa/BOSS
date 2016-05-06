<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=gb2312" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>查询条件</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<link rel="stylesheet" type="text/css" media="all" href="../css/aqua/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="stylesheet" type="text/css" media="all" href="../css/aqua/theme.css" title="Aqua" />
<script type="text/javascript" src="../css/calendar.js"></script>
<script type="text/javascript" src="../css/calendar-cn.js"></script>
<script type="text/javascript" src="../css/calendar-setup.js"></script>
<%
	String  searchid = (String)request.getAttribute("id");
	String  a = (String)request.getAttribute("sqlquary");
	String [] b = a.split(";");
%>
<script language="JavaScript">
function validate(form){
	<%for(int i=0;i<b.length;i++){%>
	if(document.form1.myvar<%=i%>.value==""){
		alert("填写<%=b[i].substring(0,b[i].length()-5)%>内容！");
		return(false);
	} 
<%}%>
	document.forms[0].submit();
	return true;
}
</script>
</head>
<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
		<li class="new"><a href="javascript:void()" onclick="return validate(document.forms[0]);">查询</a></li>
		<li class="new"><a href="javascript:history.go(-1)">返回</a></li>
	</ul>
</div>
</div>
<div class="bmgl_div">
<form method="post" action="quary.do?lx=0&actiontype=fulfill" name="form1">
<input type="hidden" name="id" value="<%=searchid%>"/>
<input type="hidden" name="quary" value="<%=a%>"/>
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">查询条件</div></td>
	</tr>
	<%for(int j=0;j<b.length;j++){%>
	<tr> 
		<td width="150" height="25" bgcolor="#FFFFFF">&nbsp;<%=b[j].substring(0,b[j].length()-5)%>：</td>
		<td bgcolor="#FFFFFF">&nbsp;
		<%if((b[j].substring(b[j].length()-4).equals("date"))||(b[j].substring(b[j].length()-4).equals("DATE"))){%>
			&nbsp; <input type="text" name="myvar<%=j%>"  style="width:150px;"/>&nbsp;<img name="stimedate<%=j %>" src="../adminmanager/images/calenderimg.gif" id="stimedate" style="cursor: pointer; border: 1px solid red;" onmouseover="this.style.background='red';" onmouseout="this.style.background=''" />
			<script type="text/javascript">
				Calendar.setup({
					inputField     :    "myvar<%=j%>",
					ifFormat       :    "%Y-%m-%d ",
					button         :    "stimedate<%=j%>",
					singleClick    :    false
					});
			</script>
		<%}else{%>
			&nbsp; <input type="text" name="myvar<%=j%>" style="width:150px;" />
		<%}%>
		</td>
	</tr>
	<%}%>
</table>
</form>
</div>
</body>
</html>