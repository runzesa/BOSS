function getCurPageUrl() {
  return location.href.match(/http:\/\/.*?(\/.*)$/)[1].match(/^([^?]+)/)[1];
}

window.addEvent('domready', function() {

  // 全部修改数量
  $each($$('.allcount'), function(all, idx){
      all.addEvent('change', function(){
          var value = this.value;
          var table = this.dest;
          
          if (value.match('^\\d+$')) {
              if (table) {
                  $each($(table).getElements('input[name=count]'), function(obj, index){
                      obj.value = value;
                  });
              }
          } else {
              this.value = "";
              alert('输入的数量有误!');
          }
      });
  });
  
  // 分类切换
  $each($$('.tabs'), function(one, idx) {
    
    $each(one.getElements('div'), function(item, idx){
      if (idx == 0) {
        this.first_tab = item;
      }
      if (Cookie.read(getCurPageUrl()+'_saved_tab') == idx) {
        this.selected_tab = item;
      }
      
      item.removeClass('selected');
      if ($(item.dest))
        $(item.dest).addClass('hide');
        
      item.indexNum=idx;
      item.addEvent('click', function(){
        $each($$('.tabs'), function(one, idx) {
          $each(one.getElements('div'), function(item, idx){
            item.removeClass('selected');
            if ($(item.dest))
              $(item.dest).addClass('hide');
          });
        });

        this.addClass('selected');
        if ($(this.dest))
          $(this.dest).removeClass('hide');
          
        // save cookie
        Cookie.write(getCurPageUrl()+'_saved_tab', this.indexNum);
      });
    }, one);
    
    if (one.selected_tab && $(one.selected_tab.dest)) {
      one.selected_tab.addClass('selected');
      $(one.selected_tab.dest).removeClass('hide');
    } else if (one.first_tab && $(one.first_tab.dest)){
      one.first_tab.addClass('selected');
      $(one.first_tab.dest).removeClass('hide');
    }
  });
});
