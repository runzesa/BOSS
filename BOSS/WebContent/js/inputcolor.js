	$('input:text').each(function(){
		$(this).focus(function(){
			this.className = 'input_on';
			$(this).unbind('mouseout');
		}); 
		$(this).blur(function(){
			this.className = 'input_off';
			$(this).mouseout(function(){
				this.className = 'input_out';
			});
		});
		$(this).mousemove(function(){
			this.className = 'input_move';
		});
		$(this).mouseout(function(){
			this.className = 'input_out';
		});
	});
	
	var Check = {
		x : false,
		showDiv : function(oId){
			var obj = document.getElementById(oId).value;
			if(obj==null || obj==""){
				var odiv = document.getElementById(oId+"_div");
				if(odiv==null){
					var htmlv = document.getElementById(oId);
					htmlv.insertAdjacentHTML("afterEnd","<span id='"+oId+"_div' class='input_opendiv';'>不可为空</span>");
					
					//.outerHTML+"<div id='"+oId+"_div'>不可为空</div>";
					//document.getElementById(oId).parentElement.innerHTML=htmlv;
					setTimeout("document.getElementById('"+oId+"').focus()","10");
				}else{
					odiv.style.display="";
				}
				x=false;
			}
		},
		removeDiv : function(oId){
			var obj = document.getElementById(oId).value;
			var odiv = document.getElementById(oId+"_div");
			if(!x){
				odiv.style.display="none";
				x=true;
			}else if(obj.length==1 && event.keyCode==8){
				odiv.style.display="";
				x=false;
			}
		},
		checkDiv : function(oId){
			var odiv = document.getElementById(oId+"_div");
			if(odiv!=null){
				odiv.style.display="none";
			}
		}
	}
	
	var getFunction = {
		x : false,
		onkeydown : function(oId){
			return function(){Check.removeDiv(oId)}
		},
		onblur : function(oId){
			return function(){Check.checkDiv(oId)}
		},
		onfocus : function(oId){
			return function(){Check.showDiv(oId)}
		}
	}
	function loadCheck(){
		var checkObj = ["noemputy","money","name"];
		for(var i = 0;i<checkObj.length;i++){
			if(document.getElementById(checkObj[i])!=null){
				document.getElementById(checkObj[i]).attachEvent("onkeydown",getFunction.onkeydown(checkObj[i]));
				document.getElementById(checkObj[i]).attachEvent("onblur",getFunction.onblur(checkObj[i]));
				document.getElementById(checkObj[i]).attachEvent("onfocus",getFunction.onfocus(checkObj[i]));
			}
		}
	} 