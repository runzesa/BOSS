/**
 * ��ʼ��index��insert���r�o���Ͻǘ��}�xֵ
 */
function initTitleValue(){
	var topname = window.parent.frames.length;
	if(topname==0){
		topname = window.opener.parent.frames.topFrame.document.getElementById("current").outerText;
	}else{
		topname = window.parent.frames.topFrame.document.getElementById("current").outerText;
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
	 * ������Ȳˆ��c�����׃ɫ�@ȡ���c����ģ�K���Q
	 */
	for(var i = 0;i<left_divs.length;i++){
		if(left_divs[i].style.backgroundColor=="#ffffff".toLowerCase() || 
				left_divs[i].style.backgroundColor=="#FFFFFF"){
			modulename = left_divs[i].outerText;
			i2 = i;
			break;
		}
	}
	/**
	 * ���c���^�Ĺ��c�����,ͨ�^ahref.substr(ahref.length-2,1)����Y�x����������ˆ�
	 * ahref.substr(ahref.length-2,1)->�����ˆΫ@ȡ�ĽY����2;���ˆΞ�1
	 */
	var c0 = 0;
	for(var i = i2;i>=0;i--){
		if(left_divs[i].firstChild.tagName=="A"){
			var ahref=left_divs[i].firstChild.href;
			if(ahref!=""){
				var c = ahref.substr(ahref.length-2,1);
				if(c==2 && c0==0 && i==(i2-2)){
					leftname=left_divs[i].outerText;
					c0=1;
				}
				if(c==1 && c0==1){
					leftname=left_divs[i].outerText+">"+leftname;
					break;
				}else if(c==1 && c0==0){
					leftname=left_divs[i].outerText;
					break;
				}
			}
		}
	}
	/**
	 * �xֵ��index��insert���
	 */
	document.getElementById("opendiv").innerText="��ǰλ�ã�"+topname+">"+leftname+">"+modulename;
	var pnode = document.getElementById("opendiv").parentNode;
	if(pnode.tagName=="DIV"){
		var firstc = pnode.firstChild;
		if(firstc.tagName=="H1"&&firstc.firstChild.tagName=="A"){
			firstc.firstChild.innerText=modulename;
		}
	}
}