app.service('ItemPageService', function($http) {
	this.getById = function(id) {
		return $http.get("http://127.0.0.1:9105" + '/ItemPage/getById.do?goodsId=' + id, { withCredentials: true });
	}
});