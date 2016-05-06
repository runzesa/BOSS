function setday(varx){
	var type = get_type(document.getElementsByName('searchfield')[0].value+'_type');
	if(type=="shortdate"){
		Calendar.setup({
			inputField     :    "searchvalue",
			ifFormat       :    "%Y-%m-%d",
			singleClick    :    false,
			button         :    "searchvalue"
	 	});
	}else if(type=="longdate"){
		Calendar.setup({
			inputField     :    "searchvalue",
			ifFormat       :    "%Y-%m-%d %H:%M:00",
			showsTime      :    true,
			singleClick    :    false,
			step           :    1,
			button         :    "searchvalue"
	 	});
	}else{
	}
	setTimeout("document.getElementById('searchvalue').onclick=null","1000");
}

function setday_mixsearch(varx){
	if(varx.id.split("_").length!=2)
		return;
	var type = get_type(varx.id.split("_")[1]+"_type");
	if(type == "shortdate" || type == "shortdate"){
		Calendar.setup({
			inputField     :    "searchfields_"+varx.id.split("_")[1],
			ifFormat       :    "%Y-%m-%d",
			singleClick    :    false,
			button         :    "searchfields_"+varx.id.split("_")[1]
	 	});
	}else if(type=="longdate"){
		Calendar.setup({
			inputField     :    "searchvalue",
			ifFormat       :    "%Y-%m-%d %H:%M:00",
			showsTime      :    true,
			singleClick    :    false,
			step           :    1,
			button         :    "searchvalue"
	 	});
	}
}
