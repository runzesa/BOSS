//ȡ����window.showModalDialog("../workflow/checkout.jsp",xmlDoc,"dialogWidth=400px;dialogHeight=300px");�ڶ���������������
var xmlDoc = window.dialogArguments;

var radioMarginLeft = 20;//radio/hidden�ľ�����,��λpx

window.onload = function(){
	//��ǰ������Ϣ
	createNowMission();

	//������ת�б�
	var radioIndex = 0;//��ת�����ߵĸ���
	var nextObj = new Object();//�����߸��ֲ���
	var transitions = $(xmlDoc).find('returnNext > transition');
	var radio_hidden_type = transitions.length>1?"radio":"hidden";//��������Ϊ1����ʾradio
	
	$(transitions).each(function(){
		nextObj.outName = $(this).attr('name');//��ת�����ߵ�name
		
		var node = $("next",this);
		nextObj.name = $(node).attr('name')+"��";//�����ڵ�name
		tagName = $(node).attr('type');//�����ڵ������(��Ϊfork��join�ͼ������ӽڵ������)
		
		var tr2,td21,td22;//��ת->��
		
		var radio_hidden = "";//��תѡ��:��ʾradio or ֱ�ӷŸ�hidden
		var nameinput = "";
		var idinput = "";
		var button = "";
		
		//������name��td�Ŀؼ���radio/hidden,value���������ߵ����
		radio_hidden = $('<input/>')
					.attr("type",radio_hidden_type)
					.attr("value",radioIndex)
					.attr("style","width:30px;")
					.attr("name","outradio")
					.attr("id","outradio")
					;
		//��Ϊ����/����/�жϽڵ�
		if(tagName=="task" || tagName=="end" || tagName=="decision"){
			//��һ��td������(nextObj.name+radio)
			nextObj.userType = $(node).attr('usertype');//��ת���û�����(����/��̬�û�/�û�/������/��ɫ->��δ�ӡ�)
			nextObj.user = $(node).attr('user');//�����˹ؼ���,�൱��map��key
			nextObj.userid = $(node).attr('userid');//������id,�൱��map��value
			nextObj.username = $(node).attr('username');//�������û���,������ʾ
			var readonly = $(node).attr('readonly');//�Ƿ���޸�
			
			//��radio/hidden������ֵ
			$(radio_hidden).data("outName",nextObj.outName)
						.data("tagName",tagName)
						.data("userType",nextObj.userType)
						.data("user",nextObj.user);
			
			//�����ڶ���td��text,hidden,button
			var temTD2Obj = createTD2(nextObj,radioIndex);

			nameinput = temTD2Obj.nameinput;//��name��text
			idinput = temTD2Obj.idinput;//��id��hidden
			button = temTD2Obj.button;//button��ť
			
			//user keyֻҪ����init_user,���Ҵ�����xml��radyonly=true->�������޸�->����ʾbutton
			if((readonly!=undefined && nextObj.userType == 'static_user' && readonly=="true") || nextObj.user=="init_user")
				button="";
			
			//������һ��td������
			td21 = createTD1_task_end_decision(radio_hidden, nextObj.name);
			
			//�ڶ���td������
			td22 = $('<td></td>')
					.attr("style","text-align:left;padding:0 0 0 5px;")
					.append(nameinput)
					.append(idinput)
					.append(button);
		
		//��Ȼjoin֮����ı�Ȼ��һ���ڵ�,�������xml������forkһ���ĸ�ʽ���Է����������
		}else if(tagName=="fork" || tagName=="join"){
			//������name��td�Ŀؼ��Ĳ���
			$(radio_hidden).data("outName",nextObj.outName)
							.data("tagName",tagName);

			//��һ��td������(���ı���)
			td21 = createTD1_fork_join(radio_hidden);
			
			//�ڶ���td
			td22 = $('<td></td>')
				.attr("style","text-align:left;padding:0 0 0 5px;");
			var users = "";//�û�����
			//var buttonids = "";
			var index2 = 0;//text��id�ĺ������
			
			//�ı���div
			var td21_div = $("<div></div>")
					.attr("style","padding-top:1px;padding-bottom:1px;");
			
			//td�ĸ߶�,û������߶��޷���ֱ����
			var td21_height = 6;
			
			$("childnext",node).each(function(){
				//ÿ����һ���ı����20�ֶ�����td�ĸ߶�
				td21_height+=20;
				
				//����һ��td����ı�����
				$(td21_div).append(createTD1_fork_join_NameDIV($(this).attr("name")));

				//�û�����
				var user = $(this).attr("user");
				//�û�����
				var usertype = $(this).attr("usertype");
				users += user+",";
				
				nextObj.userType = usertype;//�û�����
				nextObj.user = user;//�û�����
				nextObj.userid = $(this).attr("userid");//Ĭ�ϵ��û�id
				nextObj.username = $(this).attr('username');//Ĭ�ϵ��û�name
				var readonly = $(this).attr('readonly');//�Ƿ���޸�
				
				//�����ڶ���td������
				var temTD2Obj = createTD2(nextObj,radioIndex+"_"+index2,user);
				
				nameinput = temTD2Obj.nameinput;
				idinput = temTD2Obj.idinput;
				button = temTD2Obj.button;
				//user keyֻҪ����init_user,���Ҵ�����xml��radyonly=true->�������޸�->����ʾbutton
				if((readonly!=undefined && nextObj.userType == 'static_user' && readonly=="true") || nextObj.user=="init_user")
					button="";
				
				//�ڶ���td�������
				$(td22).append(nameinput)
					.append(idinput)
					.append(button)
					.append($("<br/>"));
				index2++;//text��id�ĺ������++
				radio_hidden.data("userType",nextObj.userType)//TODO �û�����,ÿ�ζ�����...ûɶ��
			});
			//td1������ı�div,����Ӹ߶ȵ�css����
			$(td21).append(td21_div).css("height",td21_height+"px");
			
			nextObj.user = users;//TODO ͬ��
			radio_hidden.data("user",nextObj.user);//TODO ����ж���ʵ��û���õ�,fork��������û�����ֱ�Ӵ�text��ȡ��
			
		}else{
			alert("Error in checkout.js:\nUnknow tagName->"+tagName)
		}
		//������Ӧtr,td��������
		tr2 = $('<tr></tr>');
		//���
		tr2.append(td21).append(td22);
		
		$('#nextdata').append(tr2);
		radioIndex += 1;
	});

}

/**
 * ����������Ŀ��name��div
 * @param name ��ʾֵ
 * @return ����name��div
 */
function createTD1_fork_join_NameDIV(name){
	var td21_div_child = $("<div></div>")
					.attr("style","height:18px;padding-top:5px;margin-top:1px;margin-bottom:1px")
					.append(name+"��");
	return td21_div_child;
}

/**
 * ������֧����۵ĵ�һ��td
 * @param obj �ؼ�
 * @return
 */
function createTD1_fork_join(obj){
	//ռ�е�span,ʹradio/hidden����
	var chooseSpan = $("<span></span>")
			.attr("style","width:0;height:100%;display:inline-block;vertical-align:middle;");
	
	//span�Ϳؼ�������div��
	var chooseDIV = $("<div></div>")
			.attr("style","height:100%;float:left;margin-left:"+radioMarginLeft+"px")
			.append(chooseSpan)
			.append(obj);
	
	//��һ��td������(���ı���)
	var td1 = $('<td></td>')
		.attr("align","right")
		.attr("valign","middle")
		.attr("style","background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
		.append(chooseDIV);
	return td1
}

/**
 * ��������/����/�жϵĵ�һ��td
 * @param obj �ؼ�
 * @param name ��ʾ����
 * @return td
 */
function createTD1_task_end_decision(obj,name){
	//��ѡ��ť��div
	var chooseDIV = $("<div></div>")
			.attr("style","float:left;;margin-left:"+radioMarginLeft+"px;")
			.append(obj);
	
	//�ı���div
	var nameDiv = $("<div></div>")
			.attr("style","float:right;margin-top:3px;")
			.append(name);
	
	//��һ��td������
	var td1 = $('<td></td>')
			.attr("align","right")
			.attr("valign","middle")
			.attr("style","height:30px;background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
			.append(chooseDIV)
			.append(nameDiv);
			
	return td1;
}

/**
 * ������ǰ�������Ϣ
 */
function createNowMission(){
	//����������ת�����ݵ�tr
	var currentName = $("current",xmlDoc).attr("name");//��ǰ������
	var currentId = $("current",xmlDoc).attr("id");//����id
	
	//�����ڶ���tr
	var tr = $('<tr></tr>');
	
	var td1 = $('<td></td>')
			.attr("align","right")
			.attr("style","width:40%;height:30px;background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
			.text("��ǰ����");
	
	var td2 = $('<td></td>')
			.attr("style","text-align:left;padding:0 0 0 5px;")
			.text(currentName);
	
	var taskIDHidden = $('<input/>')
			.attr("type","hidden")
			.attr("value",currentId)
			.attr("name","taskid")
			.attr("id","taskid");
	
	//��tr�ŵ�table
	$(td2).append(taskIDHidden);
	$(tr).append(td1).append(td2);
	$('#currentdata').append(tr);
}

/**
 * �����������б�ĵڶ���td
 * @param nextObj ���и�����һ�ڵ������obj
 * @param radioIndex ��ǰtr�����
 * @param user �û�
 * @return
 */
function createTD2(nextObj,radioIndex,user){
	var returnObj = new Object();
	returnObj.nameinput = "";
	returnObj.idinput = "";
	returnObj.button = "";
	
	if(nextObj.userType == 'static_user'){//��Ϊ��̬������
		//����text�ı���
		returnObj.nameinput = $('<input/>')
				.attr("type","text")
				.attr("readonly","true")
				.attr("style","margin-top:1px;margin-bottom:1px;width:160px;background:url(../images/icon/bg_input_text.png) no-repeat;height:18px;border:1px solid #B5B8C8;padding:3px 0 0 3px;vertical-align:middle;")
				.attr("name","nameinput"+radioIndex)
				.attr("id","nameinput"+radioIndex)
				.attr("value",nextObj.username);
		//�����ı������ݶ�Ӧ��idֵ
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("readonly","true")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.userid)
				.data("user",user==undefined?"":user);
		//button
		returnObj.button = $('<input/>')
				.attr("type","button")
				.attr("style","width:50px;margin:0 0 0 5px;")
				.attr("value","ѡ��")
				.data("radioIndex",radioIndex)
				.click(function(){
					var radioid =  $(this).data("radioIndex");
					window.open('usertree.jsp?formname=form1&nameinput=nameinput'+ radioid +'&idinput=idinput'+radioid,'usertree','scrollbars=yes,status=yes,width=400,height=600');
				});
		//��������ԭ�����ͬ��,ֻ����value,idֵ���ܲ�̫һ��
	}else if(nextObj.userType == 'assignee'){//��Ϊ����[��]
		returnObj.nameinput = $('<input/>')
				.attr("type","text")
				.attr("style","margin-top:1px;margin-bottom:1px;width:160px;background:url(../images/icon/bg_input_text.png) no-repeat;height:18px;border:1px solid #B5B8C8;padding:3px 0 0 3px;vertical-align:middle;")
				.attr("name","nameinput"+radioIndex)
				.attr("id","nameinput"+radioIndex)
				.attr("value","");
		
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value","")
				.data("user",user==undefined?"":user);
		
		returnObj.button = $('<input/>')
				.attr("type","button")
				.attr("style","width:50px;margin:0 0 0 5px;")
				.attr("value","ѡ��")
				.data("radioIndex",radioIndex)
				.click(function(){
					var radioid =  $(this).data("radioIndex");
					window.open('usertree.jsp?formname=form1&nameinput=nameinput'+ radioid +'&idinput=idinput'+radioid,'usertree','scrollbars=yes,status=yes,width=400,height=600');
				});
		
	}else if(nextObj.userType == 'endprocess'){//��Ϊ��������
		returnObj.nameinput = "��������";
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.user)
				.data("user",user==undefined?"":user);
		
	}else if(nextObj.userType == 'decisionprocess'){//��Ϊ�ж�����
		returnObj.nameinput = "�Զ���ת�ڵ�";
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.user==undefined?"":nextObj.user)
				.data("user",user==undefined?"":user)
				.data("type","decision");
		
	}else{
		returnObj.nameinput = "";
		returnObj.idinput = "";
		returnObj.button = "";
	}
	return returnObj;
}

/**
 * �ύ����
 */
function taskSubmit(){
	//var taskId = $('input[name="taskid"]').val();
	var taskId = $('#taskid').val();//����id
	var tagname = 'null';//��һ��ǩ��
	var outRadio = '';//text��ֵ
	var outValue = '';//������id
	var outTo = '';//��ת�����ߵ�name
	var outType = '';//�û�����
	var assValue = '';//������key
	var check = $('input:checked');//ѡ�е�radio
	
	//��û��radio,��ȡhidden
	if(check.size()==0 && $("input[type='radio']").size()==0){
		check = $("#outradio");
	}
	if(check.size()!=0){
		tagname = $(check).data("tagName");
		var type = "";//����������Ƿ����ж�����
		if(tagname=="fork" || tagname=="join"){//fork�����������˿���Ϊ���,joinҲ����������Ϊ��fork������ʽ��ͬ
			outRadio = check.val();//�ڼ���radio
			//ѭ�������ߵ�text
			$($("input[name*='idinput"+outRadio+"_']")).each(function(){
				//�û�����
				var user = $(this).data("user");
				type = $(this).data("type");
				//��ȡ���û�������Ӧ���û�idֵ
				if(user!=undefined && user!=""){
					assValue += user+",";
					if($(this).val()!="")
						outValue += $(this).val()+",";
					else{
						outValue = "";
						return false;
					}
				}
			});
			//�Ƿ���ѡ���û�,���Һ�����Ĳ����жϽڵ�
			if(outValue=="" && (type==undefined || type==null)){
				alert("��ѡ�����̽����û�");
				return;
			}
			
			//������name
			outTo = $(check).data("outName");
			//�û�����
			outType = $(check).data("userType");
		}else{//�����������һ����->ֱ��ȡtext��ֵ����
			outRadio = check.val();
			outValue = $("#idinput"+outRadio).val();
			type = $("#idinput"+outRadio).data("type");

		//	alert(type)
			if(outValue=="" && (type==undefined || type==null)){
				alert("��ѡ�����̽����û�");
				return;
			}
			//debug//���ﲻ��ֱ�Ӵ����ְ�?!
			outTo = $(check).data("outName");
			outType = $(check).data("userType");
			assValue = $(check).data("user");
		}
	}else{
		alert("��ѡ����ת�ڵ�");
		return;
	}
	//'taskid='+����id+'&outto='+��ת�����ߵ�name+'&outtype='+��ת����+'&outvalue='+������id+'&assvalue='+������key
	var postText = 'tagname='+tagname+'&taskid='+taskId+'&outto='+outTo+'&outtype='+outType+'&outvalue='+outValue+'&assvalue='+assValue;
	//alert(postText);
	XMLHttp.sendReq('POST', 'checkout.do', postText, result);
}

/**
 * �ύ��ķ��ط���
 */
function result(xmlObject){
	xmlDoc = xmlObject.responseXML;
	if ($(xmlDoc).find('returnResult > result').attr('return') == "success") {
		alert("����ɹ�");
		returnValue = 'success';
	}else {
		alert("����ʧ��");
		returnValue = 'error';
	}
	self.close();
}