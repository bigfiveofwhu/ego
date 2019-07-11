app.service('ItemCatService', function($http) {
	this.findAll = function() {
		return $http.get(base + '/ItemCat/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post(base + '/ItemCat/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post(base + '/ItemCat/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get(base + '/ItemCat/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get(base + '/ItemCat/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.findByParentId = function(parentId) {
		return $http.get(base + '/ItemCat/findByParentId.do?parentId=' + parentId, { withCredentials: true });
	}

});