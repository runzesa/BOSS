var txt_sch="<input type=\"text\" name=\"searchvalue\" size=\"30\" >";
var button_submit=" <input type=submit value=\"ËÑË÷\"><input type=hidden name=\"searchfield\">";
function search(field){
	document.all("search").innerHTML=txt_sch+button_submit;
	document.searchForm.searchfield.value=field;
}