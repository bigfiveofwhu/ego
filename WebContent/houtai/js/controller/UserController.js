app.controller('UserController', function($scope, $controller,$interval,$timeout, UserService) {
	$controller("BaseController", { $scope: $scope });
	$scope.show=false
	//增加和修改
	$scope.add = function() {
		var methodName = 'add'; //方法名称
		if($scope.entity.password != $scope.password) {
			alert("两次输入的密码不一致，请重新输入");
			return;
		}
		if($scope.entity.phone == null) {
			alert("请输入手机号！");
			return;
		}
		UserService.SaveAndUpdate(methodName, $scope.entity, $scope.smscode).success(
			function(res) {
				if(res.success) {
					alert("注册成功")
					window.location.href = "login.html"
				} else {
					alert(res.message);
				}
			}
		);
	}
	
	 $scope.timer = false;
	 $scope.timeout = 60000;
	 $scope.timerCount = $scope.timeout / 1000;
	 $scope.text = "获取验证码";

	//发送验证码
	$scope.sendCode = function() {
		if(typeof($scope.entity) =='undefined'|| ($scope.entity.phone)=='undefined'||$scope.entity.phone == null) {
			alert("请输入正确的手机号！");
			return;
		}
		console.log("发送验证码")
		UserService.sendCode($scope.entity.phone).success(
			function(response) {
				if(response.success) {
					$scope.showTimer = true;
				    $scope.timer = true;
				    $scope.text = "秒后重新获取";
				    var counter = $interval(function(){
				    	$scope.timerCount = $scope.timerCount - 1;
				    }, 1000);
				    $timeout(function(){
					    $scope.text = "获取验证码";
					    $scope.timer = false;
					    $interval.cancel(counter);
					    $scope.showTimer = false;
					    $scope.timerCount = $scope.timeout / 1000;
				    }, $scope.timeout);
				} else {
					alert(response.message);
				}	
			}
		);
	}

	//登录
	$scope.login = function() {
		console.log($scope.entity)
		UserService.login($scope.entity).success(function(res) {
			if(res.code == 200) {
				location.href = 'home-index.html'
			} else {
				alert(res.message);
				location.reload()
			}
		});
	}

	//注销
	$scope.exit = function() {
		var user = $scope.getCookie("user");
		UserService.exit(user).success(function(res) {
			location.href = 'login.html'
		});
	}

});