var ids = "";
var insertselectid = "";

/**
 * ��ȡurl����
 * @param pra
 * @return
 */
function getPra(pra){
	var usrs=window.location.search;//��ȡ���ź��ֵ
	var stcstr=new Array();//�������鱣���ȡ��URL��Ϣ
	var stkey=new Array();
	var st=new Array();
	var stc;
	if(usrs.indexOf("?")!=-1){
		stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//��ȡ?�ŵ��ִ�
		if(stc.indexOf("&")!=-1){//����������
			stcstr=stc.split("&");  
			for(var i=0; i<stcstr.length; i++){
				stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));//��ȡ=��ǰ���ִ�
				st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);//��ȡ=�ź���ִ�
			}
		}else{
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//��ȡ?�ŵ��ִ�
			stkey[0]=stc.substring(0,stc.lastIndexOf("="));//��ȡ=��ǰ���ִ�
			st[0]=stc.substring(stc.indexOf("=")+1,stc.length);//��ȡ=�ź���ִ�
		}
	}
	for(var i=0;i<stkey.length;i++)
		if(stkey[i]==pra)
			return formName=st[i];
}

/**
 * ��ȡtop���ӵ��Ӳ˵�
 */
function getChildLinks(id){
	window.frames[0].location.href="menutree.jsp?roleId="+getPra("roleid")+"&topid="+id;
}

/**
 * ��ȡģ��Ĳ�����Ϣ
 * @param nodename
 * @param val
 */
function getMoodule(nodename,val){
	ids="";
	insertselectid="";
	document.getElementById("title").innerText="����ѡ�Ĳ˵��ǣ�"+nodename;
	if(isNaN(val)){
		document.getElementById("title").innerHTML = document.getElementById("title").innerText+"</br>"+"�˲˵��޲�����";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
		document.getElementById("subbutton").style.display="none";
	}else{
		XMLHttp_Jquery.sendReq('GET', '../power_new/select.do?act=moduleMethod&id='+val+'&roleid='+getPra('roleid'), '', createData);
	}
}

/**
 * ����xml����ģ��Ĳ�����ҳ��
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
		document.getElementById("title").innerHTML = document.getElementById("title").innerText+"</br>"+"�˲˵��޲�����";
		document.getElementById("subbutton").style.display="none";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
	}
	ids = ids.substr(0,ids.length-1);
	document.getElementById("operateids").value=ids;
}

/**
 * ����ģ�������td
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
 * ��ȡ�洢checkbox��td
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
 * ����checkbox���¼�
 * @param obj
 * @return
 */
function returnFunction(obj){
	return function(){
		clickCheckbox(obj);
	}
}

/**
 * checkbox�¼�,��Ϊ�����޷�Ӧ
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
 * �������Ȩ��
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
			alert("����ɹ���");
		else
			alert("����ʧ�ܣ�");
	});
}

/**
 * ��ʼ��ҳ��ʱ��ȡ��ҳ��top����
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
 * ��ȡ�洢top��ǩ��td
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
 * ��ʼ��top��ǩ�б�
 * @param nodes ��ǩ����
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
 * ǰ��ģ���б�
 * @param id
 * @param rname
 */
function goto1(id,rname){
	document.location="../power_new/index2.jsp?act=index&roleid="+id+"&roleName="+rname;
}

/**
 * ǰ��ԭȨ���б�
 * @param id
 */
function goto2(id){
	window.location="../power/select.do?roleid="+id;
}