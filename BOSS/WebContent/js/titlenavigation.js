/**
 * ��ʼ��index��insertҳ��ʱ�����ϽǱ��⸳ֵ
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
	 * ����left�˵��������ɫ��ȡ�������ģ������
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
	 * �Ե�����Ľڵ�Ϊ��׼,ͨ��ahref.substr(ahref.length-2,1)����ɸѡ�������͸��ڵ�˵�
	 * ahref.substr(ahref.length-2,1)->�����˵���ȡ�Ľ��Ϊ2,���˵�Ϊ1
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
	 * ��ֵ��index��insertҳ��
	 */
	if(leftname!=""){
		document.getElementById("opendiv").innerText="��ǰλ�ã�"+topname+">"+leftname+">"+modulename;
		document.getElementById("opendiv").textContent="��ǰλ�ã�"+topname+">"+leftname+">"+modulename;//firefox
		var pnode = document.getElementById("opendiv").parentNode;
		if(pnode.tagName=="DIV"){
			var firstc = pnode.firstChild;
			if(firstc.tagName=="H1"&&firstc.firstChild.tagName=="A"){
				firstc.firstChild.innerText=modulename;
				firstc.firstChild.textContent=modulename;//firefox
			}
		}
	}else{
		document.getElementById("opendiv").innerText="��ǰλ�ã�"+topname+">"+document.title;
		document.getElementById("opendiv").textContent="��ǰλ�ã�"+topname+">"+document.title;//firefox
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