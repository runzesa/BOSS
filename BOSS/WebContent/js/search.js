//search.js必须在zDialog.js之后声明
var styleHref = document.getElementById('mainstyle').href;
var styleItem = styleHref.split("/");
var styleType;
if(styleItem[0]=='..')
	styleType=styleItem[2];
else
	styleType=styleItem[5];
IMAGESPATH = '../images/' + styleType + '/dialog/';
var dialogDiv;

//取消查询
function afterCancelButton(){
	Dialog.close();
}

/** 高级查询 **/

//添加条件
function adsearchAdd(){
	var adlist = document.getElementById("adsearchlist");
	if(isOver(adlist)){
		Dialog.alert("条件已结束");
		return;
	}
	var adname = document.getElementById("adsearchname");
	if(get_type(adname.value+'_type') == 'shortdate')
		var adnameValue = 'convert(varchar(10),' + adname.value + ',120)';
	else if(get_type(adname.value+'_type') == 'longdate')
		var adnameValue = 'convert(varchar(19),' + adname.value + ',120)';
	else
		var adnameValue = adname.value;
	var adnameText = adname.options(adname.selectedIndex).text;
	var adtype = document.getElementById("adsearchtype");
	var adtypeValue = adtype.value;
	var adtypeText = adtype.options(adtype.selectedIndex).text;
	var advalue = document.getElementById("adsearchvalue").value;
	var adlogic = document.getElementById("adsearchlogic");
	var adlogicValue = adlogic.value;
	var adlogicText = adlogic.options(adlogic.selectedIndex).text;
	
	var listOption = document.createElement("option");
	
	if(!(advalue==""||advalue==null)){
		adlist.options.add(listOption);
		if(adtypeValue=="ADSlike")
			listOption.value = adnameValue+" "+adtypeValue+"ADSdotADSpercent"+advalue+"ADSpercentADSdot"+adlogicValue;
		else        
			listOption.value = adnameValue+adtypeValue+"ADSdot"+advalue+"ADSdot"+adlogicValue;
		listOption.innerText = adnameText+"  "+adtypeText+"  "+advalue+"  "+adlogicText;	
	}else{
		Dialog.alert("条件不完整");
	}
}

//提交高级查询条件语句
function adsearchEnter(){
	var adlist = document.getElementById("adsearchlist");
	var listSize = adlist.options.length;
	if(listSize==0){
		Dialog.alert("请输入查询条件");
		return;
	}
	if(!isOver(adlist)){
		Dialog.alert("条件未结束");
		return;
	}
	var value = "";
	for(var i=0;i<listSize;++i){
		value+=adlist.options[i].value + " ";
	}
	value = value.replace(/\s/g,"ADSspace");;
	urlAdsearch = value;
	urlSearch="&searchfield=ADSsearchADS&searchvalue="+encodeURIComponent(urlAdsearch);
	afterCancelButton();
	urlPage="&pageNo=1";
	XMLHttp.sendReq('GET', 'select.do?'+url+urlOrder+urlSearch, '', selectdata);
}

//双击列表中条目删除相应内容
function adsearchSub(){
	var adlist = document.getElementById("adsearchlist");
	if(adlist.selectedIndex != -1){
		adlist.remove(adlist.selectedIndex);
	}
}

//判断条件是否已结束
function isOver(adlist){
	var listSize = adlist.options.length;
	if(listSize>0){
		var listValueSize = adlist.options[listSize-1].value.length;
		if((adlist.options[listSize-1].value).substring(listValueSize-7,listValueSize)=="ADSover"){
			return true;
		}else{
		return false;
		}
	}
}

//构建并显示高级查询对话框
function showAdsearch(){
	var mbox = document.createElement("div");
	mbox.id = 'adsearch';
    var ops = document.getElementById("searchfield").options;
    var sel = "<select id='adsearchname' name='adsearchname' style='width: 100px;' class='tag_select'>";
    for(var i = 0;i<ops.length;i++)
    	sel += "<option value='"+ops[i].value+"'>"+ops[i].text+"</option>";
    sel += "</select>";
    mbox.innerHTML="<form name='searchform' action='post'>" +
	"<table width='490' cellpadding='0' cellspacing='3' class='adsearch_div'>" +
		"<tr>" +
			"<td height='30' style='padding: 0 0 0 10px;'>" +
				"<div align='left'>" + sel +
				"</div>" +
			"</td>" +
			"<td>" +
				"<div align='left'>" +
					"<select id='adsearchtype' name='adsearchtype' style='width: 110px;' class='tag_select'>" +
					"<option value='ADSequal'>等于(=)</option>" +
					"<option value='ADSlike'>包含(like)</option>" +
					"<option value='ADSgreat'>大于(\<)</option>" +
					"<option value='ADSegreat'>大于等于(≥)</option>" +
					"<option value='ADSless'>小于(\<)</option>" +
					"<option value='ADSeless'>小于等于(≤)</option>" +
					"<option value='ADSnequal'>不等于(≠)</option>" +
					"</select>" +
				"</div>" +
			"</td>" +
			"<td>" +
				"<div align='left'>" +
				"<input type='text' id='adsearchvalue' style='width:90px;' />" +
				"</div>" +
			"</td>" +
			"<td>"+
				"<div align='left'>" +
					"<select id='adsearchlogic' name='adsearchlogic' class='tag_select'>" +
					"<option value='ADSover'>(结束)</option>" +
					"<option value='ADSand'>和(and)</option>" +
					"<option value='ADSor'>或(or)</option>" +
					"</select>" +
				"</div>" +
			"</td>" +
			"<td>" +
				"<div align='left'>" +
				"<button id='addButton' onclick='adsearchAdd()' style='margin:0 10px 0 0;width:60px;'>添加</button>" +
				"</div>" +
			"</td>" +
		"</tr>" +
		"<tr>" +
			"<td colspan='5' style='padding: 0 0 0 10px;'>" +
				"<div align='left'>" +
				"<select id='adsearchlist' name='adsearchlist' size='5' class='tag_select' style='width: 460px' ondblclick='adsearchSub()'>" +
				"</select>" +
				"</div>" +
			"</td>" +
		"</tr>" +
	"</table>" +
	"</form>";
	dialogDiv = mbox.innerHTML;
}

function openAdsearch(){
	showAdsearch();
	var diag = new Dialog();
	diag.Width = 500;
	diag.Height = 140;
	diag.Title = "高级查询";
	diag.Message = "高级查询,自定义查询条件用来过滤数据.";
	diag.InnerHtml = dialogDiv;
	diag.OKEvent = adsearchEnter;
	//diag.CancelEvent = afterCancelButton;
	diag.show();
}

/** 复合查询 **/

//提交查询
function adsearchEnterMix(){
	if(!isEmpty()){
		Dialog.alert("请输入查询条件");
		return;
	}
	var adlist = document.getElementsByTagName("input");
	var searchval = "";
	for(var i = 0;i<adlist.length;i++){
		var temvar = adlist[i].id.split("_");
		if(temvar.length==2 && temvar[0]=="searchfields"){
			if(document.getElementById(adlist[i].id).value!=""){
				if(searchval==""){
					var type = get_type(temvar[1]+"_type");
			    	if(type=="shortdate"||type=="longdate"){
			    		searchval+="convert(varchar(20),"+temvar[1]+",120)ADSspaceADSlikeADSdotADSpercent"+document.getElementById(adlist[i].id).value+"ADSpercentADSdot"
			    		continue;
			    	}
					searchval+=temvar[1]+"ADSspaceADSlikeADSdotADSpercent"+document.getElementById(adlist[i].id).value+"ADSpercentADSdot"
				}else{
					var type = get_type(temvar[1]+"_type");
			    	if(type=="shortdate"||type=="longdate"){
			    		searchval+="ADSandADSspace"+"convert(varchar(20),"+temvar[1]+",120)ADSspaceADSlikeADSdotADSpercent"+document.getElementById(adlist[i].id).value+"ADSpercentADSdot"
			    		continue;
			    	}
					searchval+="ADSandADSspace"+temvar[1]+"ADSspaceADSlikeADSdotADSpercent"+document.getElementById(adlist[i].id).value+"ADSpercentADSdot"
				}
			}
		}
	}
	searchval += "ADSoverADSspace";
	searchval = searchval.replace(/\s/g,"ADSspace");;
	urlSearch = "&searchfield=ADSsearchADS&searchvalue="+encodeURIComponent(searchval);
	afterCancelButton();
	urlPage = "&pageNo=1";
	XMLHttp.sendReq('GET', 'select.do?'+url+urlOrder+urlSearch, '', selectdata);
}

//判断是否已输入查询条件
function isEmpty(){
	var inputs = document.getElementById('mixsearch').getElementsByTagName("input");
	for(var i=0; i<inputs.length; ++i){
		if (inputs[i].value != '') return true;
	}
	return false;
}

//构建并显示复合查询对话框
function showMixSearch(){
	var mbox = document.createElement("div");
	mbox.id = 'adsearch';
    var ops = document.getElementById("searchfield").options;
	var texts = "<tr height='2'><td colspan='2' width='33%'></td><td colspan='2' width='33%'></td><td colspan='2' width='33%'></td></tr>" +
    	"<tr height='34'>";
    for(var i = 0; i<ops.length; i++){
		texts += "<td align='right'>" + ops[i].text + ":&nbsp;</td><td><input id='searchfields_"+ops[i].value+"' type='text' width='70' ";
		if(get_type(ops[i].value + "_type") == "shortdate" || get_type(ops[i].value + "_type") == "longdate")
			texts += " onfocus='setday_mixsearch(this)'/></td>";
		else
			texts += " /></td>";
		if((i+1)%3==0)
			texts += "</tr>";
    }
	if((ops.length+1)%3!=0)
		texts += "</tr>";
    mbox.innerHTML="<form name='searchform' action='post'>" +
	"<table id='mixsearch' width='450' cellpadding='0' cellspacing='3' class='adsearch_div'>" +
		"<tr>" +
			"<td colspan=2>" +
				"<table width='500' width=100% height=100% >" + texts + "</table>" +
			"</td>" +
		"</tr>" +
	"</table>" +
	"</form>";
	dialogDiv = mbox.innerHTML;
}

function openMixsearch(){
	showMixSearch();
	var diag = new Dialog();
	diag.Width = 520;
	diag.Height = 160;
	diag.Title = "复合查询";
	diag.Message = "复合查询,选择特定字段进行模糊查询.";
	diag.InnerHtml = dialogDiv;
	diag.OKEvent = adsearchEnterMix;
	diag.show();
}

