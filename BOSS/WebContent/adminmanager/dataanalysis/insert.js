
function submit(){
	var name = document.getElementById('name').value;
	if(name==null || name==''){
		alert("请输入名称");
		return;
	}
	var st = document.getElementsByName("showtype");
	if(st[2].checked==true && st[2].value==3){//页面
		document.getElementById("modelname").value=document.getElementById("urlx").value;
		document.form1.action="datainsert.do";
		document.form1.submit();
	}else if(document.getElementsByName("modelname")[0].value.indexOf("empty")>-1 || document.getElementsByName("modelname")[0].value==""){
		alert("请重新选择模块地址!");
	}else{
		var checkChart = 0;//图表的编号
		if(st[1].checked == true){
			var st2 = document.getElementsByName("showtype2");
			for(var j=0; j<st2.length; j++){
				if(st2[j].checked==true){
					st[1].value = '2-'+ st2[j].value;
					checkChart = st2[j].value;
					break;
				}
			}
		}
		//moduleField
		var moduleField = document.getElementsByName("moduleField");
		var fields = "";
		if(checkChart==0){  //data
			for(var i = 0;i<moduleField.length;i++){
				if(moduleField[i].checked==true){
					fields+=moduleField[i].value+",";
				}
			}
		}else{//为图表
			if(checkChart==1){
			//	for(var i = 0;i<moduleField.length;i++){
					fields+=moduleField[0].value+","+moduleField[1].value+",";
			//	}
			}else if(checkChart==2 || checkChart==3){
				var fieldtemp = false;
				for(var i = 0;i<moduleField.length;i++){
					if(moduleField[i].tagName == "SELECT") {
						fields += moduleField[i].value + ",";
					}else if(moduleField[i].tagName == "INPUT" && moduleField[i].checked == true) {
						fields += moduleField[i].value + ",";
						fieldtemp = true;
					}						
				}
				if(fieldtemp == false){
					alert('请选择模块字段');
					return;
				}
			}
		}
		if (fields == '') {
			alert('请选择模块字段');
			return;
		}
		document.getElementById("field").value=fields.substr(0,fields.length-1);
		document.form1.submit();
	}
}

function getmodule(operateId){
	if(operateId!=""){
		var name = operateId.substr(0,1).toUpperCase() + operateId.substr(1,operateId.length);
		XMLHttp.sendReq("post", "getfields.do?modulename=" + name, "", function(xmlHttp){
			var fieldData = decodeURI(xmlHttp.responseText).split('XXXXX');
			document.getElementById("fields").innerHTML = fieldData[0];
			document.getElementById("fieldshiden").innerHTML = fieldData[0];
		});
	}
}

var data0,chart1,chart2;
function chart(){
	if(document.getElementById("fields").innerHTML==""){
		alert("请先选择模块！");
		document.getElementsByName("showtype")[0].checked=true;
		document.getElementById("moudlename").style.display="";
		document.getElementById("row").style.display="";
		document.getElementById("fieldtr").style.display="";
		document.getElementById("urltd").style.display="none";
		return;
	}
	if(data0==undefined){
		initChartOptions(1);
	}else{
		document.getElementById("fields").innerHTML = chart1;
	}
	document.getElementsByName("showtype2")[0].checked=true;
	document.getElementById("chart").style.display="";
	document.getElementById("moudlename").style.display="";
	document.getElementById("row").style.display="";
	document.getElementById("fieldtr").style.display="";
	document.getElementById("urltd").style.display="none";
}

function data(){
	if(data0!=undefined)
		document.getElementById("fields").innerHTML = data0;
	document.getElementById("chart").style.display="none";
	document.getElementById("moudlename").style.display="";
	document.getElementById("row").style.display="";
	document.getElementById("fieldtr").style.display="";
	document.getElementById("urltd").style.display="none";
}

function page(){
	document.getElementById("moudlename").style.display="none";
	document.getElementById("row").style.display="none";
	document.getElementById("fieldtr").style.display="none";
	document.getElementById("chart").style.display="none";
	document.getElementById("urltd").style.display="";
}

function initChartOptions(i){
	var fields = document.getElementById('fields');
	var fieldshiden = document.getElementById('fieldshiden');
	if(data0==undefined){
		data0 = fields.innerHTML;
	}else{
		fields = data0;
	}
	var childnodes = fieldshiden.childNodes;
	if(i==1){//饼图
		var select = document.createElement("<select name='moduleField'></select>");
		var select2 = document.createElement("<select name='moduleField'></select>");
		for(var i = 0; i<childnodes.length; i++)
			if(childnodes[i].nodeName=="INPUT")
				select.options.add(new Option(childnodes[i+1].nodeValue, childnodes[i].value));
		var childnodes2 = fields.childNodes;
		for(var i = 0; i<childnodes2.length; ++i)
			if(childnodes2[i].nodeName=="INPUT")
				select2.options.add(new Option(childnodes2[i+1].nodeValue, childnodes2[i].value));
				
		fields.innerHTML="&nbsp;显示字段：";
		fields.appendChild(select);
		fields.innerHTML+="&nbsp;&nbsp;数据字段：";
		fields.appendChild(select2);
		chart1 = fields.innerHTML;
	}else if(i==2 || i==3){//柱图&折线图
		document.getElementById("fields").innerHTML = data0;
		fields = document.getElementById('fields');
		childnodes = fieldshiden.childNodes;
		var select = document.createElement("<select name='moduleField'></select>");
		for(var i = 0;i<childnodes.length;i++){
			if (childnodes[i].nodeName == "INPUT")
				select.options.add(new Option(childnodes[(i + 1)].nodeValue, childnodes[i].value));
		}
		fields.innerHTML="&nbsp;统计字段：";
		fields.appendChild(select);
		fields.innerHTML+="&nbsp;<br>&nbsp;数据字段：";
		fields.innerHTML+=data0;
		chart2 = fields.innerHTML;
	}
}

function changeChart(i){
	if(i==1){
		document.getElementById('fields').innerHTML=chart1;
	}else if(i==2 || i==3){
		if(chart2!=undefined){
			document.getElementById('fields').innerHTML=chart2;
		}else{
			initChartOptions(i);
		}
	}
}
