//删除子表中所有行
function deleteAllRows(tableName){
	var result=document.getElementById(tableName);
	while(result.childNodes.length>0){
		result.removeChild(result.childNodes[0]);
	}
}

//为子表增加行，并将指定的数据加入到该行，Data为以XML包装的deta数据包,className为行的风格
//visableCols为不显示的行的名称数组
//两个className表示交错色风格
function addTableRows(tableName,data,className1,className2,visableCols){
	var flag=0;
	
	//设置不显示的数据存储的数组
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
				//如果数据为不显示，则存入数组中
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

// 设置浏览页面table中的间隔色
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

//根据一行数据（即一个row）中某列的name属性获得与该名称匹配的列的value属性
//field为row中列的集合，name为需要查询的名称
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

//将表的某列设为选择框，值为该列原先内容
function setTableCheckBox(tableName,colsName,rowNumber){
	var table=document.getElementById(tableName);
	for(var i=0;i<rowNumber;i++){
		setCellCheckBox(colsName+i);
	}
}

//将指定的单元格设为checkbox类型
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

//将指定的单元格设为链接
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

//将指定的单元格设为下载链接
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

//指定单元格内容
function setCellText(cellName,cellText){
	var cell=document.getElementById(cellName);
	cell.innerText=cellText;
	//for - firefox
	cell.textContent=cellText;
}

//将指定的行设为链接
function setRowLink(rowName,linkName,target){
	var row=document.getElementById(rowName);
	row.onclick=function(){
		location.href=linkName;
	};
	row.style.cursor="hand";
}

//将指定的单元格设为特殊链接，即链接显示名称一样，但链接不同
//例如在“下载”或“编辑”等地方使用
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