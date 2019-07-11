app.service('UserService', function($http) {
	this.findAll = function() {
		return $http.get("http://127.0.0.1:9106" + '/User/findAll.do', { withCredentials: true });
	}
	this.search = function(page, row, entity) {
		return $http.post("http://127.0.0.1:9106" + '/User/search.do?page=' + page + '&rows=' + row, entity, { withCredentials: true });
	}
	this.SaveAndUpdate = function(methodName, entity,smscode) {
		return $http.post("http://127.0.0.1:9106" + '/User/' + methodName + '.do?smscode='+smscode, entity, { withCredentials: true });
	}
	this.findOne = function(id) {
		return $http.get("http://127.0.0.1:9106" + '/User/findOne.do?id=' + id, { withCredentials: true });
	}
	this.delete = function(ids) {
		return $http.get("http://127.0.0.1:9106" + '/User/delete.do?ids=' + ids, { withCredentials: true });
	}
	this.sendCode=function(phone){
		return $http.get("http://127.0.0.1:9106"+"/User/sendCode.do?phone="+phone,{ withCredentials: true });
	}
	this.login = function(entity) {
		return $http.post("http://127.0.0.1:9106" + '/User/login.do', entity, { withCredentials: true });
	}
	this.exit = function(username) {
		return $http.get("http://127.0.0.1:9106" + '/User/exit.do?username=' + username , { withCredentials: true });
	}

});