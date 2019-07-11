app.controller('AdminUserController', function($scope, $controller, AdminUserService) {
	$controller("BaseController", { $scope: $scope });
	//登录
	$scope.login = function(entity) {
		if(typeof(entity)=='undefined'||$scope.entity.username==null||$scope.entity.password==null  ){
			alert("请填写全部字段");
			return 
		}	
		AdminUserService.login(entity).success(function(res) {
			if(res.code == 200) {
				location.href = 'index.html'
			} else {
				alert(res.message);
				location.reload()
			}
		});
	}
	//注销
	$scope.exit = function() {
		var name = $scope.getCookie("admin");
		AdminUserService.exit(name).success(function(res) {
			location.href = 'login.html'
		});
	}
	//改密
	$scope.changepasswd = function() {
		if(typeof($scope.pojo)=='undefined'||$scope.pojo.oldPassword==null||$scope.pojo.newPassword==null || $scope.newPassword==null){
			alert("请填写全部字段");
			return 
		}
		if($scope.pojo.newPassword != $scope.newPassword) {
			alert("两次输入的密码不一致!");
			return;
		}
		$scope.pojo.name = $scope.getCookie('admin');
		AdminUserService.changepasswd($scope.pojo).success(function(res) {
			$scope.forward_login(res)
			alert(res.message);
		});
	}
	

});