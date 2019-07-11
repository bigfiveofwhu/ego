app.controller('BaseController', function($scope) {
	$scope.selectIds = []; //选中的ID集合 
	$scope.search_domain = {} //搜索域
	//刷新界面
	$scope.reloadList = function() {
		$scope.search($scope.paginationConf.currentPage, $scope.paginationConf.itemsPerPage);
	}

	//分页控件配置 
	$scope.paginationConf = {
		currentPage: 1,
		totalItems: 10,
		itemsPerPage: 10,
		perPageOptions: [10, 20, 30, 40, 50],
		onChange: function() {
			$scope.reloadList(); //重新加载
		}
	};
	//更新复选框
	$scope.updateSelection = function($event, id) {
		if($event.target.checked) { //如果是被选中,则增加到数组
			$scope.selectIds.push(id);
		} else {
			var idx = $scope.selectIds.indexOf(id);
			$scope.selectIds.splice(idx, 1); //删除 
		}
		console.log($scope.selectIds)
	};

	//json转字符
	$scope.jsonToString = function(jsonString, key) {
		var json = JSON.parse(jsonString);
		var value = "";
		for(var i = 0; i < json.length; i++) {
			if(i > 0)
				value += ","
			value += json[i][key];
		}
		return value;
	}
	//获取cookie值
	$scope.getCookie = function(key) {
		$scope.loginName = ''
		var cookieArr = document.cookie.split('; ');
		for(var i = 0; i < cookieArr.length; i++) {
			var arr = cookieArr[i].split('=');
			if(arr[0] === key) {
				$scope.loginName = decodeURI(arr[1]);
				break;
			}
		}
		return $scope.loginName;
	}
	//跳转到运营商登陆界面
	$scope.forward_login = function(res) {
		if(res.code == 102) {
			location.href = 'login.html'
		}
	}

	//跳转到商家登陆界面
	$scope.forward_login_seller = function(res) {

		if(base == 'http://127.0.0.1:9101') {
			$scope.forward_login(res)
			return
		}
		if(res.code == 102) {
			location.href = '../shoplogin.html'
		}
	}

	//从集合中按照key查询对象
	$scope.searchObjectByKey = function(list, key, keyValue) {
		for(var i = 0; i < list.length; i++) {
			if(list[i][key] == keyValue) {
				return list[i];
			}
		}
		return null;
	}
	
	

});