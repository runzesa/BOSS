function getQueryString(name){
	var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");
	if(reg.test(location.href)) 
		return decodeURI(decodeURI(unescape(RegExp.$2.replace(/\+/g, " ")))); 
	return ""; 
}
	
function initChart_Pie(){
	var ts = getQueryString('t').split(",");
	var vs = getQueryString('v').split(",");
	chartData = new Array();
	$(ts).each(function(i){	
		chartData[i] = [ts[i],parseFloat(vs[i])];	
	});
	initChart();
}
	
function initChart_Line(){
	dataGroup = new Array();
	var tem1_arr = getQueryString('group').split(",");
	$(tem1_arr).each(function(i){
		dataGroup.push(tem1_arr[i]);
	});
	dataValue = new Array();
	var tem2_arr = getQueryString('value').split(';');
	$(tem2_arr).each(function(i){
		tem2_arr2 = tem2_arr[i].split(":");
		if(tem2_arr2.length != 2)
			return false;
		var tem2_arr3 = tem2_arr2[1].split("_");
		var datav = new Array();
			
		$(tem2_arr3).each(function(k){
			if(k == tem2_arr3.length-1)
				return false;
			if(tem2_arr3[k]!=undefined && tem2_arr3[k]!="" &&tem2_arr3[k]!=null){
				datav.push(parseFloat(tem2_arr3[k]));
			}else{
				datav.push(0);
			}
		})
		dataValue.push({name:tem2_arr2[0],data:datav});
	});
	initChart();
}
/*

	dataGroup = new Array();
	var tem1_arr = getQueryString('group').split(",");
	$(tem1_arr).each(function(i){
		dataGroup.push(tem1_arr[i]);
	});
	dataValue = new Array();
	var tem2_arr = getQueryString('value').split(';');
	$(tem2_arr).each(function(i){
		tem2_arr2 = tem2_arr[i].split(":");
		if(tem2_arr2.length != 2)
			return false;
		var tem2_arr3 = tem2_arr2[1].split("_");
		var datav = new Array();
			
		$(tem2_arr3).each(function(k){
			if(k == tem2_arr3.length-1)
				return false;
			if(tem2_arr3[k]!=undefined && tem2_arr3[k]!="" &&tem2_arr3[k]!=null){
				datav.push(parseFloat(tem2_arr3[k]));
			}else{
				datav.push(0);
			}
		})
		dataValue.push({name:tem2_arr2[0],data:datav});
	});
	initChart();

*/