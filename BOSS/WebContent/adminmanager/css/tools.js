var txt_sch="<input type=\"text\" name=\"searchvalue\" size=\"30\" >";
var button_submit=" <input type=submit value=\"ËÑË÷\"><input type=hidden name=\"searchfield\">&nbsp;<input type=\"button\" value='¹Ø±Õ' onclick=\"document.getElementById('search').style.display='none';window.location.reload();\">";
function search(field){
	document.all("search").innerHTML=txt_sch+button_submit;
	document.all("search").style.display='';
	document.searchForm.searchfield.value=field;
}