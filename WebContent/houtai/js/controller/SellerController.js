app.controller('SellerController', function($scope, $controller, SellerService) {
	$controller("BaseController", { $scope: $scope });
	$scope.status = ['未审核', '审核通过', '审核未通过', '关闭']; //商品状态
	//查询实体 
	$scope.findAll = function() {
		SellerService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}

	$scope.findOne = function(id) {
		SellerService.findOne(id).success(function(res) {
			$scope.forward_login_seller(res);
			$scope.entity = res
		});
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		SellerService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
				}
			}
		);
	}

	//增加
	$scope.save = function() {
		var methodName = 'add'; //方法名称
		SellerService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				if(res.success) {
					alert("注册成功");
					location.href = 'shoplogin.html'
				} else {
					alert("登陆名已存在");
				}
			}
		);
	}
	//修改
	$scope.update = function() {
		console.log("Ss")
		$scope.entity.sellerId = $scope.getCookie('seller')
		var methodName = 'update'; //方法名称
		SellerService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login_seller(res);
				alert(res.message);
			}
		);
	}

	//查询+ 分页
	$scope.search = function() {
		page = $scope.paginationConf.currentPage;
		row = $scope.paginationConf.itemsPerPage
		SellerService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}

	//状态更改
	$scope.updateStatus = function(sellerId, status) {
		SellerService.updateStatus(sellerId, status).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.reloadList();
				} else {
					alert("修改失败")
				}
			}
		);
	}
});