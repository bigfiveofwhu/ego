app.controller('ItemCatController', function($scope, $controller, ItemCatService, TypeTemplateService) {
	$controller("BaseController", { $scope: $scope });
	var typeList_value = [];
	$scope.typeList = { data: [] }

	//查询模板类型
	$scope.findTypeList = function() {
		TypeTemplateService.findAll().success(function(res) {
			$scope.forward_login(res);
			var temp = res.map(function(val, index) {
				var value = { 'id': val.id, 'text': val.name }
				typeList_value.push(value);
			});
			$scope.typeList = { data: typeList_value }
		});
	}

	//查询实体 
	$scope.findAll = function() {
		ItemCatService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}
	$scope.findOne = function(id) {
		ItemCatService.findOne(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res
			TypeTemplateService.findOne(res.typeId).success(
				function(res) {
					var value = { 'id': res.id, 'text': res.name }
					$scope.entity.typeId = value
				}
			);
		});
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		ItemCatService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					$scope.selectIds = [];
					window.location.reload();
				}
			}
		);
	}

	//增加和修改
	$scope.save = function() {
		var methodName = 'add'; //方法名称
		if($scope.entity.id != null) { //如果有ID
			methodName = 'update'; //则执行修改方法 
		} else {
			$scope.entity.parentId = $scope.parentId;
		}
		$scope.entity.typeId = $scope.entity.typeId.id
		ItemCatService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login(res);
				if(res.success) {
					//重新查询 
					$scope.findByParentId($scope.parentId); //重新加载
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
		ItemCatService.findByParentId(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}
	//获取分类信息
	$scope.findByParentId = function(parentId) {
		$scope.parentId = parentId;
		ItemCatService.findByParentId(parentId).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res;
				res.map(function(val, index) {
					TypeTemplateService.findOne(val.typeId).success(
						function(res) {
							$scope.list[index].typeId = res.name
						}
					);
				});
			}
		);
	}

	$scope.grade = 1;
	$scope.parentId = 0; //上级ID

	//设置级别
	$scope.setGrade = function(value) {
		$scope.grade = value;
	}

	//读取类别
	$scope.selectList = function(p_entity) {
		if($scope.grade == 1) {
			$scope.entity_1 = null;
			$scope.entity_2 = null;
		}
		if($scope.grade == 2) {
			$scope.entity_1 = p_entity;
			$scope.entity_2 = null;
		}
		if($scope.grade == 3) {
			$scope.entity_2 = p_entity;
		}
		$scope.findByParentId(p_entity.id)
	}

});