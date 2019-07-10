app.service('OrderService', function($http) {
	this.findAll = function() {
		return $http.get(base + '/Order/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post(base + '/Order/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post(base + '/Order/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get(base + '/Order/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get(base + '/Order/delete.do?ids=' + ids, { withCredentials: true });
	}
	//保存订单
	this.submitOrder=function(order){
		return $http.post(base +'/Order/add.do',order, { withCredentials: true });		
	}
	
	//查询订单
	this.findByUserName=function(status){
		return $http.get(base +'/Order/findByUserName.do?status='+status, { withCredentials: true });		
	}
	//根据ID获取实体
	this.findByOrderId=function(id){
		return $http.get(base +'/Order/findByOrderId.do?orderid='+id, { withCredentials: true });		
	}
	
	//查询订单
	this.findBySellerId=function(status){
		return $http.get(base +'/Order/findBySellerId.do?status='+status, { withCredentials: true });		
	}
	//根据订单号更改状态
	this.UpdateOrderStatus=function(id,stauts){
		return $http.get(base +'/Order/UpdateOrderStatus.do?id='+id+'&stauts='+stauts, { withCredentials: true });		
	}	


});