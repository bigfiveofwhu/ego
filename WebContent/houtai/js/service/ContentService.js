app.service('ContentService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9101" + '/Content/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9101" + '/Content/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post("http://127.0.0.1:9101" + '/Content/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9101" + '/Content/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9101" + '/Content/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.findByCategoryId=function(categoryId){
		return $http.get("http://127.0.0.1:9103"+"/Content/findByCategoryId.do?categoryId="+categoryId);
	}	
	this.findByParentId = function(parentId) {
		return $http.get("http://127.0.0.1:9103" + '/ItemCat/findByParentId.do?parentId=' + parentId, { withCredentials: true });
	}

});