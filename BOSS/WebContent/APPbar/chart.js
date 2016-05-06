
function pageLoad(){
	XMLHttp.sendReq('GET', 'chart.do', '', chartData);
}

function chartData(xmlObject){

	var imageUrl=xmlObject.responseText;
	//alert(imageUrl);
	document.getElementById("chart").innerHTML="<img border=0 src='"+imageUrl+"'>";
	
}
