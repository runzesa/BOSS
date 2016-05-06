function tableRowStyle(cls) {
    $each($$('table' + cls), function(table, index){
        var tbody = table.getElement('tbody');
        if (tbody) {
            $each($(tbody).getElements('tr:even'), function(row, index){
              $(row).addClass('even');
            });
        } else {
            //alert("don't found tbody!");
        }
    });
}

function tableRowActive(cls) {
    $each($$('table' + cls), function(table, index){
        var tbody = table.getElement('tbody');
        if (tbody) {
            $each($(tbody).getElements('tr'), function(row, index){
                row.addEvents({
                    'mouseover': function(){
                        this.addClass('active');
                    },
                    'mouseout': function(){
                        this.removeClass('active');
                    }
                });
            });
        } else {
            //alert("don't found tbody!");
        }
    });
}

function tableRowSelect(cls) {
    $each($$('table' + cls), function(table, index){
        var tbody = table.getElement('tbody');
        if (tbody) {
        
            $each($(tbody).getElements('tr'), function(row, index){
                row.addEvents({
                    'click' : function(){
                        if (this.hasClass('selected')) {
                            this.removeClass('selected');
                        } else {
                            this.addClass('selected');
                        }
                    }
                });
            });
        } else {
            //alert("don't found tbody!");
        }
    });
}

function TableEditable(cls) {
  $each($$('table' + cls), function(table, index){
    if (table.editable)
      return;
    
    table.editable=true;
    
    var tbody = table.getElement('tbody');
    if (tbody) {
      $each($(tbody).getElements('tr'), function(row, index){

        $each($(row).getElements('*[command=cancel]'), function(ele) {
          ele.innerText = table.CancelText || 'Cancel';
          ele.setStyle('display','none');
          
          ele.addEvent('click', function() {
          
            if (!confirm('Cancel current edit content?')) {
              return false;
            }
            
            $each($(row).getElements('td[editable=true]'), function(td) {
              $each($(td).getElements('input[name='+td.name+']'), function(ipt) {
                ipt.destroy();
                td.innerText = td.Text;
              });
            });
            
            $each($(row).getElements('*[command=edit]'), function(ele) {
              ele.innerText=table.EditText||'Edit';
              ele.edit=false;
            });

            $each($(row).getElements('*[command=cancel]'), function(ele) {
              ele.setStyle('display','none');
            });

            return false;
          });
        });
      
        $each($(row).getElements('*[command=edit]'), function(ele) {
          ele.innerText = table.EditText || 'Edit';
          ele.addEvent('click', function() {
          
            if ($defined(table.UpdateUrl)) {
              if (ele.edit) {
                // post save request
                var frm = new Element('form', {action:table.UpdateUrl, method: 'post'});
                row.adopt(frm);
                frm.adopt(new Element('input', {type:'hidden', name:'key', value:row.key}));

                ele.innerText=table.EditText||'Edit';
                ele.edit=false;
                $each($(row).getElements('*[command=cancel]'), function(ele) {
                  ele.setStyle('display','none');
                });

                $each($(row).getElements('td[editable=true]'), function(td) {
                  $each($(td).getElements('input[name='+td.name+']'), function(ipt) {
                    td.Text = ipt.value;
                    ipt.destroy();
                    td.innerText = td.Text;
                  });
                
                  frm.adopt(new Element('input', {type:'hidden', name:td.name, value:td.innerText}));
                });
                
                frm.submit();
                
              } else {
                this.innerText=table.SaveText||'Save';
                this.edit=true;
                $each($(row).getElements('*[command=cancel]'), function(ele) {
                  ele.setStyle('display','');
                });

                $each($(row).getElements('td[editable=true]'), function(td) {
                  td.Text = td.innerText;
                  td.innerText = '';
                  td.adopt(new Element('input', {type:'text', name:td.name, value:td.Text, style:'margin:0;padding:0;text-align:'+td.align}));
                });
              }
            }
            
            return false;
          });
        });
        
        $each($(row).getElements('*[command=delete]'), function(ele) {
          ele.innerText = table.DeleteText || 'Delete';
          ele.addEvent('click', function() {
          
            if ($defined(table.DeleteUrl)) {
              if (confirm('delete ' + row.key + ', Are you sure?')) {
                // post delete request
                var frm = new Element('form', {action:table.DeleteUrl, method: 'post'});
                row.adopt(frm);
                frm.adopt(new Element('input', {type:'hidden', name:'key', value:row.key}));
                frm.submit();
              }
            }
            
            return false;
          });
        });
      });
      
      var tfoot = table.getElement('tfoot');
      if (tfoot) {
        $each($(tfoot).getElements('*[command=delete]'), function(ele) {
          ele.innerText = table.DeleteText || 'Delete';
          ele.addEvent('click', function(){
          
            if (!confirm('确定要'+this.innerText+'所有选中的数据吗？')) {
              return false;
            }
            
            var keys = new Array();
            
            $each($(tbody).getElements('tr'), function(row, index){
              $each($(row).getElements('*[command=select]'), function(ele) {
                if(ele.checked) {
                  keys = keys.include([row.key]);
                }
              });
            });

            var frm = new Element('form', {action:table.DeleteUrl, method: 'post'});
            tfoot.adopt(frm);
            keys.each(function(key){
              frm.adopt(new Element('input', {type:'hidden', name:'key', value:key}));
            });
            frm.submit();
            
            return false;
            
          });
        });
        
        $each($(tfoot).getElements('*[command=select]'), function(selected) {
          selected.addEvent('click', function(){
            $each($(tbody).getElements('tr'), function(row, index){
              $each($(row).getElements('*[command=select]'), function(ele) {
                ele.checked = selected.checked;
              });
            });
          
          });
        });
      } else {
        // alert('don't found tfoot!");
      }        
    } else {
      //alert("don't found tbody!");
    }    
  });
}

window.addEvent('domready', function() {
  tableRowStyle('.data');
  tableRowSelect('.data');
  tableRowActive('.data');

  tableRowStyle('.edit');

  var elements = document.getElementsByTagName('textarea');
  for (var i = 0; i < elements.length; i++) {
    elements[i].style.overflowY='hidden';
    elements[i].style.width = "99%";
    elements[i].style.height=Math.max(elements[i].scrollHeight, 100)+'px';
    elements[i].onpropertychange=function(){
      this.style.height=Math.max(this.scrollHeight, 100)+'px';
    };
    elements[i].oninput=function() {
      this.style.height=Math.max(this.scrollHeight, 100)+'px';
    };
    elements[i].onchange=function() {
      this.style.height=Math.max(this.scrollHeight, 100)+'px';
    };
  }
});


