var pathname = "";//����ģ���ַ
var data0,chart1,chart2;//���治ͬͼ�����͵�����
	
/**
 * ��������Ϊ�Ż�ģ���ѡ��,ͨ��ģ���ַ��ȡģ����Ϣ
 */
function getPortalOptions(){
	var portal = document.getElementById("portal").value;
	var modulename = document.getElementById("link").value;
	if(portal=="0"){
		getModule(modulename);
	}else{
		document.getElementById("tr0").style.display="none";
		document.getElementById("tr1").style.display="none";
		document.getElementById("tr2").style.display="none";
		document.getElementById("tr3").style.display="none";
		document.getElementById("tr4").style.display="none";
	}
}

/**
 * ����ģ���ַ�ı����ڵ�ֵ
 */
function changeModel(){
	pathname = document.getElementById("link").value;
}

/**
 * �ж��Ƿ������ģ���ַ֮ǰ��ֵһ��,��һ���������Ż�ģ��ѡ�����Ĳ˵�
 */
function changeModel2(){
	var pathname2 = document.getElementById("link").value;
	if(pathname!=pathname2){
		document.getElementById("portal").options[1].selected=true;
		getPortalOptions();
	}
}

/**
 * �ύ����
 * @return
 */
function submit(){
	var portal = document.getElementById("portal").value;
	if(portal=="1"){
		document.form1.submit();
		return;
	}
	var name = document.getElementById('name').value;
	
	var st = document.getElementsByName("showtype");
	if(st[2].checked==true && st[2].value==3){//ҳ��
		document.getElementById("field").value=document.getElementById("urlx2").value;
	}else{
		var checkChart = 0;//ͼ��ı��
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
		//ģ���Ӧ�ֶ�
		var moduleField = document.getElementsByName("moduleField");
		var fields = "";
		if(checkChart==0){  //data
			for(var i = 0;i<moduleField.length;i++){
				if(moduleField[i].checked==true){
					fields+=moduleField[i].value+",";
				}
			}
		}else{//Ϊͼ��
			if(checkChart==1){
				for(var i = 0;i<moduleField.length;i++){
					if(moduleField[i].tagName=="SELECT")
						fields+=moduleField[i].value+",";
				}
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
					alert('��ѡ��ģ���ֶ�');
					return;
				}
			}
		}
		if (fields == '') {
			alert('��ѡ��ģ���ֶ�');
			return;
		}
		document.getElementById("field").value=fields.substr(0,fields.length-1);
	}
	document.form1.submit();
}

/**
 * ��ȡģ����ֶ���Ϣ
 * @param operateId ģ����
 */
function getModule(operateId){
	if(operateId!=""){
		var name = operateId.substr(0,1).toUpperCase() + operateId.substr(1,operateId.length);
		XMLHttp_Jquery.sendReq("post", "../dataanalysis/getfields.do?modulename=" + name, "", function(xmlHttp){
			var fieldData = decodeURI(xmlHttp.responseText).split('XXXXX');
			if(fieldData.length>0 && fieldData!=""){
				document.getElementById("fields").innerHTML = fieldData[0];
				document.getElementById("fieldshiden").innerHTML = fieldData[0];//fieldData[1]
				document.getElementById("tr0").style.display="";
				document.getElementById("tr2").style.display="";
				document.getElementById("tr3").style.display="";
			}else{
				alert("ģ���ַ�������");
				document.getElementById("portal").options[1].selected=true;
			}
		});
	}else{
		alert("������ģ���ַ��");
		document.getElementById("portal").options[1].selected=true;
	}
}

/**
 * �û�ѡ����ʾΪͼ��
 */
function chart(){
	if(document.getElementById("fields").innerHTML==""){
		alert("����ѡ��ģ�飡");
		document.getElementsByName("showtype")[0].checked=true;
		document.getElementById("tr2").style.display="";
		document.getElementById("tr3").style.display="";
		document.getElementById("tr4").style.display="none";
		return;
	}
	if(data0==undefined){
		initChartOptions(1);
	}else{
		document.getElementById("fields").innerHTML = chart1;
	}
	document.getElementsByName("showtype2")[0].checked=true;
	document.getElementById("tr1").style.display="";
	document.getElementById("tr2").style.display="";
	document.getElementById("tr3").style.display="";
	document.getElementById("tr4").style.display="none";
}

/**
 * �û�ѡ����ʾΪ����
 */
function data(){
	if(data0!=undefined)
		document.getElementById("fields").innerHTML = data0;
	document.getElementById("tr1").style.display="none";
	document.getElementById("tr2").style.display="";
	document.getElementById("tr3").style.display="";
	document.getElementById("tr4").style.display="none";
}

/**
 * �û�ѡ����ʾΪҳ��
 */
function page(){
	document.getElementById("tr1").style.display="none";
	document.getElementById("tr2").style.display="none";
	document.getElementById("tr3").style.display="none";
	document.getElementById("tr4").style.display="";
}

/**
 * ��ʼ��ͼ���ѡ��
 * @param i ͼ������
 */
function initChartOptions(i){
	var fields = document.getElementById('fields');
	var fieldshiden = document.getElementById('fieldshiden');
	if(data0==undefined){
		data0 = fields.innerHTML;
	}else{
		fields = data0;
	}
	var childnodes = fieldshiden.childNodes;
	if(i==1){//��ͼ
		var select = document.createElement("select");
		select.name="moduleField";
		var select2 = document.createElement("select");
		select2.name="moduleField";
		for(var i = 0; i<childnodes.length; i++)
			if(childnodes[i].nodeName=="INPUT")
				select.options.add(new Option(childnodes[i+1].nodeValue, childnodes[i].value));
		var childnodes2 = fields.childNodes;
		for(var i = 0; i<childnodes2.length; ++i)
			if(childnodes2[i].nodeName=="INPUT")
				select2.options.add(new Option(childnodes2[i+1].nodeValue, childnodes2[i].value));
				
		fields.innerHTML="&nbsp;��ʾ�ֶΣ�";
		fields.appendChild(select);
		fields.innerHTML+="&nbsp;&nbsp;�����ֶΣ�";
		fields.appendChild(select2);
		chart1 = fields.innerHTML;
	}else if(i==2 || i==3){//��ͼ&����ͼ
		document.getElementById("fields").innerHTML = data0;
		fields = document.getElementById('fields');
		childnodes = fieldshiden.childNodes;
		var select = document.createElement("select");
		select.name="moduleField";
		for(var i = 0;i<childnodes.length;i++){
			if (childnodes[i].nodeName == "INPUT")
				select.options.add(new Option(childnodes[(i + 1)].nodeValue, childnodes[i].value));
		}
		fields.innerHTML="&nbsp;ͳ���ֶΣ�";
		fields.appendChild(select);
		fields.innerHTML+="&nbsp;<br>&nbsp;�����ֶΣ�";
		fields.innerHTML+=data0;
		chart2 = fields.innerHTML;
	}
}

/**
 * ����ͼ������
 * @param i ͼ������
 * @return
 */
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
