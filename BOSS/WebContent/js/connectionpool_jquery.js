var XMLHttp_Jquery = {
	encodeData: function(data){
		return encodeURI(encodeURI(data));
	},
	decodeData: function(data){
		return decodeURI(decodeURI(data));
	},
    // 发送请求(方法[post,get], 地址, 数据, 回调函数)
    sendReq: function (method, url, data, callback){
		url=this.encodeData(url);
    	$.ajax({
			url:url,
			type:method,
//			dataType: "xml",
			data:data ,
			success: function(xml){
    		var obj = {};
    		obj.responseText = xml;
    		obj.responseXML = xml;
				return callback(obj)
			}
		});
    }
};  