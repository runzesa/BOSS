
function behavior(link)
{
	var els = document.forms[0].elements;
	for(var i=0;i<els.length;i++)
	{
		if(els[i].check)
		{
			var sReg = els[i].check;
			var sVal = GetValue(els[i]);
			var reg ;
			switch(sReg){
				case "notNull":
					reg = new RegExp("[^\f\n\r\t\v]","g");break;
				case "number":
					reg = new RegExp("[0-9]","g");break;
			}
			var flag=reg.test(sVal);
			if(!flag)
			{
				alert(els[i].warning);
				GoBack(els[i])
				return false;
			}
		}
	}
	document.forms[0].action=link;
	document.forms[0].submit();
}

function GetValue(el)
{
	var sType = el.type;
	switch(sType)
	{
		case "text":
		case "hidden":
		case "password":
		case "file":
		case "textarea": return el.value;
		case "checkbox":
		case "radio": return GetValueChoose(el);
		case "select-one":
		case "select-multiple": return GetValueSel(el);
	}
	
	function GetValueChoose(el)
	{
		var sValue = "";
		var tmpels = document.getElementsByName(el.name);
		for(var i=0;i<tmpels.length;i++)
		{
			if(tmpels[i].checked)
			{
				sValue += "0";
			}
		}
		return sValue;
	}
	
	function GetValueSel(el)
	{
		var sValue = "";
		for(var i=0;i<el.options.length;i++)
		{
			if(el.options[i].selected && el.options[i].value!="")
			{
				sValue += "0";
			}
		}
		return sValue;
	}
}

function GoBack(el)
{
	var sType = el.type;
	switch(sType)
	{
		case "text":
		case "hidden":
		case "password":
		case "file":
		case "textarea": el.focus();var rng = el.createTextRange(); rng.collapse(false); rng.select();
		case "checkbox":
		case "radio": var els = document.getElementsByName(el.name);els[0].focus();
		case "select-one":
		case "select-multiple":el.focus();
	}
}