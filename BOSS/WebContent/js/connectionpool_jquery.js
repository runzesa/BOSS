var XMLHttp_Jquery = {
	encodeData: function(data){
		return encodeURI(encodeURI(data));
	},
	decodeData: function(data){
		return decodeURI(decodeURI(data));
	},
    // ��������(����[post,get], ��ַ, ����, �ص�����)
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