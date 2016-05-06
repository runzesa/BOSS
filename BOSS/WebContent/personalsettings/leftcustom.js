
var selectId = null;

function loadTree(){
	//树的图片目录
	$.jstree._themes = "../images/jstree/";
	
	$("#tree").jstree({
		"xml_data" : {
			"data" : ""+
				"<root>" +
					"<item id='0' state='closed' type='root'>" +
					"<content><name>根部门</name></content>" +
					"</item>" +
				"</root>",
			"ajax" : {
				"url" : "updateLeftSelectChild.do",
				"data" : function (n) {
					return {
						pid : n.attr("itemTarget")!=undefined ? n.attr("id")+":"+n.attr("itemTarget") : n.attr("id"),
						rand : new Date().getTime()
				}}
			},
			"xsl" : "nest"
		},
		"core" : { "animation" : 100 } ,
		"plugins" : [ "themes", "xml_data" ],
		"themes" : {
			"theme" : "classic"
		}
	})
	.bind('click.jstree', function(event) {//绑定树事件:点击
		var eventNodeName = event.target.nodeName; 
		if (eventNodeName == 'INS') { 
			return; 
		} else if (eventNodeName == 'A') { 
			var $subject = $(event.target).parent(); 
			if ($subject.find('ul').length > 0) {//枝节点
			} else { //叶节点
				var jsdata = $(event.target).parents('li').attr("jsdata");
				if(jsdata!=undefined && jsdata!="none"){
					addToHidden($(event.target).parents('li').attr("id"),jsdata);
				}
				

				var v_id = $(event.target).parents('li').attr('id');
				if(selectId==null || selectId!=v_id){
					$(event.target).css("background","#000080").css("color","#ffffff");
					$("#"+selectId).children("a").css("background","#ffffff").css("color","#000080");
					selectId = v_id;
				}
			} 
		}
	})
	.bind('loaded.jstree open_node.jstree', function(node , callback , skip_animation) {//绑定树的事件:初始化和打开节点
		var nodes = $('#tree').find("li");
		nodes.each(function(){
			var li = $(this);
			//初始展开根部门,并替换掉根部门图片
			if(li.attr("type")=="root"){
				var icon = $($(li.find("a")[0]).find("ins")[0]);//有checkbox就取第1个ins否则去第0个ins
				icon.removeClass("jstree-icon").addClass("jstree-root");
				if(nodes.length==1){
					$("#tree").jstree("open_node", li);
				}
			}
			//注销的部门为红色
			if(li.attr("color")!=undefined){
				li.find("a").css("color",li.attr("color"));
			}
		});
	});
}

function pageLoad(){
	$.post("updateLeftSelect.do",insertselectEdit);
}

function insertselectEdit(xmlObject){
	var row = $("row",xmlObject);
	var userSelectList = $("#userList");
	var userleftlist = $(row).find("userleft");
	$(userleftlist).each(function(i){
		var option = $("<option/>");
		$(option).attr("value",$(this).attr("id")+":"+$(this).attr("sleftid")+","+$(this).attr("name"));
		$(option).text($(this).attr("name"));
		userSelectList.append(option);
	});
}

/**
 * 将点击的模块的信息放到hidden中,此方法在action-UpdateLeftSelectChildAction中写入树的url调用
 * @param mid id
 * @param mname name
 */
function addToHidden(mid,mname){
	if(mid=="none")
		document.getElementById("selectedModule").value="";
	else
		document.getElementById("selectedModule").value=mid+","+mname;
}

/**
 * 将选中的模块添加到右侧列表
 */
function addToRight(){
	
	var selectedModule = $("#selectedModule");
	var val = selectedModule.val();
	var userSelectList = $("#userList")
	var options = userSelectList.find("option");
	var check = 0;
	if(val==""){
		return;
	}
	if(options.length>=10){
		messageBox.alert("只能添加十条常用功能！","error");
		return;
	}
	$(options).each(function(i){
		var opvalue = $(this).val();
		if(opvalue.indexOf(":")==-1){
			if(opvalue==val && val!=""){
				check=1;
				messageBox.alert("列表中已存在此模块！","error");
				return;
			}
		}else{
			opvalue = opvalue.substr(opvalue.indexOf(":")+1,opvalue.length);
			if(opvalue==val){
				check=1;
				messageBox.alert("列表中已存在此模块！","error");
				return;
			}
		}
	});
	if(check==0){
		var option = $("<option/>");
		option.attr("value",val);
		option.text(val.substr(val.indexOf(",")+1,val.length));
		userSelectList.append(option);
	}
}

/**
 * 将选中的模块从右侧列表中删除
 */
function removeModule(){
	var userSelectList = $("#userList")
	var options = userSelectList.find("option");
	$(options).each(function(i){
		if(this.selected==true){
			$(this).remove();
		}
	});
}

/**
 * 保存数据到数据库
 */
function sub(){
	messageBox.loading("save");
	var userSelectList = $("#userList")
	var options = userSelectList.find("option");
	var vals = "";
	$(options).each(function(i){
		vals+=$(this).val()+";";
	}); 
	$.post("updateLeft.do?list="+encodeURI(encodeURI(vals)),actionResult);
}

function actionResult(xmlObject){
	var field = $("field",xmlObject)
	if($(field).attr("value")=="true"){
		messageBox.alert("数据保存成功！","success",finalResult);
	}else{
		messageBox.alert("数据保存失败！","error");
	}
}

function finalResult(){
	window.dialogArguments.parent.leftFrame.location='../left.jsp';
}