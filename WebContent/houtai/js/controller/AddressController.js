app.controller('AddressController', function($scope, $controller, AddressService) {
	$controller("BaseController", { $scope: $scope });
	//查询实体 
	$scope.findAll = function() {
		AddressService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}
	$scope.findAddressList = function() {
		AddressService.findAddressList().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}
	$scope.findOne = function(id) {
		AddressService.findOne(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res
		});
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		AddressService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
				}
			}
		);
	}

	$scope.dele = function(id) {
		//获取选中的复选框
		$scope.selectIds = [id];
		AddressService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.findAddressList(); //刷新列表
				}
			}
		);
	}

	//增加和修改
	$scope.save = function() {
		var methodName = 'add'; //方法名称
		if($scope.entity.id != null) { //如果有ID
			methodName = 'update'; //则执行修改方法 
		}
		$scope.entity.userId = $scope.getCookie('user');
		AddressService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					//重新查询 
					$scope.findAddressList(); //重新加载
				} else {
					alert(res.message);
				}
			}
		);
	}
	//查询+ 分页
	$scope.search = function() {
		page = $scope.paginationConf.currentPage;
		row = $scope.paginationConf.itemsPerPage
		AddressService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}

	//查询+ 分页
	$scope.setteingDefault = function(id) {
		AddressService.setteingDefault(id).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					//重新查询 
					$scope.findAddressList(); //重新加载
				} else {
					alert(res.message);
				}
			}
		);
	}

	$scope.provincesList = []; //省份列表
	$scope.citieslist = []; //城市列表
	$scope.areasList = []; //县区列表

	//读取一级分类
	$scope.findByProvinces = function() {
		AddressService.findByProvinces().success(
			function(res) {
				$scope.forward_login(res);
				$scope.itemCat1List = res;
				for(var i = 0; i < res.length; i++) {
					$scope.provincesList[res[i].provinceid] = res[i].province;
				}
			}
		);
	}
	//城市列表
	$scope.findByCities = function() {
		AddressService.findByCities().success(
			function(res) {
				$scope.forward_login(res);
				for(var i = 0; i < res.length; i++) {
					$scope.citieslist[res[i].cityid] = res[i].city;
				}
			}
		);
	}
	//县区列表
	$scope.findByAreas = function() {
		AddressService.findByAreas().success(
			function(res) {
				$scope.forward_login(res);
				for(var i = 0; i < res.length; i++) {
					$scope.areasList[res[i].areaid] = res[i].area;
				}
			}
		);
	}

	//读取二级分类
	$scope.$watch('entity.provinceId', function(newValue, oldValue) {
		//根据选择的值，查询二级分类
		AddressService.findByCityId(newValue).success(
			function(res) {
				$scope.forward_login(res);
				$scope.itemCat2List = res;
				$scope.itemCat3List = [];
			}
		);
	});

	//读取三级分类
	$scope.$watch('entity.cityId', function(newValue, oldValue) {
		//根据选择的值，查询二级分类
		AddressService.findByAreasId(newValue).success(
			function(res) {
				$scope.forward_login(res);
				$scope.itemCat3List = res;
			}
		);
	});

});