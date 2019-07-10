app.service('payService',function($http){
	//本地支付
	this.createNative=function(return_url,type){
		return $http.get('http://127.0.0.1:9107/Pay/createNative.do?return_url='+return_url+'&type='+type, { withCredentials: true });
	}	

	this.UpdatePayStatus=function(id){
		return $http.get('http://127.0.0.1:9107/Pay/UpdatePayStatus.do?out_trade_no='+id, { withCredentials: true });
	}	
});
