app.controller('SellerLoginController', function($scope, $controller, SellerService) {
	$controller("BaseController", { $scope: $scope });
	//登录
	$scope.login = function(entity) {
		if(typeof(entity) == 'undefined' || $scope.entity.sellerId == null || $scope.entity.password == null) {
			alert("请填写全部字段");
			return
		}
		SellerService.login(entity).success(function(res) {
			if(res.code == 200) {
				location.href = 'admin/index.html'
			} else {
				alert(res.message);
				location.reload()
			}
		});
	}

	//注销
	$scope.exit = function() {
		var sellerId = $scope.getCookie("seller");
		var name = $scope.getCookie("seller_name");
		SellerService.exit(sellerId, name).success(function(res) {
			location.href = '../shoplogin.html'
		});
	}
	//改密
	$scope.changepasswd = function() {
		if(typeof($scope.pojo) == 'undefined' || $scope.pojo.oldPassword == null || $scope.pojo.newPassword == null || $scope.newPassword == null) {
			alert("请填写全部字段");
			return
		}
		if($scope.pojo.newPassword != $scope.newPassword) {
			alert("两次输入的密码不一致!");
			return;
		}
		$scope.pojo.name = $scope.getCookie('seller');
		SellerService.changepasswd($scope.pojo).success(function(res) {
			$scope.forward_login_seller(res)
			alert(res.message);
			$scope.pojo = {}
		});
	}
});