app.controller('SpecificationController', function($scope, $controller, SpecificationService) {
	$controller("BaseController", { $scope: $scope });
	//查询实体 
	$scope.findAll = function() {
		SpecificationService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}

	$scope.findOne = function(id) {
		SpecificationService.findOne(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res
		});
	}
	//增加和修改
	$scope.save = function() {
		var methodName;
		if($scope.entity.specification.id != null) { //如果有ID
			methodName = "update"; //修改  
		} else {
			methodName = "add"; //增加 
		}
		SpecificationService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.reloadList(); //重新加载
				} else {
					alert(res.message);
				}
			}
		);
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		SpecificationService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
				}
			}
		);
	}
	//查询+ 分页
	$scope.search = function() {
		page = $scope.paginationConf.currentPage;
		row = $scope.paginationConf.itemsPerPage
		SpecificationService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}

	//新增选项行
	$scope.addTableRow = function() {
		$scope.entity.specificationOptionList.push({});
	}

	//删除选项行
	$scope.deleTableRow = function(index) {
		$scope.entity.specificationOptionList.splice(index, 1);
	}

});