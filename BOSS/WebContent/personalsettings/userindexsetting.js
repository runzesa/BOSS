function pageLoad(){
	XMLHttp.sendReq('GET', '../portal/index/selectmodelstyle.do', '', init);
}

var resp="";
function init(xmlObj){
	var res = xmlObj.responseText;
	var res_1 = res.split("|");
	for(var i=0;i<res_1.length;i++){
		var res_2 = res_1[i].split(",");
		for(var j=0;j<res_2.length;j++){
			resp += res_2[j]+",";
		}
	}
	var x = res.split("|").length;
	var d_colums = document.getElementsByName("d_column");
	for(var i=0; i<d_colums.length; i++){
		if(d_colums[i].value==x){
			d_colums[i].checked=true;
			break;
		}
	}
  	XMLHttp.sendReq('GET', '../portal/index/initmodel.do','', modelData);
}

function modelData(xmlObject){
	var xmlDoc = xmlObject.responseXML;
	var res_arr = resp.split(",");
	var analysis = xmlDoc.getElementsByTagName("dataAnalysis");
	var src = document.getElementById("modelarea");
	var j_max = analysis.length%1;
	if(j_max!=0){
		j_max = analysis.length/1+1;
	}else{
		j_max = analysis.length/1;
	}
	for (var j = 0; j < j_max; j++) {
		var tr = document.createElement("tr");
		for (var i = 1 * j; i < 1 * (j + 1) && i < analysis.length; ++i) {
			var td = document.createElement("td");
			td.setAttribute("align", "left");
			var input = document.createElement("input");
			input.setAttribute("type", "checkbox");
			input.setAttribute("id", "module" + analysis[i].getAttribute("id") + "_" +
			analysis[i].getAttribute("modelname"));
			input.setAttribute("value", analysis[i].getAttribute("name"));
			input.setAttribute("checked", "true");		
			var label = document.createElement("leabel");
			label.setAttribute("for", "module" + analysis[i].getAttribute("id") + "_" +
			analysis[i].getAttribute("modelname"));
			label.innerText = "  " + analysis[i].getAttribute("name") + "(" +
			analysis[i].getAttribute("modelname") +	")";
			td.appendChild(input);
			td.appendChild(label);
			tr.appendChild(td);
		}
		src.appendChild(tr);
	}	
	for(var j=0;j<j_max;j++){
		for(var i=1*j;i<1*(j+1)&&i<analysis.length;++i){
			for(var k=0;k<res_arr.length;k++){
				if(res_arr[k]==analysis[i].getAttribute("name")){
					var id_inp = "module" + analysis[i].getAttribute("id") + "_" +
						analysis[i].getAttribute("modelname");
					document.getElementById(id_inp).checked=true;
					break;
				}
			}
		}
	}
}

function sub(dp){
	messageBox.loading("save");
	if(uid!=null && uid!=""){
		var d_colums = document.getElementsByName("d_column");
		var i_colum=1;
		for(var i=0; i<d_colums.length; i++){
			if(d_colums[i].checked){
				i_colum = d_colums[i].value;
				break;
			}
		}
		if(i_colum==3){
			dp.setColumn(3);
		}else if(i_colum==2){
			dp.setColumn(2);
		}else{
			dp.setColumn(1);
		}
		setTimeout("dp.setModule()",250);
		setTimeout("finalResult()",500);
	}else{
		messageBox.alert("数据保存失败！","error");
	}
}

function finalResult(){
	messageBox.alert("数据保存成功！","success",function(){
		window.close();
	});
}
