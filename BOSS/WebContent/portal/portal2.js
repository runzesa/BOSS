// JavaScript Document
//发送请求
function pageLoad()
{
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=1', '', portal1);	
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=2', '', portal2);	
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=3', '', portal3);	
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=4', '', portal4);	
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=5', '', portal5);	
			XMLHttp.sendReq('GET', 'portal2select.jsp?portal=6', '', portal6);	
}

//****************************************************************
//解析servlet发回的XML文件
function deleteAllRowsx(tableName){
	var result=document.getElementById(tableName);
	while(result.childNodes.length>0){
		result.removeChild(result.childNodes[0]);
	}
}

function getServerTableRowsx(xmlObject){
	var xmlDoc=xmlObject.responseXML;
	var rows=xmlDoc.getElementsByTagName("row");
	return rows;
}

function addTableRowsx(tableName,data,className1,className2,visableCols){
	var flag=0;
	var length =0;
	var visableData=new Array(visableCols.length);
	for(var k=0;k<visableCols.length;k++){
		visableData[k]=new Array(data.length);
	}
	if(data.length<6){
		length = data.length;
	}else{
		length =6;
	}
	for(var i=0;i<length;i++){
		var field=data[i].getElementsByTagName("field");
		var row=document.createElement("tr");
		if(flag==0){
			if(className1!=null){
				row.setAttribute("class",className1);
				row.setAttribute("className",className1);
			}
			flag=1;
		}else{
			if(className2!=null){
				row.setAttribute("class",className2);
				row.setAttribute("className",className2);
			}
			flag=0;
		}
		for(var j=0;j<field.length;j++){
			visableFlag=1;
			for(var t=0;t<visableCols.length;t++){
				if(visableCols[t]==field[j].getAttribute("name")){
					visableFlag=0;
					visableData[t][i]=field[j].getAttribute("value");
					break;
				}
			}
			if(visableFlag==1){
				var cell=document.createElement("td");
				cell.setAttribute("id",field[j].getAttribute("name")+i);
				var textNode=document.createTextNode(field[j].getAttribute("value"));
				cell.appendChild(textNode);
				row.appendChild(cell);
			}
		}
		document.getElementById(tableName).appendChild(row);
	}
	return visableData;
}
//************************************************************************


function selectdata1(xmlObject){
	deleteAllRowsx("selectdata1");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata1",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();
	}
}
function selectdata1chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart1").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}

function selectdata2(xmlObject){
	deleteAllRowsx("selectdata2");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata2",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();		
	}
}
function selectdata2chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart2").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}

function selectdata3(xmlObject){
	deleteAllRowsx("selectdata3");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata3",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();		
	}
}
function selectdata3chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart3").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}

function selectdata4(xmlObject){
	deleteAllRowsx("selectdata4");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata4",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();		
	}
}
function selectdata4chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart4").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}

function selectdata5(xmlObject){
	deleteAllRowsx("selectdata5");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata5",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();		
	}
}
function selectdata5chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart5").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}

function selectdata6(xmlObject){
	deleteAllRowsx("selectdata6");
	var rows=getServerTableRowsx(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRowsx("selectdata6",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();		
	}
}
function selectdata6chart(xmlObject){
	var imageUrl=xmlObject.responseText;
	document.getElementById("chart6").innerHTML="<img border=0 height=100% src='"+imageUrl+"'/>";
}
//*************************************************


function portal1(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){		
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name1").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata1chart);
			}else{
				document.getElementById("name1").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata1);
			}
		}else{
			document.getElementById("name1").innerHTML = shuzu[0];
		}
		
	}
}


function portal2(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name2").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata2chart);
			}else{
				document.getElementById("name2").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata2);
			}
		}else{
			document.getElementById("name2").innerHTML = shuzu[0];
		}
		
	}
}

function portal3(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name3").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata3chart);
			}else{
				document.getElementById("name3").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata3);
			}
		}else{
			document.getElementById("name3").innerHTML = shuzu[0];
		}
		
	}
}


function portal4(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name4").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata4chart);
			}else{
				document.getElementById("name4").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata4);
			}
		}else{
			document.getElementById("name4").innerHTML = shuzu[0];
		}
		
	}
}


function portal5(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name5").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata5chart);
			}else{
				document.getElementById("name5").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata5);
			}
		}else{
			document.getElementById("name5").innerHTML = shuzu[0];
		}
		
	}
}

function portal6(xmlObject)
{
	var Result =xmlObject.responseText;
	if(Result != "null#null")
	{
		var shuzu = new Array("","");
		shuzu = Result.split("#");
		var mok = shuzu[0].replace(/(^\s*)|(\s*$)/g, "");
		if(mok !="未定义功能模块"){
			var shuzulink=new Array();
			shuzulink=shuzu[1].split(".");
			var linktype=shuzulink[shuzulink.length-1].replace(/(^\s*)|(\s*$)/g, "");
			if(linktype!="select"){
				document.getElementById("name6").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/"+linktype+".jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/'+linktype+'.do', '', selectdata6chart);
			}else{
				document.getElementById("name6").innerHTML = "<a href='../"+shuzulink[shuzulink.length-2]+"/index.jsp'  target='main'>"+shuzu[0]+"</a>";
				XMLHttp.sendReq('GET','../'+shuzulink[shuzulink.length-2]+'/select.do', '', selectdata6);
			}
		}else{
			document.getElementById("name6").innerHTML = shuzu[0];
		}
		
	}
}


