var ids = "";//ģ��ԭ�еĲ�������ʱ��̨�Ա���֤���������Ǹ���/ɾ��
var insertselectid = "";

/**
 * �ύ����
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
			alert("����ɹ���");
		else
			alert("����ʧ�ܣ�");
	});
}

/**
 * ��ȡurl����
 * @param pra ������
 * @return ����ֵ
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
 * ��ȡģ����Ϣ
 * @param id ģ��id
 */
function getMoodule(id){
	ids="";
	insertselectid="";
	XMLHttp.sendReq('GET', 'select.do?act=moduleMethod&id='+id+'&roleid='+getPra('roleid'), '', createData);
}

/**
 * ���ݻ�ȡ��ģ����Ϣ�����Ҳ�ҳ��
 * @param xmlObj ����õ���ģ����Ϣxml����
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
		document.getElementById("title").innerText="����ѡ��ģ���ǣ�"+nodes[0].getAttribute("modulename");
		document.getElementById("subbutton").style.display="";
		document.getElementById("action").style.display="";
		document.getElementById("select").style.display="none";
		for(var i=0;i<nodes.length;i++){
			createNode(nodes[i]);
		}
	}else{
		document.getElementById("title").innerText="����ѡ��ģ��δ��Ӳ�����";
		document.getElementById("subbutton").style.display="none";
		document.getElementById("action").style.display="none";
		document.getElementById("select").style.display="none";
	}
	ids = ids.substr(0,ids.length-1);
	document.getElementById("operateids").value=ids;
}

/**
 * �����Ҳ�Ķ�ѡ��
 * @param node ģ�鷽����Ϣ
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
 * ����Ҫ������ѡ���td
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
 * ���ط���:�����ѡ����¼�
 * @param obj ����Ķ�ѡ��
 * @return clickCheckbox(obj)����
 */
function returnFunction(obj){
	return function(){
		clickCheckbox(obj);
	}
}

/**
 * �����ѡ����¼�:�Ƿ�Ϊ�༭���
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
 * ���ز˵��б����ת
 * @param id ��ɫid
 * @param rname ��ɫ��
 */
function goto1(id,rname){
	document.location="../left/menutree_role.jsp?roleid="+id+"&roleName="+rname;
}

/**
 * ���ظ߼�����ת
 * @param id ��ɫid
 */
function goto2(id){
	document.location="../power/select.do?roleid="+id;
}