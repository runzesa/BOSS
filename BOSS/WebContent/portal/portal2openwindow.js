// JavaScript Document
function pageLoad(){
            document.getElementById("portal").value = portal;
			//XMLHttp.sendReq('GET', 'portal2openselect.jsp', '', functionSelect);	
}

function functionSelect(xmlObject){
	deleteAllOptions("function");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("function",rows);
	textx();
}

function textx()
{
	var zz = document.getElementById("function");
	var xy = zz.options[zz.selectedIndex].value; 

	XMLHttp.sendReq('GET', 'portal2opentext.jsp?selectX='+xy, '', cellText);
}

function cellText(xmlObject)
{ 	
    var Result =xmlObject.responseText;
	document.getElementById("againNewPassword").value="../" + Result + "/select";
	document.getElementById("NewPassword").value ="../" + Result + "/select";
}

function chosetype(type){
	var newtype="";
	if(document.getElementById("againNewPassword").value!=""){
		shuzu =document.getElementById("againNewPassword").value.split(".");
		for(var i=0;i<shuzu.length-1;++i){
			newtype=newtype+shuzu[i]+".";
		}
		newtype+=type;
		document.getElementById("againNewPassword").value=newtype;
	}
}