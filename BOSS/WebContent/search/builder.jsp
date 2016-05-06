<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.genius.search.search.*"%>
<%@ page import="java.util.* " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.genius.search.search.actionbean.BuilderActionBean"%><html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>自定义查询</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>
<script language="JavaScript">
<!--
var f1=document.getElementById("tablelist");
var f2=document.getElementById("selecttable");

function ol(){
	f1=document.getElementById("tablelist");
	f2=document.getElementById("selecttable");
}
function f_add() {
	for(i=0; i<f1.length; i++){
		if(f1.options[i].selected){
			s1 = f1.options[i];
			s2 = new Option(s1.text,s1.value);
			s2.p = s1.p;
			s2.model = s1.model;
			f2.add(s2);

			break;
		}
	}
}
function f_del() {
	sel_tmp = new Array();
	for(i=0; i<f2.length; i++){
		if(f2.options[i].selected){
			f2.remove(i);
			break;
		}
	}
}
function f_ins(opt) {
	j=f1.length;
	if(j>0) {
		ss1 = f1.options[j-1];
		while(ss1.p*1>opt.p*1) {
			ss2 = new Option(ss1.text,ss1.value);
			ss2.p = ss1.p;
			ss2.model = ss1.model;
			f1.remove[j-1];
			f1.options[j] = ss2;
			j--;
			if(j>0){
				ss1 = f1.options[j-1];
			}else {
				ss1.p = 0;
			}
		}
	}
	f1.options[j] = opt;
}
function f_delall(){
	sel_tmp = new Array();
	k = f2.length;
	for(i=0; i<k; i++){
		f2.remove(0);
	}
}
function f_submit(){
	var t1="";
	if(f2.length<1){
		alert("请选择操作表！！");
	}else{
		for(i=0; i<f2.length; i++){
			t1 = t1 + f2.options[i].value;
			if(i<f2.length-1){
				t1 = t1 + ",";
			}
		}
		document.getElementById("selectedtable").value = t1;
		//alert(t1);
		form1.submit();
	}
}
//-->
</script>

</head>

<body class="right_date_body" onload="ol()">
<div class="bmgl_div">
<form method="post" action="builderaction1.do?action=gettablelist" name="form1">
<input type="hidden" name="id" id="id" value="<%=request.getAttribute("updateid") %>"/>
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">自定义查询</div></td>
	</tr>
	<tr> 
		<td width="45%" height="27" bgcolor="#efefef" align="center">可选表：</td>
		<td width="10%" height="27" align="center" bgcolor="#efefef">操作</td>
		<td width="45%" height="27" bgcolor="#efefef" align="center">操作表：</td>
	</tr>
	<tr>
		<td align="center" valign="middle" bgcolor="#FFFFFF">
			<select id="tablelist" size="10" style="width:200px;" ondblclick='f_add();'>
				<%
				  	List a=(List)request.getAttribute("tablelist");
				  	for(int i=0;i<a.size();++i){
				  		BuilderActionBean k=(BuilderActionBean)a.get(i);			
				%>
				<option value="<%=k.getTableValue()%>"><%=k.getTableText() %></option> 
				<%} %>			
			</select>
		</td>
		<td width="10%"  bgcolor="#FFFFFF" align="center">
			<input type="button" name="Submit" value=">" style="width:20px;" onclick='f_add();'/><br/><br/>
	        <input type="button" name="Submit" value="&lt;" style="width:20px;" onclick='f_del();'/><br/><br/>
			<input type="button" name="Submit" value="&lt;&lt;" style="width:20px;" onclick='f_delall();'/>
		</td>
		<td height="165" align="center" valign="middle" bgcolor="#FFFFFF"> 
			<select id="selecttable" size="10" style="width:200px;" ondblclick='f_del();'></select>
			<input type=hidden name=selectedtable />
		</td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="f_submit()"><input type="button" value="下一步" style="width:77px; height:21px"/></a> 
	<a href="#" onclick="javascript:history.go(-1)"><input type="button" value="返回" style="width:77px; height:21px"/></a>
</p>
</body>
</html>

