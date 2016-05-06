//ɾ���ӱ���������
function deleteAllRows(tableName){
	var result=document.getElementById(tableName);
	while(result.childNodes.length>0){
		result.removeChild(result.childNodes[0]);
	}
}

//Ϊ�ӱ������У�����ָ�������ݼ��뵽���У�DataΪ��XML��װ��deta���ݰ�,classNameΪ�еķ��
//visableColsΪ����ʾ���е���������
//����className��ʾ����ɫ���
function addTableRows(tableName,data,className1,className2,visableCols){
	var flag=0;
	
	//���ò���ʾ�����ݴ洢������
	var visableData=new Array(visableCols.length);
	for(var k=0;k<visableCols.length;k++){
		visableData[k]=new Array(data.length);
	}
	
	for(var i=0;i<data.length;i++){
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
				//�������Ϊ����ʾ�������������
				if(visableCols[t]==field[j].getAttribute("name")){
					visableFlag=0;
					visableData[t][i]=field[j].getAttribute("value");
					break;
				}
			}
			if(visableFlag==1){
				var cell=document.createElement("td");
				cell.setAttribute("id",field[j].getAttribute("name")+i);
				if (field[j].getAttribute("value") != '') {
					var textNode = document.createTextNode(field[j].getAttribute("value"));
					cell.appendChild(textNode);
				} else {
					cell.innerHTML = "&nbsp;";
				}
				
				row.appendChild(cell);
			}
		}
		row.setAttribute("id",tableName+"Row"+i);
		document.getElementById(tableName).appendChild(row);
	}
	return visableData;
}

// �������ҳ��table�еļ��ɫ
function setSpaceColor(){
	var table = document.getElementById("selectdata");
	var eachtr = table.getElementsByTagName("tr");
	for(var i=0;i<eachtr.length;++i){
		eachtr[i].onmouseover = function(){
			this.className = "row3";
		}
		if(i%2==0)
			eachtr[i].onmouseout = function(){
				this.className = "row1";
			}
		else
			eachtr[i].onmouseout = function(){
				this.className = "row2";
			}
	}
}

//����һ�����ݣ���һ��row����ĳ�е�name���Ի���������ƥ����е�value����
//fieldΪrow���еļ��ϣ�nameΪ��Ҫ��ѯ������
function getFieldValue(field,name){
	var fieldValue;
	for(var i=0;i<field.length;i++){
		if(field[i].getAttribute("name")==name){
			fieldValue=field[i].getAttribute("value");
			break;
		}		
	}
	return fieldValue;
}

//�����ĳ����Ϊѡ���ֵΪ����ԭ������
function setTableCheckBox(tableName,colsName,rowNumber){
	var table=document.getElementById(tableName);
	for(var i=0;i<rowNumber;i++){
		setCellCheckBox(colsName+i);
	}
}

//��ָ���ĵ�Ԫ����Ϊcheckbox����
function setCellCheckBox(cellName){
	var cell=document.getElementById(cellName);
	var textNode=document.createElement("input");
	textNode.setAttribute("type","checkbox");
	textNode.setAttribute("id","checkbox");
	//for - firefox
	var v = cell.innerText;
	if(v==undefined)
		v = cell.textContent;
	textNode.setAttribute("value",v);
	cell.innerText="";
	//for - firefox
	cell.textContent="";
	cell.appendChild(textNode);
}

//��ָ���ĵ�Ԫ����Ϊ����
function setCellLink(cellName,linkName,target){
	var cell=document.getElementById(cellName);
	var textNode;
	if(target==null){
		target="_self";
	}
	var textData = cell.innerText;
	//for - firefox
	if(textData==undefined)
		textData = cell.textContent;
	textNode="<a href='"+linkName+"' target="+target+">"+textData+"</a>";
	cell.innerText="";
	//for - firefox
	cell.textContent = "";
	cell.innerHTML=textNode;
}

//��ָ���ĵ�Ԫ����Ϊ��������
function setFileLink(cellName){
	var fileName = document.getElementById(cellName).innerText;
	//for - firefox
	if(fileName==undefined)
		fileName = document.getElementById(cellName).textContent;
	var fileStr =fileName.split(";");
	document.getElementById(cellName).innerText = '';
	//for - firefox
	document.getElementById(cellName).textContent = '';
	for (i = 0; i < fileStr.length; ++i) {
		var fileValue = fileStr[i].split(",");
		var link = "window.open('../util/download.jsp?path=" + 
			fileStr[i]+"','','location=no,toolbar=no,status=no');";
		var fileName = fileValue[0];
		var pNode = document.getElementById(cellName);
		pNode.innerHTML = pNode.innerHTML+"<a href='#' onclick=\""+link+"\">" + fileName + "</a>&nbsp&nbsp&nbsp";	
	}
}

//ָ����Ԫ������
function setCellText(cellName,cellText){
	var cell=document.getElementById(cellName);
	cell.innerText=cellText;
	//for - firefox
	cell.textContent=cellText;
}

//��ָ��������Ϊ����
function setRowLink(rowName,linkName,target){
	var row=document.getElementById(rowName);
	row.onclick=function(){
		location.href=linkName;
	};
	row.style.cursor="hand";
}

//��ָ���ĵ�Ԫ����Ϊ�������ӣ���������ʾ����һ���������Ӳ�ͬ
//�����ڡ����ء��򡰱༭���ȵط�ʹ��
function setSpecaillink(cellName,linkName,specailName,target){
	var cell=document.getElementById(cellName);
	var textNode;
	if(target==null){
		target="_self";
	}
	textNode="<a href='"+linkName+"' target="+target+">"+specailName+"</a>";
	//for - firefox
	cell.textContent = "";
	cell.innerText="";
	cell.innerHTML=textNode;
}