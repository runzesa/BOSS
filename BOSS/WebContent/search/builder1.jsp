<%@ page contentType="text/html; charset=gb2312" %>

<%@ page import="com.genius.search.search.*"%>
<%@ page import="java.util.*" %>

<%@page import="com.genius.search.search.actionbean.Builder1ActionBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String jsbuffer = (String)request.getAttribute("jsbuffer");
	String jsbuffer1 = (String)request.getAttribute("jsbuffer1");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>自定义查询</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>
<script type="text/javascript">
function showFields(){
	var f1= document.form1.tablelist;
    var f2 = document.form1.fieldlist;
    var len = f1.length;
    var tempValue = f1.value;
    var valueTemp = tempValue.split("-");
	if (valueTemp[0]=="T"){
		var k = f2.length;
		if(k > 0){
			for(j=0;j<k;j++){
				f2.remove(0);
			}
		}
		for(i=0; i<subcat.length; i++){
			if(subcat[i][0] == valueTemp[1]){
				var oOption = document.createElement("OPTION");
				f2.options.add(oOption);
				oOption.innerText = subcat[i][2];
				oOption.value = subcat[i][1];
			}
		}
    }  
	if(valueTemp[0]=="O"){
		var k = f2.length;
		if(k > 0){
			for(j=0;j<k;j++){
				f2.remove(0);
			}
		}
		for(i=0; i<subcat.length; i++){
			var subtable = valueTemp[1].split(",");
			for(j=0;j<subtable.length;j++){
				if(subcat[i][0] == subtable[j]){
					var oOption = document.createElement("OPTION");
					f2.options.add(oOption);
					oOption.innerText = subcat[i][2];
					oOption.value = subcat[i][1];
				}
			}
		}
    }
}
function showFields1(){
    var f1= document.form1.tablelist1;
    var f2 = document.form1.fieldlist1;
    var len = f1.length;
    var tempValue = f1.value;
    var valueTemp = tempValue.split("-");
	if (valueTemp[0]=="T"){
		var k = f2.length;
		if(k > 0){
			for(j=0;j<k;j++){
				f2.remove(0);
			}
		}
		for(i=0; i<subcat.length; i++){
			if(subcat[i][0] == valueTemp[1]){
				var oOption = document.createElement("OPTION");
				f2.options.add(oOption);
				oOption.innerText = subcat[i][2];
				oOption.value = subcat[i][1];
			}
		}
    }  
	if(valueTemp[0]=="O"){
		var k = f2.length;
		if(k > 0){
			for(j=0;j<k;j++){
				f2.remove(0);
			}
		}
		for(i=0; i<subcat.length; i++){
			var subtable = valueTemp[1].split(",");
			for(j=0;j<subtable.length;j++){
				if(subcat[i][0] == subtable[j]){
					var oOption = document.createElement("OPTION");
					f2.options.add(oOption);
					oOption.innerText = subcat[i][2];
					oOption.value = subcat[i][1];
				}
			}
	  	}
    }
}
function makerobj(){
	if(document.form1.dobjname.value ==""){
		alert("请输入数据对象的别称!!");
		return;
	}
	var list=document.form1.tablelist;
	var list1=document.form1.tablelist1;

	var l1 = list.value;
	var l2 = list1.value;
	var tablestore = toro(l1)+","+toro(l2);
	//alert("tablestore:"+tablestore);
	var dpwvalue = "O-"+tablestore;
	
	var leftvalue = document.form1.fieldlist.value;
	var rightvalue = document.form1.fieldlist1.value;
	if((leftvalue =="")||(rightvalue=="")){
		alert("请选择关联的字段!");
		return 100;
	}
	var l1index = getalias(l1);
	var l2index = getalias(l2);
	
	var lastobj;
	
	if(document.form1.jointype[0].checked)
		lastobj = "select * from ("+objsqlarray[l1index][1]+") "+objsqlarray[l1index][2]+" left outer join ("+objsqlarray[l2index][1]+") "+objsqlarray[l2index][2]+" on ";
	else if(document.form1.jointype[1].checked)
		lastobj = "select * from ("+objsqlarray[l1index][1]+") "+objsqlarray[l1index][2]+" right outer join ("+objsqlarray[l2index][1]+") "+objsqlarray[l2index][2]+" on ";
	else
		lastobj = "select * from ("+objsqlarray[l1index][1]+") "+objsqlarray[l1index][2]+",("+objsqlarray[l2index][1]+") "+objsqlarray[l2index][2]+" where ";
	//var lastobj = "select * from ("+objsqlarray[l1index][1]+") "+objsqlarray[l1index][2]+",("+objsqlarray[l2index][1]+") "+objsqlarray[l2index][2]+" where ";
	//alert(lastobj);
	var wherecon;
	if(document.form1.jointype[0].checked)
		lastobj +=objsqlarray[l1index][2]+"."+leftvalue+"="+objsqlarray[l2index][2]+"."+rightvalue;
	else if(document.form1.jointype[1].checked)
		lastobj += objsqlarray[l2index][2]+"."+rightvalue+"="+objsqlarray[l1index][2]+"."+leftvalue;
	else
		lastobj +=objsqlarray[l1index][2]+"."+leftvalue+"="+objsqlarray[l2index][2]+"."+rightvalue;

	//alert(lastobj);
	var lastindex = objsqlarray.length;
	objsqlarray[lastindex]=new Array(dpwvalue,lastobj,"y"+lastindex);

	document.form1.objsql.value = lastobj;
	//alert(document.form1.objsql.value);
	document.form1.tablestore.value = tablestore;
	
	var oOption = document.createElement("OPTION");

	document.form1.tablelist.options.add(oOption);
	oOption.innerText = "用户定义."+document.form1.dobjname.value;
	oOption.value = dpwvalue;
	//document.form1.dobjname.value ="";
	//document.form1.tablelist1.options.add(oOption);
}

function toro(mystr){
	var s = mystr.split("-");
	return s[1];
}


function getalias(mystr){
	for(i=0;i<objsqlarray.length;i++){
		if(objsqlarray[i][0]==mystr){
			//tempstr = objsqlarry[i][1];
			return i;
		}
	}
}
function savesub(){
	if(document.form1.dobjname.value ==""){
		alert("请输入数据对象的别称!!");
		return;
	}
	makerobj();

	document.form1.action = "builderaction1.do?action=saveobj";
	document.form1.submit;
}
function nextsub(){
	if(document.form1.dobjname.value ==""){
		alert("请输入数据对象的别称!!");
		return;
	}
	var makerok=0;
	makerok=makerobj();
	if(makerok==100){
		return;
	}

	document.form1.action = "builderaction2.do";
	document.form1.submit();
}

</script>

</head>

<body class="right_date_body">
<div class="bmgl_div">
			
<form method="post" action="" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">自定义查询</div></td>
	</tr>
	<tr>
		<td height="27" valign="middle" bgcolor="#FFFFFF" align="center">
			操作表：
			<select name="tablelist" onChange="showFields()">
				<option value="">请选择表</option> 
			<%
				Builder1ActionBean k=new Builder1ActionBean(); 				  	
				List a=(List)request.getAttribute("tablelist");
				for(int i=0;i<a.size();++i){
					k=(Builder1ActionBean)a.get(i);				  		
			%>
				<option value="<%=k.getTableValueShow()%>"><%=k.getTableText()%></option> 
			<%} %>
			</select>
		</td>
		<td height="27" bgcolor="#FFFFFF" align="center">操作</td>
		<td height="27" bgcolor="#FFFFFF" align="center">
			操作表：
			<select name="tablelist1" onChange="showFields1()">  
		    	<option value="">请选择表</option> 
			<%
				List b=(List)request.getAttribute("tablelist");
				for(int i=0;i<b.size();++i){
				k=(Builder1ActionBean)b.get(i);				  		
			%>   
				<option value="<%=k.getTableValueShow()%>"><%=k.getTableText()%></option> 
			<%} %>
			</select>
		</td>
	</tr>
<%=jsbuffer%>
<%=jsbuffer1%>
	<tr bgcolor="#FFFFFF">
		<td align="center">
			<select name="fieldlist" size="10" style="width:200px;"></select>
		</td>
		<td  width="15%" align="center">
			<input type="radio" name="jointype" value="left" style="border:none;"/>左联<br/><br/>
			<input type="radio" name="jointype" value="right" style="border:none;"/>右联<br/><br/>
			<input type="radio" name="jointype" value="direct" style="border:none;" checked="checked"/>直连
		</td>
		<td height="165" align="center">
			<select name="fieldlist1" size="10" style="width:200px;"></select>
			<input type="hidden" name="objsql"/>
			<input type="hidden" name="tablestore"/>
		</td>
	</tr>
	<tr>
		<td height="27" colspan="3" bgcolor="#EFEFEF" align="center">请输入新数据对象别名(英文):<input type=text name =dobjname value='u'/></td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="nextsub()"><input type="button" value="下一步" style="width:77px; height:21px"/></a> 
	<a href="#" onclick="javascript:history.go(-1)"><input type="button" value="返回" style="width:77px; height:21px"/></a>
</p>
</body>
</html>
