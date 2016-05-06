<%@ page language="java" %>
<%@ page contentType="text/html; charset=gb2312" %>

<%@ page import="com.genius.search.search.*"%>
<%@ page import="java.util.*" %>

<%@page import="com.genius.search.search.actionbean.Builder2ActionBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>自定义查询</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>

<script language="javascript">
function getFieldType(fieldname){
	//获取字段的类型
	//var a = fieldname.split(".");
	var fieldtype;
	for(i=0; i<subcat.length; i++){
		if(subcat[i][1]==fieldname){
			fieldtype = subcat[i][3];
		}
	}
	return fieldtype;
}
function resetother(){
	//设置条件下拉框的状态
	document.form1.othercondition.options['0'].selected = true;
}
function makersql(a1,a2,a3){
 	var mytype = getFieldType(a1);
	var mysql ="";
 		//var b = a1.split(".");
	if((mytype=="numb")||(mytype=="NUMB")){
		mysql = "yy."+a1 +" "+ a2+" "+ a3;
	}else if((mytype=="varc")||(mytype=="VARC")){
		mysql = "yy."+a1 +" "+ a2+" "+"'"+a3 +"'";
	}else if((mytype=="date")||(mytype=="DATE")){
		mysql = "yy."+a1 +" "+ a2 +" "+"convert(datetime,'"+ a3 +"')";
	}else{
		mysql = "yy."+a1 +" "+a2+" "+ a3;
	}
	return mysql;
}
function conditionmaker(){
	//生成条件语句
 	var conditioncont="";
	var fieldname=document.form1.tablelist.value;
	var relation=document.form1.condition.value;
	var context = document.form1.conditionvalue.value;
	var conditiontype = document.form1.othercondition.value;
	if((fieldname=="0")||(relation=="0")||(context=="")){
		alert("完整的条件语句由:'字段/条件类型/条件内容'构成!");
		return;
	}
	conditioncont = document.form1.conditioncont.value;
	var tempstr;
	
	if(context=="@"){
		addconditionvar();
	}
	if(conditiontype=="end"){
		tempstr = makersql(fieldname,relation,context);
		conditioncont += tempstr ;
		alert("条件选择完成,请选择显示的字段或进行下一步操作!");
		
	}else if(conditiontype=="and"){
		tempstr = makersql(fieldname,relation,context);
		conditioncont += tempstr + " and ";
		alert("请选择其他条件!");
	}else if(conditiontype=="or"){
			tempstr = makersql(fieldname,relation,context);
			conditioncont += tempstr + " or ";
			alert("请选择其他条件!");
	}else{
		alert("条件语句生成失败！");
		return;
	}
	document.form1.conditioncont.value = conditioncont;
}
function addloc(locs,mylocs){ 
	for(i=0; i<locs.length; i++){
		if(locs.options[i].selected){
			s1 = locs.options[i];
			var mytype = getFieldType(s1.value);
			var myvalue = s1.value;
			if((mytype=="date")||(mytype=="DATE")){
				myvalue = myvalue;
			}
					
			s2 = new Option(s1.text,myvalue);
			s2.p = s1.p;
			s2.model = s1.model;
			mylocs.add(s2);

			break;
		}
	}
} 

function delloc(locs,mylocs){ 
	for(i=0; i<mylocs.length; i++){
		if(mylocs.options[i].selected){
			mylocs.remove(i);
			break;
		}
	}
} 
function f_submit(){
	if(document.form1.conditioncont.value==""){
		alert("请选择查询条件!");
		return;
	}
	if(document.form1.objsql.value==""){
		alert("数据对象丢失,请重新建立数据对象!");
		return;
	}
	var t1="";
	if(document.form1.fieldlist1.length<1){
		alert("请选择操作表！！");
		return;
	}else{
		for(i=0; i<document.form1.fieldlist1.length; i++){
			t1 = t1 + document.form1.fieldlist1.options[i].value+":"+document.form1.fieldlist1.options[i].text;
			if(i<document.form1.fieldlist1.length-1){
				t1 = t1 + ";";
			}
		}
	}
	document.form1.showarray.value = t1;
	document.form1.action = "result.do";
	document.form1.submit();
}
function f_submit1(){
	if(document.form1.conditioncont.value==""){
		alert("请选择查询条件!");
		return;
	}
	if(document.form1.objsql.value==""){
		alert("数据对象丢失,请重新建立数据对象!");
		return;
	}
	var t1="";
	if(document.form1.fieldlist1.length<1){
		alert("请选择操作表！！");
		return;
	}else{
		for(i=0; i<document.form1.fieldlist1.length; i++){
			t1 = t1 + document.form1.fieldlist1.options[i].value+":"+document.form1.fieldlist1.options[i].text;
			if(i<document.form1.fieldlist1.length-1){
				t1 = t1 + ";";
			}
		}
	}

	document.form1.showarray.value = t1;
	
	document.form1.action = "historyaction.do?action=addex";
	document.form1.submit();
}
function getSelectText(list){
	var returnString="";
	for(i=0; i<list.length; i++){
		if(list.options[i].selected){
			s1 = list.options[i];
			returnString = s1.text;
			break;
		}
	}
	return returnString;
}
function addconditionvar(){
	//alert(getSelectText(document.form1.tablelist));
	//alert(getSelectText(document.form1.condition));
	var fieldname=document.form1.tablelist.value;
	var mytype = getFieldType(fieldname);
	document.form1.conditionvar.value = document.form1.conditionvar.value + getSelectText(document.form1.tablelist)+","+getSelectText(document.form1.condition)+","+mytype+";";
}
</script>
</head>
<%
	String myarray = (String)request.getAttribute("buffer");
	String  myarray1 = (String)request.getAttribute("objsql");
%>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">自定义查询</div></td>
	</tr>
	<tr>
		<td height="27" align="center" bgcolor="#efefef" >可选字段</td>
		<td width="15%" height="27" align="center" bgcolor="#efefef">条件</td>
		<td height="27" align="center" bgcolor="#efefef" >条件内容</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td height="27" align="center" >&nbsp; 
			<select name="tablelist"  onchange="resetother()">
				<option value="0" selected>请选择条件字段</option> 
				<%
					Builder2ActionBean k=new Builder2ActionBean(); 				  	
				  	List a=(List)request.getAttribute("afieldlist");
				  	for(int i=0;i<a.size();++i){
						k=(Builder2ActionBean)a.get(i);				  		
				%>
                <option value=S<%=k.getFieldId()%>><%=k.getFieldShow() %></option> 
				<%} %>
			</select>
		</td>
		<td width="10%" height="27" align="center">
			<select name="condition"  onchange="resetother()">
				  <option value=0 selected>请选择条件</option>
				  <option value='='>等于</option>
				  <option value='>'>大于</option>
				  <option value='>='>大于等于</option>
				  <option value='<'>小于</option>
				  <option value='<='>小于等于</option>
				  <option value='<>'>不等于</option>
				  <option value='in'>包含</option>
				  <option value='not in'>不包含</option>
				  <option value='like'>近似于</option>
			</select>
		</td>
		<td height="27" align="center" >&nbsp;
			<input name="conditionvalue" type="text" value='@' size="5">
			<select name=othercondition onChange="conditionmaker();" style="width:120px;">
				<option value=0 selected>请选择条件关系</option>
				<option value='end'>结束</option>
				<option value='and'>与</option>
				<option value='or'>或</option>
			</select>                  
		</td>
	</tr>
<%=myarray%>
	<tr bgcolor="#FFFFFF">
		<td align="center">
			<select name="fieldlist" size="10" style="width:200px;" ondblclick="addloc(document.form1.fieldlist,document.form1.fieldlist1);">
			<%
				Builder2ActionBean k2=new Builder2ActionBean(); 		
                List b=(List)request.getAttribute("afieldlist");
				for(int i=0;i<b.size();++i){
					k2=(Builder2ActionBean)b.get(i);				  		
			%>
            	<option value="S<%=k2.getFieldId()%>"><%=k2.getFieldShow() %></option> 
            <%} %>
			</select>
		</td>
		<td  width="10%" align="center">
			<input type=button name = add1 value=">" onClick="addloc(document.form1.fieldlist,document.form1.fieldlist1);"/>
			<br/>
			<br/>
			<input type=button name = del1 value="<" onClick="delloc(document.form1.fieldlist,document.form1.fieldlist1);"/>
		 </td>
		 <td height="165" align="center">
			<select name="fieldlist1" size="10" style="width:200px;" ondblclick='delloc(document.form1.fieldlist,document.form1.fieldlist1);'>
			</select><br/>
			<input type="hidden" name="conditioncont" />
			<input type="hidden" name="objsql" value="<%=myarray1%>" />
			<input type="hidden" name="showarray" />
			<input type="hidden" name="conditionvar" />
		</td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="f_submit1()"><input type="button" value="下一步" style="width:77px; height:21px"/></a> 
	<a href="#" onclick="javascript:history.go(-1)"><input type="button" value="返回" style="width:77px; height:21px"/></a>
</p>
</body>
</html>
