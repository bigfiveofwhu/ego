app.controller('TypeTemplateController', function($scope, $controller, TypeTemplateService, BrandService, SpecificationService) {
	$controller("BaseController", { $scope: $scope });
	var brandList_value = [];
	var specList_value = [];
	$scope.brandList = { data: [] }
	$scope.specList = { data: [] }

	$scope.findBrandList = function() {
		BrandService.findAll().success(function(res) {
			$scope.forward_login(res);
			var temp = res.map(function(val, index) {
				var value = { 'id': val.id, 'text': val.name }
				brandList_value.push(value);
			});
			$scope.brandList = { data: brandList_value }
		});
	}
	$scope.findspecList = function() {
		SpecificationService.findAll().success(function(res) {
			$scope.forward_login(res);
			var temp = res.map(function(val, index) {
				var value = { 'id': val.id, 'text': val.specName }
				specList_value.push(value);
			});
			$scope.specList = { data: specList_value }
		});
	}

	//查询实体 
	$scope.findAll = function() {
		TypeTemplateService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}

	$scope.findOne = function(id) {
		TypeTemplateService.findOne(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res
			$scope.entity.brandIds = JSON.parse(res.brandIds);
			$scope.entity.specIds = JSON.parse(res.specIds);
			$scope.entity.customAttributeItems = JSON.parse(res.customAttributeItems);
		});
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		TypeTemplateService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
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
		TypeTemplateService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					//重新查询 
					$scope.reloadList(); //重新加载
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
		TypeTemplateService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}

	$scope.addTableRow = function() {
		$scope.entity.customAttributeItems.push({});
	}
	$scope.deleTableRow = function(index) {
		$scope.entity.customAttributeItems.splice(index, 1);
	}

});