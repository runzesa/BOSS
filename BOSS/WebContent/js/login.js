//login.jsp
function pageLoad(){
	var vRemember = GetCookie("remember");
	if(vRemember!=null && vRemember!=""){
		loginform.username.value = vRemember;
		loginform.remember.checked = true;
	}
	if(info!='null'){
		switch(info){
			case '#001':
				alert('验证码错误!');break;
			case '#002':
				alert('用户名或密码错误!');break;
			case '#004':
				alert('对不起，系统出现内部错误，请与系统管理员联系！');break;
		}
	}
}

function loginstyle(){
	var vSkin = GetCookie("loginstyle");
	if(vSkin==null || vSkin==""){
		setSkinColor("style_b");
	}else
		setSkinColor(vSkin);
}

function enterDown(event){
	event = (event) ? event : ((window.event) ? window.event : "");
	var key = event.keyCode?event.keyCode:event.which;
	if(key == "13")
		formSubmit();
}

function setSkinColor(vSkinNum){
    SetCookie("loginstyle", vSkinNum, 60*60*24*30,"");
    document.getElementById("style").href = "css/login/"+vSkinNum+".css";
}
function formSubmit(){
	if(loginform.remember.checked==true)
		SetCookie("remember", loginform.username.value, 60*60*24*30,"");
	else
		SetCookie("remember", "", 60*60*24*30,"");
	document.loginform.action = "login.do";
	document.loginform.submit();
}
function freshimg(){
	var yzm = document.getElementById("validate");
	yzm.src = "util/validataimage.do?rand="+Math.random()*10000;
}

//left.jsp

//leftMT=[{id:'6',name:'常用功能', url:'#', target:'rightFrame', children:[
//{id:'6.1',name:'常用功能1', url:'#', target:'rightFrame', children:[]},
//{id:'6.2',name:'常用功能2', url:'#', target:'rightFrame', children:[]}
//]
//}];
function getQueryString(name){
	var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");
	if(reg.test(location.href)) 
		return unescape(RegExp.$2.replace(/\+/g, " ")); 
	return ""; 
}

function initLeftPage(){
	if(titleval=='首页' || titleval=="")
		XMLHttp_Jquery.sendReq('GET', 'adminmanager/left/getuserleft.do', '', userLeftData);
	else
		XMLHttp_Jquery.sendReq('GET', 'adminmanager/left/getleft.do?titlename='+titleval, '', leftData);
}

function leftData(xmlObject){
	var xmlDoc = xmlObject.responseXML;
	var nodes = xmlDoc.getElementsByTagName("node_top");
	
	for(var i=0;i<nodes.length;++i){
		var a = new Array();
		var x = {id:nodes[i].getAttribute('rownum'),name:nodes[i].getAttribute('name'),url:nodes[i].getAttribute('url'),target:nodes[i].getAttribute('target'),children:a};
		var children = nodes[i].getElementsByTagName("node_child");
		if(children.length!=0)
		for(var j=0;j<children.length;++j){
			var b = new Array();
			a.push({id:children[j].getAttribute('rownum'),name:children[j].getAttribute('name'),url:children[j].getAttribute('url'),target:children[j].getAttribute('target'),children:b});	
			var grands = children[j].getElementsByTagName("node_grand");
			if(grands.length!=0)
			for(var k=0;k<grands.length;++k){
				b.push({id:grands[k].getAttribute('rownum'),name:grands[k].getAttribute('name'),url:grands[k].getAttribute('url'),target:grands[k].getAttribute('target'),children:[]});
			}
		}
		roots.menu.push(x);
	}
	roots.menu = roots.menu.concat(leftMT);
	treeInit();
}

function userLeftData(xmlObject){
	var c = new Array();
	roots.menu.push({id:'0',name:'常用功能', url:'#', target:'rightFrame', children:c});
	var xmlObj = xmlObject.responseXML;
	var urls = xmlObj.getElementsByTagName("urls");
	for(var i = 0;i<urls.length;i++){
		var id_m = "0."+(i+1);
		var name_m = urls[i].getAttribute("name");
		var url_m = urls[i].getAttribute("url");
		var target_m = urls[i].getAttribute("target");
		c.push({id:id_m,name:name_m, url:url_m, target:target_m, children:[]});
	}
	treeInit();
}


//top.jsp

function changeleft(val,flag){
	var top_nav = document.getElementById('top_nav');
	var lis = top_nav.getElementsByTagName('li');
	for(var i=0;i<lis.length;i++){
		if(lis[i].className == flag){
			lis[i].setAttribute("id","current");	
		}else{
			lis[i].setAttribute("id",lis[i].name);	
		}
	}
	if(val=="首页"){
		window.parent.rightFrame.location="portal/newportal/index.jsp";
	}
	window.parent.leftFrame.location="left.jsp?titlename="+XMLHttp_Jquery.encodeData(val);
}

function quit(){
	window.parent.location="loginout.do";
}
function usersetting(){
	window.parent.rightFrame.location="personalsettings/gx_set.jsp"
}
function initTitles(){
	XMLHttp_Jquery.sendReq('GET', 'adminmanager/left/configtitles.do', '', setTitleLinks);
}
function setTitleLinks(xmlObject){
	var xmlDoc = xmlObject.responseXML;
	var css = ['zhjc','scdd','save','date','xxmh','zhjc1','scdd1','save1','date1','xxmh1'];
	$(xmlDoc).find('topTitles > topname').each(function(i){
		var titleName = $(this).attr('name');
		var titleId = $(this).attr('id');
		var titleLi = '<li class="'+css[i]+'" menuId="'+titleId+'" id="'+css[i]+'" name="'+css[i]+'">'+
			'<a class="'+css[i]+'" href="#" onclick="changeleft(\''+titleName+'\',\''+css[i]+'\');changePortal(\''+titleId+'\');"><span>'+titleName+'</span></a></li>';
		$('.top_nav ul').append(titleLi);
	});
}

//add right event for click the title tab
function changePortal(menuId){
	//window.parent.rightFrame.changeContents(menuId);
	window.parent.rightFrame.location = "portal/newportal/index.jsp?menuid="+menuId;


	
}
