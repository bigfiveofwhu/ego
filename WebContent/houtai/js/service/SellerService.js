app.service('SellerService', function($http) {
	this.findAll = function() {
		return $http.get(base + '/Seller/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post(base + '/Seller/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post(base + '/Seller/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get(base + '/Seller/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get(base + '/Seller/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.updateStatus = function(sellerId, status) {
		return $http.get(base + '/Seller/updateStatus.do?sellerId=' + sellerId + '&status=' + status, { withCredentials: true });
	}
	this.login = function(entity) {
		return $http.post(base + '/Seller/login.do', entity, { withCredentials: true });
	}
	this.exit = function(sellerId, name) {
		return $http.get(base + '/Seller/exit.do?sellerId=' + sellerId + '&name=' + name, { withCredentials: true });
	}
	this.changepasswd = function(entity) {
		return $http.post(base + '/Seller/changepasswd.do', entity, { withCredentials: true });
	}
});