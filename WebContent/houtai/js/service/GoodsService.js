app.service('GoodsService', function($http) {
	this.findAll = function() {
		return $http.get(base + '/Goods/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post(base + '/Goods/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post(base + '/Goods/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get(base + '/Goods/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get(base + '/Goods/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.updateStatus = function(ids, status) {
		return $http.get(base + '/Goods/updateStatus.do?ids=' + ids + '&status=' + status, { withCredentials: true });
	}
	this.isMarketable = function(ids, status) {
		return $http.get(base + '/Goods/isMarketable.do?ids=' + ids + '&status=' + status, { withCredentials: true });
	}
});