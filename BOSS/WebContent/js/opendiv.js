//在鼠标显示一个层，该层的内空为div2的内容 
function showTip(){ 
	var div1 = document.getElementById('opendiv'); //将要弹出的层 
	div1.style.display="block"; //div1初始状态是不可见的，设置可为可见 
	//window.event代表事件状态，如事件发生的元素，键盘状态，鼠标位置和鼠标按钮状. 
	//clientX是鼠标指针位置相对于窗口客户区域的 x 坐标，其中客户区域不包括窗口自身的控件和滚动条。 
	var event = window.event || arguments.callee.caller.arguments[0];
	div1.style.left=event.clientX+10+'px'; //鼠标目前在X轴上的位置，加10是为了向右边移动10个px方便看到内容 
	div1.style.top=event.clientY+20+'px'; 
	div1.style.position="absolute"; //必须指定这个属性，否则div1层无法跟着鼠标动 
} 

//关闭层div1的显示 
function closeTip(){ 
	var div1 = document.getElementById('opendiv'); 
	div1.style.display="none"; 
}

function show(){
	if($("#show").css('width')!='149px'){
		$('#show').css({display:'block'});
	     $("#show").animate({
		     width: 149,
			 height: 68,
			 marginRight: -0,
			 marginTop: -0
		 });
	}else{
		$("#show").animate({
		     width: 0,
			 height: 0,
			 marginRight: -0,
			 marginTop: -0
		 });
		 $('#show').css({display:'none'});
	}
}

