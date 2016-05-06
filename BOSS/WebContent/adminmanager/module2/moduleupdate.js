function getPortalOptions(){
	var portal = document.getElementById("portal").value;
	if(portal=="0"){
		document.getElementById("tr0").style.display="";
	}else{
		document.getElementById("tr0").style.display="none";
	}
}

function submit(){
	document.getElementById("field").value=document.getElementById("urlx2").value;
	document.form1.submit();
}
