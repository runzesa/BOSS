var ids = "";//模块原有的操作保存时后台对比验证是新增还是更新/删除
var insertselectid = "";

/**
 * 提交保存
 */
function sub(){
	var rolename = document.getElementsByName("rolename")[0].value;
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
	var ajaxurl = "../power_new/powerinsert.do?rolename="+rolename+"&operateids="+operateids+"&datatype="+datatype+
		"&operateid="+temp+"&sid="+encodeURI(sid)+"&sqlcontent="+encodeURI(sqlcontent);
	XMLHttp.sendReq('post', ajaxurl, '', function(xmlObj){
		if(xmlObj.responseText=="true")
			alert("保存成功！");
		else
			alert("保存失败！");
	});
}

/**
 * 获取url参数
 * @param pra 参数名
 * @return 参数值
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
 * 获取模块信息
 * @param id 模块id
 */
function getMoodule(id){
	ids="";
	insertselectid="";
	XMLHttp.sendReq('GET', 'select.do?act=moduleMethod&id='+id+'&roleid='+getPra('roleid'), '', createData);
}

/**
 * 根据获取的模块信息画出右侧页面
 * @param xmlObj 请求得到的模块信息xml数据
 */
function createData(xmlObj){
	var xml = xmlObj.responseXML;
	var nodes = xml.getElementsByTagName("node");
	var tbody = document.getElementById("nodes");
	for(var i=tbody.rows.length-1;i>=0;i--){
		tbody.deleteRow(i);
	}
	document.getElementById("hiddens").innerHTML="";
	if(nodes.length>0){
		document.getElementById("title").innerText="您所选的模块是："+nodes[0].getAttribute("modulename");
		document.getElementById("subbutton").style.display="";
		document.getElementById("action").style.display="";
		document.getElementById("select").style.display="none";
		for(var i=0;i<nodes.length;i++){
			createNode(nodes[i]);
		}
	}else{
		document.getElementById("title").innerText="您所选的模块未添加操作！";
		document.getElementById("subbutton").style.display="none";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
	}
	ids = ids.substr(0,ids.length-1);
	document.getElementById("operateids").value=ids;
}

/**
 * 创建右侧的多选框
 * @param node 模块方法信息
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
		if(method_name=="insertSelectEdit" ){
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
 * 返回要创建多选框的td
 * @return td
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
 * 返回方法:点击多选框的事件
 * @param obj 点击的多选框
 * @return clickCheckbox(obj)方法
 */
function returnFunction(obj){
	return function(){
		clickCheckbox(obj);
	}
}

/**
 * 点击多选框的事件:是否为编辑填充
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
 * 返回菜单列表的跳转
 * @param id 角色id
 * @param rname 角色名
 */
function goto1(id,rname){
	document.location="../left/menutree_role.jsp?roleid="+id+"&roleName="+rname;
}

/**
 * 返回高级的跳转
 * @param id 角色id
 */
function goto2(id){
	document.location="../power/select.do?roleid="+id;
}