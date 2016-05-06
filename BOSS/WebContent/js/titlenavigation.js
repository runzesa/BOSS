/**
 * 初始化index和insert页面时给左上角标题赋值
 */
function initNavigation(){
	var topname = window.parent.frames.length;
	if(topname==0){
		topname = window.opener.parent.frames.topFrame.document.getElementById("current").outerText;
		if(topname==undefined)
			topname = window.opener.parent.frames.topFrame.document.getElementById("current").textContent;//firefox
	}else{
		topname = window.parent.frames.topFrame.document.getElementById("current").outerText;
		if(topname==undefined)
			topname = window.parent.frames.topFrame.document.getElementById("current").textContent;//firefox
	}
	var leftname = "";
	var modulename = "";
	var i2;
	var left_divs = window.parent.frames.length;
	if(left_divs==0){
		left_divs = window.opener.parent.frames.leftFrame.document.getElementsByTagName("div");
	}else{
		left_divs = window.parent.frames.leftFrame.document.getElementsByTagName("div")
	}
	/**
	 * 根据left菜单点击后会变色获取所点击的模块名称
	 */
	for(var i = 0;i<left_divs.length;i++){
		if(left_divs[i].style.backgroundColor=="#ffffff".toLowerCase() || 
				left_divs[i].style.backgroundColor=="#FFFFFF"){
			modulename = left_divs[i].outerText;
			if(modulename==undefined)
				modulename = left_divs[i].textContent;//firefox
			i2 = i;
			break;
		}
	}
	/**
	 * 以点击过的节点为标准,通过ahref.substr(ahref.length-2,1)反向筛选出二级和根节点菜单
	 * ahref.substr(ahref.length-2,1)->二级菜单获取的结果为2,根菜单为1
	 */
	var c0 = 0;
	for(var i = i2;i>=0;i--){
		if(left_divs[i].firstChild.tagName=="A"){
			var ahref=left_divs[i].firstChild.href;
			if(ahref!=""){
				var c = ahref.substr(ahref.length-2,1);
				if(c==2 && c0==0 && i==(i2-2)){
					leftname=left_divs[i].outerText;
					if(leftname==undefined){
						leftname=left_divs[i].textContent;//firefox
					}
					c0=1;
				}
				if(c==1 && c0==1){
					leftname=left_divs[i].outerText+">"+leftname;
					if(leftname==undefined){
						leftname=left_divs[i].textContent+">"+leftname;//firefox
					}
					break;
				}else if(c==1 && c0==0){
					leftname=left_divs[i].outerText;
					if(leftname==undefined){
						leftname=left_divs[i].textContent;//firefox
					}
					break;
				}
			}
		}
	}
	/**
	 * 赋值到index或insert页面
	 */
	if(leftname!=""){
		document.getElementById("opendiv").innerText="当前位置："+topname+">"+leftname+">"+modulename;
		document.getElementById("opendiv").textContent="当前位置："+topname+">"+leftname+">"+modulename;//firefox
		var pnode = document.getElementById("opendiv").parentNode;
		if(pnode.tagName=="DIV"){
			var firstc = pnode.firstChild;
			if(firstc.tagName=="H1"&&firstc.firstChild.tagName=="A"){
				firstc.firstChild.innerText=modulename;
				firstc.firstChild.textContent=modulename;//firefox
			}
		}
	}else{
		document.getElementById("opendiv").innerText="当前位置："+topname+">"+document.title;
		document.getElementById("opendiv").textContent="当前位置："+topname+">"+document.title;//firefox
		var pnode = document.getElementById("opendiv").parentNode;
		if(pnode.tagName=="DIV"){
			var firstc = pnode.firstChild;
			if(firstc.tagName=="H1"&&firstc.firstChild.tagName=="A"){
				firstc.firstChild.innerText=document.title;
				firstc.firstChild.textContent=document.title;//firefox
			}
		}
	}
}