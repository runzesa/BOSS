var ids = "";
var insertselectid = "";

/**
 * 获取url参数
 * @param pra
 * @return
 */
function getPra(pra){
	var usrs=window.location.search;//获取？号后的值
	var stcstr=new Array();//定义数组保存获取的URL信息
	var stkey=new Array();
	var st=new Array();
	var stc;
	if(usrs.indexOf("?")!=-1){
		stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
		if(stc.indexOf("&")!=-1){//处理多个参数
			stcstr=stc.split("&");  
			for(var i=0; i<stcstr.length; i++){
				stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));//截取=号前的字串
				st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);//截取=号后的字串
			}
		}else{
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
			stkey[0]=stc.substring(0,stc.lastIndexOf("="));//截取=号前的字串
			st[0]=stc.substring(stc.indexOf("=")+1,stc.length);//截取=号后的字串
		}
	}
	for(var i=0;i<stkey.length;i++)
		if(stkey[i]==pra)
			return formName=st[i];
}

/**
 * 获取top链接的子菜单
 */
function getChildLinks(id){
	window.frames[0].location.href="menutree.jsp?roleId="+getPra("roleid")+"&topid="+id;
}

/**
 * 获取模块的操作信息
 * @param nodename
 * @param val
 */
function getMoodule(nodename,val){
	ids="";
	insertselectid="";
	document.getElementById("title").innerText="您所选的菜单是："+nodename;
	if(isNaN(val)){
		document.getElementById("title").innerHTML = document.getElementById("title").innerText+"</br>"+"此菜单无操作！";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
		document.getElementById("subbutton").style.display="none";
	}else{
		XMLHttp_Jquery.sendReq('GET', '../power_new/select.do?act=moduleMethod&id='+val+'&roleid='+getPra('roleid'), '', createData);
	}
}

/**
 * 解析xml根据模块的操作画页面
 * @param xmlObj
 */
function createData(xmlObj){
	var xml = xmlObj.responseXML;
	var nodes = $(xml).find("node");
	var tbody = document.getElementById("nodes");
	for(var i=tbody.rows.length-1;i>=0;i--){
		tbody.deleteRow(i);
	}
	document.getElementById("hiddens").innerHTML="";
	if(nodes.length>0){
		document.getElementById("subbutton").style.display="";
		document.getElementById("action").style.display="";
		document.getElementById("select").style.display="none";
		
		for(var i=0;i<nodes.length;i++){
			createNode(nodes[i]);
		}
	}else{
		document.getElementById("title").innerHTML = document.getElementById("title").innerText+"</br>"+"此菜单无操作！";
		document.getElementById("subbutton").style.display="none";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
	}
	ids = ids.substr(0,ids.length-1);
	document.getElementById("operateids").value=ids;
}

/**
 * 创建模块操作的td
 * @param node
 */
function createNode(node){
	var id = node.getAttribute("id"); 
	ids+=id+","
	var name = node.getAttribute("name");
	var method_name = node.getAttribute("method_name");
	var modulename = node.getAttribute("modulename");
	var moduleid = node.getAttribute("moduleid");
	var type = node.getAttribute("type");
	
	var text = document.createTextNode(" "+name);
	var input = document.createElement("input");
	
	input.type="checkbox";
	input.name="operateid";
	input.id="operateid";
	input.value=id;
	
	var br = document.createElement("br");
	
	var nodes = document.getElementById("hiddens");
	if(method_name != "insertSelectEdit" && method_name != "updateSelectEdit")
		nodes = getInsertElement();
	if(method_name=="select"){
		input.onclick=returnFunction(input);
		var sql = node.getAttribute("sql");
		var datatype = node.getAttribute("datatye");
		var sid = node.getAttribute("sid");
		
		var sel2 = document.getElementById("datatype");
		for(var i=0;i<sel2.options.length;i++){
			if(sel2.options[i].value==datatype){
				sel2.options[i].selected=true;
				break;
			}
		}
		document.getElementById("sid").value=sid;
		document.getElementById("sqlcontent").innerText=sql;
		nodes.appendChild(input);
		nodes.appendChild(text);
		if(type=="true")
			document.getElementById("select").style.display="";
	}else{
		if(method_name=="insertSelectEdit"){
			input.onclick=function(){return false;}
			insertselectid=id;
		}
		nodes.appendChild(input);
		nodes.appendChild(text);
	}
	
	if(type=="true"){
		input.checked = true;
	}
}

/**
 * 获取存储checkbox的td
 * @return
 */
function getInsertElement(){
	var nodes = document.getElementById("nodes");
	
	var trs = nodes.rows;
	var returnObject;
	if(trs.length>0){
		var tr0 = trs[trs.length-1];
		if(tr0.cells.length==2){
			var tr = nodes.insertRow(-1);
			var td = tr.insertCell(-1);
			td.width="50%";
			returnObject = td;
		}else{
			var td = tr0.insertCell(-1);
			td.width="50%";
			returnObject = td;
		}
	}else{
		var tr = nodes.insertRow(-1);
		var td = tr.insertCell(-1);
		td.width="50%";
		returnObject = td;
	}
	return returnObject;
}

/**
 * 返回checkbox的事件
 * @param obj
 * @return
 */
function returnFunction(obj){
	return function(){
		clickCheckbox(obj);
	}
}

/**
 * checkbox事件,若为填充就无反应
 * @param obj
 */
function clickCheckbox(obj){
	var operateids = document.getElementsByName("operateid");
	for(var i=0;i<operateids.length;i++)
		if(operateids[i].value==insertselectid){
			operateids[i].checked=obj.checked;
		}
		
	if(obj.checked)
		document.getElementById("select").style.display="";
	else
		document.getElementById("select").style.display="none";
}

/**
 * 保存操作权限
 */
function sub2(){
	var operateids = document.getElementsByName("operateids")[0].value;
	var datatype = document.getElementsByName("datatype")[0].value;
	var sid = document.getElementsByName("sid")[0].value;
	var sqlcontent = document.getElementsByName("sqlcontent")[0].value;
	var operateid = document.getElementsByName("operateid");
	
	var temp = "";
	if(operateid!=undefined)
		for(var i=0;i<operateid.length;i++)
			if(operateid[i].checked){
				temp+=operateid[i].value+",";
			}
	temp=temp.substr(0,temp.length-1);
	
	var ajaxurl = "../power_new/powerinsert.do?act=roleleft&rolename="+getPra('roleid')+"&roleName2="+getPra('roleName')+
		"&operateids="+operateids+"&datatype="+datatype+"&operateid="+temp+"&sid="+encodeURI(sid)+
		"&sqlcontent="+encodeURI(sqlcontent);
	
	XMLHttp_Jquery.sendReq('post', ajaxurl, '', function(xmlObj){
		if(xmlObj.responseText=="true")
			alert("保存成功！");
		else
			alert("保存失败！");
	});
}

/**
 * 初始化页面时获取首页的top链接
 */
function getTopLinks(){
	var tbody = document.getElementById("toplinks");
	for(var i=tbody.rows.length-1;i>=0;i--){
		tbody.deleteRow(i);
	}
	XMLHttp_Jquery.sendReq('post', 'selecttree.do?act=root', '', function(xmlObject){
		var nodes = xmlObject.responseXML.getElementsByTagName("node");
		var length=nodes.length;
		if(nodes.length%5!=0){
			length = nodes.length+(5-nodes.length%5);
		}
		if(nodes.length>0){
			for(var i=0;i<length;i++){
				if(nodes[i]!=null && nodes[i]!=undefined)
					createTopLinks(nodes[i]);
				else
					createTopLinks();
			}
		}
	});
}

/**
 * 获取存储top标签的td
 * @return td
 */
function getInsertElement2(){
	var nodes = document.getElementById("toplinks");
	
	var trs = nodes.rows;
	var returnObject;
	if(trs.length>0){
		var tr0 = trs[trs.length-1];
		if(tr0.cells.length==5){
			var tr = nodes.insertRow(-1);
			tr.style.background="#FFFFFF";
			var td = tr.insertCell(-1);
			td.width="84px";
			td.height="20px";
			td.style.paddingLeft="5px";
			td.style.background="#FFFFFF";
			returnObject = td;
		}else{
			var td = tr0.insertCell(-1);
			td.width="84px";
			td.height="20px";
			td.style.paddingLeft="5px";
			td.style.background="#FFFFFF";
			returnObject = td;
		}
	}else{
		var tr = nodes.insertRow(-1);
		tr.style.background="#FFFFFF";
		var td = tr.insertCell(-1);
		td.width="84px";
		td.height="20px";
		td.style.paddingLeft="5px";
		td.style.background="#FFFFFF";
		returnObject = td;
	}
	return returnObject;
}

/**
 * 初始化top标签列表
 * @param nodes 标签内容
 */
function createTopLinks(nodes){
	if(nodes!=null && nodes!=undefined){
		var td = getInsertElement2();
		var a = document.createElement("a");
		a.href=nodes.getAttribute("url");
		a.appendChild(document.createTextNode(nodes.getAttribute("text")));
		td.appendChild(a);
	}else{
		var td = getInsertElement2();
	}
}

/**
 * 前往模块列表
 * @param id
 * @param rname
 */
function goto1(id,rname){
	document.location="../power_new/index2.jsp?act=index&roleid="+id+"&roleName="+rname;
}

/**
 * 前往原权限列表
 * @param id
 */
function goto2(id){
	window.location="../power/select.do?roleid="+id;
}