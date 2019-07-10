app.service('TypeTemplateService', function($http) {
	this.findAll = function() {
		return $http.get(base + '/TypeTemplate/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post(base + '/TypeTemplate/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post(base + '/TypeTemplate/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get(base + '/TypeTemplate/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get(base + '/TypeTemplate/delete.do?ids=' + ids, { withCredentials: true });
	}
	//查询规格列表
	this.findSpecList = function(id) {
		return $http.get(base + '/TypeTemplate/findSpecList.do?id=' + id, { withCredentials: true });
	}

});