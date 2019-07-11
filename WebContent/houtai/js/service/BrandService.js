app.service('BrandService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9101" + '/Brand/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9101" + '/Brand/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post("http://127.0.0.1:9101" + '/Brand/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9101" + '/Brand/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9101" + '/Brand/delete.do?ids=' + ids, { withCredentials: true });
	}

});