var selectedCheckbox = "";
var tab_id="";
var left = "";
var right = "";
	
/**
 * 保存提交
 */
function submit(){
	selectedCheckbox=selectedCheckbox.substr(0,selectedCheckbox.length-1);
	var arr1 = selectedCheckbox.split(",");
	var temp="";
	if(arr1.length!=4){
		for(var i=0;i<4;i++){
			if(arr1[i]==null || arr1[i]==undefined || arr1[i]=="")
				temp+="0,";
			else
				temp+=arr1[i]+",";
		}
	}
	if(temp!="")
		selectedCheckbox = temp.substr(0,temp.length-1);
	selectedCheckbox+=";";
	document.getElementById("style").value=left+tab_id+":"+selectedCheckbox+right;
	
	document.form1.submit();
}

/**
 * 更改标签页
 * @param tabid
 * @return
 */
function changeTitle(tabid){
	selectedCheckbox="";
	left="";
	right="";
	if(tabid==null || tabid==undefined || tabid.value=="-1"){
		tabid = 0;
	}else{
		tabid =tabid.value;
	}
	tab_id=tabid;
	var tabStyle = getTabStyle(tabid);
	setCheckboxs(tabStyle);
}

//某一标签页的样式
function getTabStyle(tabid){
	if(style==null || style==undefined || style=="null"){
		style="";
		return "";
	}
	var returnVal = "";
	var tabArr1 = style.split(";");
	var b=false;
	for(var i=0;i<tabArr1.length;i++){
		var tabStyle = tabArr1[i];
		if(tabStyle!=""){
			var tabArr2 = tabStyle.split(":");
			if(tabArr2.length==2&& tabArr2[0]==tabid){
				returnVal = tabArr2[1];
				b=true;
				continue;
			}
			if(!b){
				left+=tabStyle+";";
			}else{
				right+=tabStyle+";";
			}
		}
	}
	return returnVal;
}

//设置到checkbox
function setCheckboxs(tabStyle){
	if(tabStyle==null || tabStyle==undefined)
		tabStyle="0,0,0,0";
	var styleArr1 = tabStyle.split(",");
	
	var checkboxs = document.getElementsByName("datacheckbox");
	for(var j=0;j<checkboxs.length;j++){
		if(checkboxs[j].checked){
			checkboxs[j].checked=false;
		}
	}
	for(var i=0;i<styleArr1.length;i++){
		for(var j=0;j<checkboxs.length;j++){
			if(checkboxs[j].value==styleArr1[i]){
				checkboxs[j].checked=true;
				selectedCheckbox+=checkboxs[j].value+",";
				break;
			}
		}
	}
}

//验证
function check1(obj){
	var i=0;
	var checkboxs = document.getElementsByName("datacheckbox");
	for(var j=0;j<checkboxs.length;j++){
		if(checkboxs[j].checked){
			i++;
		}
	}
	if(i==5){
		obj.checked=false;
		alert("最多只能选择四个模块！");
		return;
	}
	if(obj.checked)
		selectedCheckbox+=obj.value+",";
	else{
		var temArr = selectedCheckbox.split(",");
		selectedCheckbox = "";
		for(var i=0;i<temArr.length;i++){
			if(temArr[i]!="" && temArr[i]!=obj.value)
				selectedCheckbox += temArr[i]+",";
		}
	}
}