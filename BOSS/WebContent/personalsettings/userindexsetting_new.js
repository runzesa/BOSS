function pageLoad(){
	XMLHttp_Jquery.sendReq('GET', '../portal/index/selectmodelstyle.do', '', initTitle);
}

var userStyle = "";
var tabId = 0;
var oldTabId = 0;
var stateInit = true;
function initTitle(xmlObj){
	var res = xmlObj.responseXML;
	userStyle = $("userstyle",res).attr("styleName");
	$('#tabs').append('<li id="current"><a onclick="changeTab(0,this)" href="#"><span>首页</span></a></li>');
	var tabs = $(res).find("tabs").each(function(){
		var taba = $('<li><a onclick="changeTab('+$(this).attr('id')+',this)" href="#"><span>'+$(this).attr('name')+'</span></a></li>');
		$('#tabs').append(taba);
	});
	changeTab(0,$('#tabs li a').get(0));
	
	$(".userindexset_checkbox").removeClass("userindexset_checkbox").css("height","140px");
//	$(".userindexset_input").removeClass("userindexset_input").css("width","100%")
	$("#set_module_area").css("margin-top","50px");
	stateInit = false;
}

function decideUserStyleWithSave2(){
	var ustyles = userStyle.split(';');
	$(ustyles).each(function(){
		var tab = this.split(':');
		if(tab[0] == tabId){
			oldStyle = this;
		}
	});
	var newStyle = oldTabId+':'+$('#s_1').val()+','+$('#s_2').val()+','+$('#s_3').val()+','+$('#s_4').val();
	if(oldStyle == ''){
		userStyle += ';'+newStyle;
	}
	if(oldStyle == newStyle)
		return;
	else{
		var changeIndex = oldStyle.split(':');
		$(ustyles).each(function(){
			var tab = this.split(':');
			
		});
	}
}

function decideUserStyleWithSave(){
	decideUserStyle(true)
}

//decide userType if user edited the change it
function decideUserStyle(save){
	if(save==true)
		oldTabId = tabId;
	var ustyles = userStyle.split(';');
	var oldStyle = '';
	$(ustyles).each(function(i){
		var tab = ustyles[i].split(':');
		if(tab.length==2 && tab[0]==oldTabId){
			oldStyle = ustyles[i];
		}
	});
	
	//get the current userStyle for select's options
	var newStyle = oldTabId+':'+$('#s_1').val()+','+$('#s_2').val()+','+$('#s_3').val()+','+$('#s_4').val();
	//if there is no oldStyle or oldStyle is '' then userStyle add the newStyle immediate then return
	if(oldStyle == ''){
		userStyle += ';'+newStyle;
		return;
	}
	//if the newStyle not any change then return
	if(oldStyle == newStyle){
		return;
	}else{
		//newStyle is changed then..
		var changeIndex = oldStyle.split(':');
		$(ustyles).each(function(i){
			var tab = this.split(':');
			if(tab[0] == changeIndex[0]){
				ustyles[i] = newStyle;
			}
		});
		userStyle = ustyles.join(';');
	}
}

function changeTab(tid,taba){
	//Do something important
	//save oldTabId and current Tab id
	oldTabId = tabId;
	tabId = tid;
	//decide userType if user edited
	//...
	if(!stateInit)
		decideUserStyle();
	//set current color with tabs
	$('#tabs li').each(function(){
		$(this).removeAttr('id');
	});
	taba.parentNode.id = 'current';
	XMLHttp_Jquery.sendReq('GET', '../portal/index/modelstylecustom.do?tabid='+tabId, '', optionSelect);
	
}

function optionSelect(xmlObject){
	xmlDoc = xmlObject.responseXML;
	//not load userStyle behind click the tab-bar
	//userStyle = $(xmlDoc).find('entity userstyle').attr("styleName");
	//add each option with four selects
	$('#modelarea select').each(function(i){
		$(this).html('<option value="0">无</option>');
		var sel = $(this);
		$(xmlDoc).find('module').each(function(j){
			var opt = $('<option></option>');
			opt.attr('value',$(this).attr('id'));
			opt.append($(this).attr('name'));
			sel.append(opt);
		});
	});
	
	//fill four select's option if there have user custom
	var tabs = userStyle.split(';');
	$(tabs).each(function(i){
		var userMId = tabs[i].split(':');
		if(userMId[0]==tabId && userMId.length==2){
			
			var moduleInf = userMId[1].split(",");
			$('#s_1').val(moduleInf[0]);
			$('#s_2').val(moduleInf[1]);
			$('#s_3').val(moduleInf[2]);
			$('#s_4').val(moduleInf[3]);
		}else{
			
		}
	});
}


function init5(xmlObj){
	var res = xmlObj.responseXML;
	var userstyle = $("userstyle",res).attr("styleName");
	
	var userTagList = userstyle.split(";");
	
	var tabs = $("tabs",res);
	$(tabs).each(function(i){
		var tabId = $(this).attr("id");
		var tabName = $(this).attr("name");
		var modules = $("module",$(this));
		var taba = $("<a href='#'></a>");
		taba.click(function(){
			$("#tabid")[0].value=tabId;
			var tds = $("#modelarea").find("td");
			var select = $("<select></select>");
			select.css("width","125px");
			
			$(modules).each(function(j){
				var moduleId = $(this).attr("id");
				var moduleName = $(this).attr("name");
				var moduleShowType = $(this).attr("showtype");
				if(moduleShowType.length>0 && moduleShowType.substr(0,1)=="2"){
					moduleName = moduleName+" (图表)";
				}else{
					moduleName = moduleName+" (数据)";
				}
				var options = $("<option/>").attr("value",moduleId).text(moduleName);
				select.append(options)
				
			});
			var options = $("<option/>").attr("value","").text("空");
			select.append(options);
			
			$(tds).each(function(j){
				select.attr("id",j);
				$(tds[j]).empty();
				var select_clone = select.clone();
				select_clone.appendTo(tds[j]);
				$(userTagList).each(function(k){
					var userTagModule = userTagList[k].split(":");
					if(userTagModule.length==2 && userTagModule[0]==tabId){
						var selectValues = userTagModule[1].split(",");
						var options2 = $(tds[j]).find("select").find("option");
						$(options2).each(function(x){
							if($(options2[x]).attr("value")==selectValues[j]){
								$(options2[x]).attr("selected","selected");
							}
						});
					}
				});
			});
		});
		taba.append(tabName);
		$("#tabs").append(taba)
		if((tabs.length-1)!=i){
			$("#tabs").append(", ");
		}
	});
}

function sub(){
	decideUserStyleWithSave();
	
	XMLHttp_Jquery.sendReq('GET', '../portal/index/savemodelstyle.do?modelstyle='+userStyle, '', function(xmlObj){
		if(xmlObj.responseText=="true"){
			finalResult();
		}else{
			messageBox.alert("数据保存失败！","error");
		}
	});
}

function finalResult(){
	messageBox.alert("数据保存成功！","success",function(){
		window.close();
	});
}
