//�������ʾһ���㣬�ò���ڿ�Ϊdiv2������ 
function showTip(){ 
	var div1 = document.getElementById('opendiv'); //��Ҫ�����Ĳ� 
	div1.style.display="block"; //div1��ʼ״̬�ǲ��ɼ��ģ����ÿ�Ϊ�ɼ� 
	//window.event�����¼�״̬�����¼�������Ԫ�أ�����״̬�����λ�ú���갴ť״. 
	//clientX�����ָ��λ������ڴ��ڿͻ������ x ���꣬���пͻ����򲻰�����������Ŀؼ��͹������� 
	var event = window.event || arguments.callee.caller.arguments[0];
	div1.style.left=event.clientX+10+'px'; //���Ŀǰ��X���ϵ�λ�ã���10��Ϊ�����ұ��ƶ�10��px���㿴������ 
	div1.style.top=event.clientY+20+'px'; 
	div1.style.position="absolute"; //����ָ��������ԣ�����div1���޷�������궯 
} 

//�رղ�div1����ʾ 
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

