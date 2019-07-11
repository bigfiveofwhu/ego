app.service('ContentCategoryService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9101" + '/ContentCategory/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9101" + '/ContentCategory/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post("http://127.0.0.1:9101" + '/ContentCategory/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9101" + '/ContentCategory/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9101" + '/ContentCategory/delete.do?ids=' + ids, { withCredentials: true });
	}
});
