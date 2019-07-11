app.service('AdminUserService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9101" + '/AdminUser/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9101" + '/AdminUser/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity) {
		return $http.post("http://127.0.0.1:9101" + '/AdminUser/' + methodName + '.do', entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9101" + '/AdminUser/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9101" + '/AdminUser/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.login = function(entity) {
		return $http.post("http://127.0.0.1:9101" + '/AdminUser/login.do', entity, { withCredentials: true });
	}
	this.exit = function(name) {
		return $http.get("http://127.0.0.1:9101" + '/AdminUser/exit.do?name=' + name, { withCredentials: true });
	}
	this.changepasswd = function(entity) {
		return $http.post("http://127.0.0.1:9101" + '/AdminUser/changepasswd.do', entity, { withCredentials: true });
	}

});