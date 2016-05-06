/*!
 * MessageBox v1.0
 * with jquery1.4.1 & jquery.simplemodal 1.3.4
 * version 1.0.1 (04/18/2010)
 * Requires jQuery v1.4.1 or later
 * http://hi.baidu.com/herozoo
 * Authors: heroZ
 */

/**
 * messageBox.loading([type])
 * type: save | del(default)
 * messageBox.alert(msg[,type][,callBack])
 * type: error | success | information(default)
 * messageBox.confirm(msg[,callBack])
 * ...
 */

var messageBox = {
    _typePath: '../images/icon/message_',
    //messageBox for loading;
    loading: function(type){
        this._createLoading(type);
        this._confirm_loading();
    },
    _createLoading: function(type){
        $.modal.close();
        $('#message_box').empty();
        var typePath = this._typePath;
        if (type == 'save') 
            typePath += 'save.gif';
        else 
            typePath += 'del.gif';
        var box = "<div id='confirm_loading'>";
        box += "<img src='" + typePath + "' />";
        box += "</div>";
        $('#message_box').append($(box));
    },
    _confirm_loading: function(){
        $('#confirm_loading').modal({
            closeHTML: "<a href='#' title='Close' class='modal-close'><img src='../images/icon/close.gif'></a>",
            position: ["30%", ],
            overlayId: 'confirm-overlay',
            containerId: 'confirm_loading'
        });
    },
    //messageBox for alert;
    alert: function(msg, type, enter){
        this._createAlert(type);
        this._confirm_alert(msg, function(){
			if (enter != null) 
                enter.call();
            else 
                $.modal.close();
        });
    },
    _createAlert: function(type){
        $.modal.close();
        $('#message_box').empty();
        var typePath = this._typePath;
        if (type == 'error') 
            typePath += 'error.gif';
        else if (type == 'success') 
			typePath += 'success.gif';
		else 
			typePath += 'information.gif';
        var box = "<div id='confirm'>";
        box += "<div class='header'><span>提示：</span></div>";
        box += "<img class='message_img' src='" + typePath + "' /><p class='message'></p>";
        box += "<div class='buttons'>";
        box += "<div class='message_enter'>确定</div>";
        box += "</div></div>";
        $('#message_box').append($(box));
    },
    _confirm_alert: function(message, callback){
        $('#confirm').modal({
            closeHTML: "<a href='#' title='Close' class='modal-close'><img src='../images/icon/close.gif'></a>",
            position: ["30%", ],
            overlayId: 'confirm-overlay',
            containerId: 'confirm-container',
            onShow: function(dialog){
                $('.message', dialog.data[0]).append(message);
                $('.message_enter', dialog.data[0]).click(function(){
                    if ($.isFunction(callback)) {
                        callback.apply();
                    }
                    $.modal.close();
                });
            }
        });
    },
    //messageBox for confirm;	
    confirm: function(msg, affirm){
        this._createConfirm();
        this._confirm_confirm(msg, function(){
            affirm.call();
        });
    },
    _createConfirm: function(){
        $.modal.close();
        $('#message_box').empty();
        var typePath = this._typePath;
        typePath += 'decision.gif';
        var box = "<div id='confirm'>";
        box += "<div class='header'><span>提示：</span></div>";
        box += "<img class='message_img' src='" + typePath + "' /><p class='message'></p>";
        box += "<div class='buttons'>";
        box += "<div class='no simplemodal-close'>否</div><div class='yes'>是</div>";
        box += "</div></div>";
        $('#message_box').append($(box));
    },
    _confirm_confirm: function(message, callback){
        $('#confirm').modal({
            closeHTML: "<a href='#' title='Close' class='modal-close'><img src='../images/icon/close.gif'></a>",
            position: ["30%", ],
            overlayId: 'confirm-overlay',
            containerId: 'confirm-container',
            onShow: function(dialog){
                $('.message', dialog.data[0]).append(message);
                
                $('.yes', dialog.data[0]).click(function(){
                    if ($.isFunction(callback)) {
                        callback.apply();
                    }
                    $.modal.close();
                });
            }
        });
    }
    
};
