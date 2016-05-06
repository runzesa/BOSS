function treeClick(o){
  var obj,chk,disp,level,selectValue
  obj = event.srcElement;
  if (obj==o) return;
  if (obj.tagName=="INPUT"){
      chk = obj.checked;
	  level = parseInt(obj.parentElement.className.substring(1));
	  
	  var _obj = obj,_level = level-1;
	  getTreeValue(_obj.parentElement.parentElement);
	  return;
  }
  if (!obj.nextSibling) return;
  disp = obj.nextSibling.style.display!="block"?"block":"none";
  level = parseInt(obj.className.substring(1));
  while(obj.nextSibling&&parseInt(obj.nextSibling.className.substring(1))>level){
	obj = obj.nextSibling;
	obj.style.display = disp;
  }
}

function setParentCheck(obj){
	var level = parseInt(obj.parentElement.className.substring(1));
	var o = obj;
	while(o.parentElement.nextSibling&&parseInt(o.parentElement.nextSibling.className.substring(1))>level){
		o = o.parentElement.nextSibling.all.tags("INPUT")[0];
	    if (o.checked)return;
	}
	obj.checked = false;
}

function getTreeValue(o){
	var val = [];
	var objs = o.all.tags("INPUT");
	for (var i=0;i<objs.length ;i++ )if(objs[i].checked)val.push(objs[i].parentElement.val);
	o.previousSibling.value = val.join(",");

}

function checkBox(levelClass, checked) {
  $each($$(levelClass+' input[type=checkbox]'), function(obj) {
    obj.checked = checked;
	  getTreeValue(obj.parentElement.parentElement);
  });
}

function isValid() {
  var fd = document.getElementById('fromdate');
  var td = document.getElementById('todate');
  var lx = document.getElementById('type');
  var tj = document.getElementById('add');
  
  if (fd && !fd.value.match('\\d{4}-\\d{1,2}-\\d{1,2}')) {
    alert('请选择日期');
    fd.focus();
    return false;
  }
  if (td && !td.value.match('\\d{4}-\\d{1,2}-\\d{1,2}')) {
    alert('请选择日期');
    td.focus();
    return false;
  }
  if (tj && tj.value == '') {
    alert('至少选择一个销售地区!');
    return false;
  }
  if (lx && lx.value == '') {
	alert('至少选择一个销售类型!');
	return false;
  }
  return true;
}
function date0() {
  var today = new Date();
  var day = today.getDay();
  if (day == 0) day = 7;
  day--;
  day+=7;
  day *= 24*60*60*1000;
  var b = new Date(today.getTime() - day);
  var e = new Date(b.getTime() + 7*24*60*60*1000);
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}
function date1() {
  var today = new Date();
  var day = today.getDay();
  if (day == 0) day = 7;
  day--;
  day *= 24*60*60*1000;
  var b = new Date(today.getTime() - day);
  var e = new Date(b.getTime() + 7*24*60*60*1000);
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}
function date2() {
  var today = new Date();
  today.setDate(1);
  today.setMonth(today.getMonth()-1);

  var b = new Date(today.getTime());
  today.setMonth(today.getMonth()+1);
  var e = new Date(today.getTime());
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}
function date3() {
  var today = new Date();
  today.setDate(1);

  var b = new Date(today.getTime());
  today.setMonth(today.getMonth()+1);
  var e = new Date(today.getTime());
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}
function date4() {
  var today = new Date();
  today.setDate(today.getDate() - 1);

  var b = new Date(today.getTime());
  today.setDate(today.getDate()+1);
  var e = new Date(today.getTime());
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}
function date5() {
  var today = new Date();

  var b = new Date(today.getTime());
  today.setDate(today.getDate()+1);
  var e = new Date(today.getTime());
  
  $('fromdate').value = b.getYear()+"-"+(b.getMonth()+1)+"-"+b.getDate();
  $('todate').value = e.getYear()+"-"+(e.getMonth()+1)+"-"+e.getDate();
}