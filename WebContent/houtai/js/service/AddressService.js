app.service('AddressService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9106" + '/Address/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9106" + '/Address/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post("http://127.0.0.1:9106" + '/Address/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9106" + '/Address/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9106" + '/Address/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.findAddressList=function(){
		return $http.get("http://127.0.0.1:9106"+'/Address/findListByLoginUser.do', { withCredentials: true });	
	}
	
	this.setteingDefault=function(id){
		return $http.get("http://127.0.0.1:9106"+'/Address/setteingDefault.do?id='+id, { withCredentials: true });	
	}
	this.findByProvinces=function(){
		return $http.get("http://127.0.0.1:9106"+'/Address/findByProvinces.do', { withCredentials: true });	
	}
	this.findByCities=function(){
		return $http.get("http://127.0.0.1:9106"+'/Address/findByCities.do', { withCredentials: true });	
	}
	this.findByAreas=function(){
		return $http.get("http://127.0.0.1:9106"+'/Address/findByAreas.do', { withCredentials: true });	
	}
	this.findByCityId=function(parentId){
		return $http.get("http://127.0.0.1:9106"+'/Address/findByCityId.do?parentId='+parentId, { withCredentials: true });	
	}
	this.findByAreasId=function(parentId){
		return $http.get("http://127.0.0.1:9106"+'/Address/findByAreasId.do?parentId='+parentId, { withCredentials: true });	
	}
});