//search.js������zDialog.js֮������
var styleHref = document.getElementById('mainstyle').href;
var styleItem = styleHref.split("/");
var styleType;
if(styleItem[0]=='..')
	styleType=styleItem[2];
else
	styleType=styleItem[5];
IMAGESPATH = '../images/' + styleType + '/dialog/';
var dialogDiv;

//ȡ����ѯ
function afterCancelButton(){
	Dialog.close();
}

/** �߼���ѯ **/

//�������
function adsearchAdd(){
	var adlist = document.getElementById("adsearchlist");
	if(isOver(adlist)){
		Dialog.alert("�����ѽ���");
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
		Dialog.alert("����������");
	}
}

//�ύ�߼���ѯ�������
function adsearchEnter(){
	var adlist = document.getElementById("adsearchlist");
	var listSize = adlist.options.length;
	if(listSize==0){
		Dialog.alert("�������ѯ����");
		return;
	}
	if(!isOver(adlist)){
		Dialog.alert("����δ����");
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

//˫���б�����Ŀɾ����Ӧ����
function adsearchSub(){
	var adlist = document.getElementById("adsearchlist");
	if(adlist.selectedIndex != -1){
		adlist.remove(adlist.selectedIndex);
	}
}

//�ж������Ƿ��ѽ���
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

//��������ʾ�߼���ѯ�Ի���
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
					"<option value='ADSequal'>����(=)</option>" +
					"<option value='ADSlike'>����(like)</option>" +
					"<option value='ADSgreat'>����(\<)</option>" +
					"<option value='ADSegreat'>���ڵ���(��)</option>" +
					"<option value='ADSless'>С��(\<)</option>" +
					"<option value='ADSeless'>С�ڵ���(��)</option>" +
					"<option value='ADSnequal'>������(��)</option>" +
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
					"<option value='ADSover'>(����)</option>" +
					"<option value='ADSand'>��(and)</option>" +
					"<option value='ADSor'>��(or)</option>" +
					"</select>" +
				"</div>" +
			"</td>" +
			"<td>" +
				"<div align='left'>" +
				"<button id='addButton' onclick='adsearchAdd()' style='margin:0 10px 0 0;width:60px;'>���</button>" +
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
	diag.Title = "�߼���ѯ";
	diag.Message = "�߼���ѯ,�Զ����ѯ����������������.";
	diag.InnerHtml = dialogDiv;
	diag.OKEvent = adsearchEnter;
	//diag.CancelEvent = afterCancelButton;
	diag.show();
}

/** ���ϲ�ѯ **/

//�ύ��ѯ
function adsearchEnterMix(){
	if(!isEmpty()){
		Dialog.alert("�������ѯ����");
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

//�ж��Ƿ��������ѯ����
function isEmpty(){
	var inputs = document.getElementById('mixsearch').getElementsByTagName("input");
	for(var i=0; i<inputs.length; ++i){
		if (inputs[i].value != '') return true;
	}
	return false;
}

//��������ʾ���ϲ�ѯ�Ի���
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
	diag.Title = "���ϲ�ѯ";
	diag.Message = "���ϲ�ѯ,ѡ���ض��ֶν���ģ����ѯ.";
	diag.InnerHtml = dialogDiv;
	diag.OKEvent = adsearchEnterMix;
	diag.show();
}

