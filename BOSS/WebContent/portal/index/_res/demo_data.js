
 	var modelTableName = '';
	var modelTableId = '';
  	function pageLoad(){
		initData();
	}
	function initData(){
		XMLHttp.sendReq('GET', '../initmodel.do','', modelData);
	}
	function modelData(xmlObject){
		var analysis = $("dataAnalysis",xmlObject.responseXML);
		$(analysis).each(function(i){
			var xmp = $("<xmp></xmp>");
			xmp.attr("id",$(analysis[i]).attr("name"));
			xmp.attr("modelname",$(analysis[i]).attr("modelname"));
			//***获取xml中新加的属性值
//			xmp.attr("field",$(analysis[i]).attr("field"));
//			xmp.attr("showtype", $(analysis[i]).attr("showtype"));
//			xmp.attr("rows", $(analysis[i]).attr("rows"));
			var table = $('<table></table>');
			table.attr("width","100%");
			table.attr("border",'0');
			table.attr("cellpadding",'0');
			table.attr("cellspacing",'0');
			var tr = $('<tr></tr>');
			var tbody = $('<tbody></tbody>');
			tr.append(tbody);
			table.append(tr);
			xmp.append(table);
			$("body").append(xmp)
		});
		loadData();
	}
	
	var i_sleep = 0;
	var timeID = null;
	
	function loadData(){
		var xmp = $("xmp");
		$(xmp).each(function(i){
			modelTableName = $(xmp[i]).attr("id");
			//***存储xml中新加的属性值
			modelTableId = $(xmp[i]).attr("modelname");
			getXmlresponse('GET','../../../'+$(xmp[i]).attr("modelname")+'/select.do?random='+Math.random(), '', selectdata);
		});
		document.getElementsByTagName("xmp-check")[0].value="fin";
	}
	
	function selectdata(xmlObject){
		var outt = $("#"+modelTableName).find("tbody");
		outt.attr("id",modelTableId+"_"+modelTableName);
		var rows=getServerTableRowsx(xmlObject);
		addTableRowsx(modelTableId+"_"+modelTableName,rows,"row1","row2");
	}
	
	//不以异步的方式提交ajax
	function getXmlresponse(method,url,data,funct){
		var xmlHttp=false;
		try{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				xmlHttp=false;
			}
		}
		if(!xmlHttp&&typeof XMLHttpRequest!="undefined"){
			xmlHttp=new XMLHttpRequest();
		}
		xmlHttp.open(method, url, false);
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				funct(xmlHttp);
			};
		};
		xmlHttp.send(data);
	}
	
	function getServerTableRowsx(xmlObject){
		return $("row",xmlObject.responseXML);
	}



	function addTableRowsx(tableName,data,className1,className2){
		var flag=0;
		var length =0;
		//×××显示行数
		length=6;
		$(data).each(function(i){
			if(i<length){
				var field=$("field",data[i]);
				var row=$("<tr></tr>");
				if(flag==0){
					if(className1!=null){
						row.attr("class",className1);
					}
				flag=1;
				}else{
					if(className2!=null){
						row.attr("class",className2);
					}
					flag=0;
				}	
			$(field).each(function(j){
				//***判断显示哪些字段
				var fx = $(field[j]).attr("name");
				var cell=$("<td></td>");
				cell.attr("idx", $(field[j]).attr("name")+i);
				var textNode=$(field[j]).attr("value");
				cell.append(textNode);
				row.append(cell);
			})
			$("#"+tableName).append(row);
		}
	});
}
