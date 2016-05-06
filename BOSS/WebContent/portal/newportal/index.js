function pageLoad(){
	initMenu();
}

//获取和用户相关的portal列表
function initMenu(){
	XMLHttp_Jquery.sendReq('GET', '../index/selectmodelstyle.do', '', createMenu);
}

//初始化菜单按钮
var userStyles = null;
function createMenu(xmlObject){
	var xmlDoc = xmlObject.responseXML;
	userStyles = $("userstyle",xmlDoc).attr("styleName");
//	the title tab on the first tab for top.jsp
//	var ul = $('#menubutton');
//	$(xmlDoc).find('tabs').each(function(){
//		var button = '<li><a href="#" onclick="changeCurrent(this,'+$(this).attr('id')+')"><span>'+
//			$(this).attr('name')+'</span></a></li>';
//		ul.append(button);
//	});
//	$('#menubutton li').get(0).id = "current";
	initContent();
}

//修改当前按钮点击后的颜色
function changeCurrent(buttonLink,menuId){
	$('#menubutton li').each(function(){
		$(this).removeAttr('id');
	});
	buttonLink.parentNode.id = 'current';
	changeContents(menuId);
}

//conftntInf saved all of the module data with one user's from initmodule.action 
//the xml one element like this: <dataAnalysis id,name,modelname,field,showtype,mfinfo,rows />
var contentInf = null;	
//查询portal模块信息
function initContent(){
	XMLHttp_Jquery.sendReq('GET', "../index/initmodel.do?userstyle=" + userStyles, '', function(xmlObject){
		contentInf = xmlObject.responseXML;
		var menuId;
		if(menuQueryId == null || menuQueryId == '')
			menuId = 0;
		else
			menuId = menuQueryId;
		changeContents(menuId);
	});
}

//填充模块中内容 title url
function changeContents(menuId){
	var userStyleArr = userStyles.split(";");
	var modules = null;
	$(userStyleArr).each(function(i){
		var tempArr = this.split(":");
		if(tempArr.length==2 && tempArr[0]==menuId){
			modules = tempArr[1].split(",");
			return false;
		}
	});
	//if(modules==null || modules.length!=4){
		for(var i = 0;i<4;i++){
			var title = $('#title_'+(i+1));
			title.html("");
			title.unbind('click');
			$('#content_'+(i+1)).html("<div style=\"height:80px;margin:70px 0 0 100px;\">"+
				"<img src=\"../../images/icon/icon_loading.gif\" width=\"16\" height=\"16\"/>"+
				"<span id=\"loading_msg\"> 数据加载中，Loading......</span></div>");
			$('#button_'+(i+1)+' img').css('display','none');
		}
	//}
	//the tab is not set with this user
	if(userStyles.indexOf(menuId+":")==-1){
		for(var i = 0;i<4;i++){
			var title = $('#title_'+(i+1));
			title.html("");
			title.unbind('click');
			$('#content_'+(i+1)).html("<div style=\"height:80px;margin:10px 0 0 5px;\"></div>");
		}
	}
	
	//modules: module id in portal with one tab
	$(modules).each(function(i){
		if(this!=0){
			//module: one module info from xml
			var module = $(contentInf).find('#'+this);
			//title name with one portal
			var title = $('#title_'+(i+1));
			title.html($(module).attr('name'));
			//title link with one portal
			var temvar = $(module).attr('showtype');
			
			if(temvar == "3"){
				var mn = $(module).attr('modelname');
				var pathname = $(module).attr('field');
				if(pathname=="")
					pathname=mn;
				var mhost = window.location.host;
				var mpathname = window.location.pathname.split("/");
				$(mpathname).each(function(i){
					if(this!=""){
						mpathname=this;
						return false;
					}
				});
				if(pathname.indexOf("http:") == -1){
					pathname = "http://"+mhost+"/"+mpathname+"/"+pathname;
					title.click(function(){
						window.parent.rightFrame.location=pathname;
					});
				}else{
					title.click(function(){
						window.open(pathname);
					});
				}
			}else{
				var href = "../../"+$(module).attr('modelname');
				title.click(function(){
					window.location.href = href;
				});
			}
			//fill the content with one portal,module: one module content xml info,content_: portal content element in page
			var content = createData(module,(i+1));
		}else{
			var title = $('#title_'+(i+1));
			title.html("");
			title.unbind('click');
			$('#content_'+(i+1)).html("<div style=\"height:80px;margin:10px 0 0 5px;\"></div>");
		}
	});
}

//添加模块内容 content
function createData(module,contentInTable){
	var moduleName = $(module).attr('modelname');
	var showName = $(module).attr('name');
	var row = $(module).attr('rows');
	var field = $(module).attr('field');
	var showType = $(module).attr('showtype');
	//moudleFieldInfo: all title info in index page include:fieldname:showname;...
	var moudleFieldInfo = $(module).attr('mfinfo');
	var content = "";
	if(showType==null || showType=="" || showType=="null"){
		$('#' + 'content_' + contentInTable).html("<div style=\"height:80px;margin:10px 0 0 5px;\"></div>");
	}else if(showType != 3){
		var moduleUrl = '../../'+moduleName+'/select.do';
		XMLHttp_Jquery.sendReq('GET', moduleUrl, '', function(xmlObject){
			var mainData = $("row",xmlObject.responseXML);
			CreatePortalContent(contentInTable, mainData, row, field, showType, showName, moudleFieldInfo);
		});
	}else{
		CreatePortalContent(contentInTable, '', row, field, showType, moduleName, moudleFieldInfo);
	}
}

//change the title button with every portal
function checkPortalTitle(type,index){
	var buttonBar = $('#button_' + index + ' img');
	if(type == 1 || type == 3){
		buttonBar.css('display','none');
	}else{
		buttonBar.css('display','block');
	}
}

function CreatePortalContent(contentInTable,data,r,f,st,mn, moudleFieldInfo){
	var showtype = st;
	var modelName = mn;
	var table = $('<table width="100%" border="0" cellpadding="0" cellspacing="0"></table>');
	var tr = $('<tr><tbody></tbody></tr>');
	//table.append(tr);
	
	if(showtype!="" && showtype.substr(0,1)=="2"){
		portalChart(modelName,showtype,data,r,f,table,moudleFieldInfo);
	}else if(showtype=="1"){
		portalDatatable(data,r,f,table,moudleFieldInfo);
	}else if(showtype=="3"){
		portalCustomPage(mn,table);
	}
	checkPortalTitle(showtype,contentInTable);
	//var content = table.html();
	$('#' + 'content_' + contentInTable).html(table[0].outerHTML);
}

//fill one portal with dataTable
function portalDatatable(data,r,f,table,moudleFieldInfo){
	var fs = f.split(",");
	var length = 6;
	var className1 = 'row1',className2 = 'row2';
	if(isNaN(r)==false && r!="")
		length = r;
	var tableInner = $('<table style="width:100%;"></table>');	
	//fill data title
	var dataTitle = $('<tr class="row_title"></tr>');
	if(fs != '') 
	$(fs).each(function(i){
		var titleInfo = moudleFieldInfo.split(';');
		$(titleInfo).each(function(j){
			var ti = titleInfo[j].split(':');
			if(ti[0] == fs[i]){
				var td = $('<th/>').text(ti[1]);
			 	dataTitle.append(td);
				return false;
			}
		});
	});
	tableInner.append(dataTitle);
	//fill data main
	$(data).each(function(i){
		if(i == length)
			return false;
		var field = $("field",this);
		var row = $("<tr/>");
		if(i%2 == 0){
			row.attr("class",className1);
		}else{
			row.attr("class",className2);
		}
		//fill data content
		$(field).each(function(j){
			var fx = $(this).attr("name");
			//title field is not empty
			$(fs).each(function(k){
				if(fx == fs[k]){
					var cell=$("<td/>");
				//	cell.attr("idx", $(field[j]).attr("name")+i);
					var textNode=$(field[j]).attr("value");
					cell.append(textNode);
					row.append(cell);
					return false;
				}
			});
		});
		tableInner.append(row);
	});
	var tr = $('<tr></tr>');
	var td = $('<td></td>');
	td.append(tableInner);
	tr.append(td);
	table.append(tr);	
}

//fill one portal with chart include three types
function portalChart(modelName,showtype,data,r,f,table,moudleFieldInfo){
	var chartType=showtype.split("-")[1];
	if(chartType==1){
		portalChart_pie(modelName,data,r,f,table);
	}else if(chartType==2 || chartType==3){
		portalChart_line(modelName,data,r,f,table,chartType,moudleFieldInfo);
	}	
}

//show pie chart with portal
function portalChart_pie(modelName,data,r,f,table){
	var fs = f.split(",");
	var length = 6;
	if(isNaN(r)==false && r!="")
		length=r;
	var type_arr = new Array();
	var value_arr = new Array();
	$(data).each(function(i){
		if(i == length)
			return false;
		var field=$("field",data[i]);
		$(field).each(function(j){
			var fx = $(this).attr("name");
			if(fs!="" && fs.length>0){
				if(fx == fs[0]){	//field type
					type_arr.push($(field[j]).attr("value"));
				}else if(fx == fs[1]){	//field data
					var oneValue = $(field[j]).attr("value");
					if(oneValue==null || oneValue=='')
						oneValue = 0;
					value_arr.push(oneValue);
				}
			}
		});				
	});
	var types = type_arr;
	var values = value_arr;
	
	var tr = $("<tr></tr>");
	var td = $("<td></td>");
	var iframe = $('<iframe width="100%" height="170" scrolling="no" marginwidth="0" frameborder="0" />');
	iframe.attr("src","chart/page/chart1.jsp?title="+encodeURI(encodeURI(modelName))+
			"&t="+encodeURI(encodeURI(types))+"&v="+encodeURI(encodeURI(values)));
	td.append(iframe);
	tr.append(td);
	table.append(tr);	
}

//show histogram chart with portal
function portalChart_histogram(){
	//the histogram is same to line chart
}

//show line chart with portal
function portalChart_line(modelName,data,r,f,table,chartType,moudleFieldInfo){
	var fs = f.split(",");
	var length = 6;
	if(isNaN(r)==false&&r!="")
		length=r;
	var moduleFields = moudleFieldInfo.split(";");
	var name_arr = new Array();
	//make the string of show title field
	$(fs).each(function(i){
		$(moduleFields).each(function(j){
			var moduleField = moduleFields[j].split(":");
			if(fs[i+1]==moduleField[0]){
				name_arr.push([moduleField[0],moduleField[1],'']);
				return false;
			}
		});
	});	
	var group_arr = new Array();
	$(data).each(function(i){
		if(i == length)
			return false;	
		var field = $("field",this);
		//fill the group info (the string under the baseline in chart)use group_arr
		$(field).each(function(j){
			var fx = $(this).attr("name");
			if(fs[0] == fx)
				group_arr.push($(this).attr('value'));
			//build the value of every show title field
			$(name_arr).each(function(k){
				if(fx == name_arr[k][0]){
					var oneValue = $(field[j]).attr("value");
					if(oneValue==null || oneValue=='')
						oneValue = 0;
					name_arr[k][2] += oneValue + "_";
					return false;
				}
			});
		});
	});
	var names = "";
	//make the value array become to a string
	$(name_arr).each(function(i){
		names += name_arr[i][1] + ":" + name_arr[i][2] + ";";
	});
	var tr = $("<tr></tr>");
	var td = $("<td></td>");
	var iframe = $('<iframe width="100%" height="170" scrolling="no" marginwidth="0" frameborder="0" />');
	iframe.attr("src","chart/page/chart" + encodeURI(encodeURI(chartType)) + ".jsp?title=" + encodeURI(encodeURI(modelName)) + 
		"&group=" + encodeURI(encodeURI(group_arr)) + "&value=" + encodeURI(encodeURI(names)));
	td.append(iframe);
	tr.append(td);
	table.append(tr);
}

//fill one portal with user custom page or web page in Internet
function portalCustomPage(mn,table){
	var modelName = mn;
	//if(modelName.indexOf("http:") == -1){
	//	modelName = "http://"+modelName;
	//}
	var mhost = window.location.host;
	var mpathname = window.location.pathname.split("/");
	$(mpathname).each(function(i){
		if(this!=""){
			mpathname=this;
			return false;
		}
	});
	if(modelName.indexOf("http:") == -1)
		modelName = "http://"+mhost+"/"+mpathname+"/"+modelName;
	
	var tr = $("<tr></tr>");
	var td = $("<td></td>");
	var iframe = $('<iframe width="100%" height="175" scrolling="auto" marginwidth="0" frameborder="0"  />');
	iframe.attr("src",modelName);
	td.append(iframe);
	tr.append(td);
	table.append(tr);
}

//open a show_view window when click the button on one portal
function showView(index){
	$('.showview').fadeIn('normal',function(){
		$('.mask').css('display','block');
		$(this).css('display','block');
	});
	var showLink = $('#content_'+index+' iframe');
	var iframe = $('<iframe id="hchart" name="hchart" width="100%" scrolling="no" marginwidth="0" frameborder="0"></iframe>');
	iframe.css('height','800px');
	var iurl = showLink.attr('src');
	iurl = iurl.replace(/page/g,'showview');
	iframe.attr('src',iurl);
	
	$('#showviewdata').html(iframe);
}

//close the show_view window
function closeView(){
	$('.showview').fadeOut('slow');
	$('.showview div iframe').attr('src','');
	$('.mask').css('display','none');
}

