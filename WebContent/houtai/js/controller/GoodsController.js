app.controller('GoodsController', function($scope, $controller, $location, GoodsService, UploadService, ItemCatService, TypeTemplateService, SpecificationService, BrandService) {
	$controller("BaseController", { $scope: $scope });
	$scope.entity = { goodsDesc: { itemImages: [], specificationItems: [] } }; //页面实体结构
	$scope.status = ['未审核', '申请审核中', '审核通过', '审核未通过', '关闭']; //商品状态
	$scope.itemCatList = []; //商品分类列表
	$scope.BrandList = []; //品牌列表
	$scope.TypeList = []; //模板列表

	//加载商品分类列表
	$scope.findItemCatList = function() {
		ItemCatService.findAll().success(
			function(res) {
				$scope.forward_login_seller(res);
				for(var i = 0; i < res.length; i++) {
					$scope.itemCatList[res[i].id] = res[i].name;
				}
			}
		);
	}
	//加载品牌列表
	$scope.findBrandList = function() {
		BrandService.findAll().success(
			function(res) {
				$scope.forward_login_seller(res);
				for(var i = 0; i < res.length; i++) {
					$scope.BrandList[res[i].id] = res[i].name;
				}
			}
		);
	}
	//加载模板列表
	$scope.findTypeList = function() {
		TypeTemplateService.findAll().success(
			function(res) {
				$scope.forward_login_seller(res);
				for(var i = 0; i < res.length; i++) {
					$scope.TypeList[res[i].id] = res[i].name;
				}
			}
		);
	}

	//查询实体 
	$scope.findAll = function() {
		GoodsService.findAll().success(function(res) {
			$scope.forward_login_seller(res);
			$scope.list = res
		});
	}
	//查询实体 
	$scope.findOne = function() {
		var id = $location.search()['id']; //获取参数值
		if(id == null) {
			return;
		}
		GoodsService.findOne(id).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.entity = res;
				//富文本编辑器内容
				editor.html($scope.entity.goodsDesc.introduction);
				//图片列表
				$scope.entity.goodsDesc.itemImages = JSON.parse($scope.entity.goodsDesc.itemImages);
				//扩展属性
				$scope.entity.goodsDesc.customAttributeItems = JSON.parse($scope.entity.goodsDesc.customAttributeItems);
				//规格				
				$scope.entity.goodsDesc.specificationItems = JSON.parse($scope.entity.goodsDesc.specificationItems);
				//SKU列表规格列转换				
				for(var i = 0; i < $scope.entity.itemList.length; i++) {
					$scope.entity.itemList[i].spec = JSON.parse($scope.entity.itemList[i].spec);
				}
			}
		);
	}

	//获取实体属性
	$scope.findOneByID = function(id) {
		GoodsService.findOne(id).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.details = res;
				$scope.details.goodsDesc.customAttributeItems = JSON.parse($scope.details.goodsDesc.customAttributeItems); //扩展属性
				$scope.details.goodsDesc.itemImages = JSON.parse($scope.details.goodsDesc.itemImages); //图片列表
				$scope.details.goodsDesc.specificationItems = JSON.parse($scope.details.goodsDesc.specificationItems); //规格信息
			}
		);
	}

	//根据规格名称和选项名称返回是否被勾选
	$scope.checkAttributeValue = function(specName, optionName) {
		var items = $scope.entity.goodsDesc.specificationItems;
		var object = $scope.searchObjectByKey(items, 'attributeName', specName);
		if(object == null) {
			return false;
		} else {
			if(object.attributeValue.indexOf(optionName) >= 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		GoodsService.delete($scope.selectIds).success(
			function(res) {
				$scope.forward_login_seller(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
				}
			}
		);
	}

	//增加和修改
	$scope.save = function() {
		$scope.entity.goodsDesc.introduction = editor.html(); //取得富文本编辑器的值
		var methodName = 'add'; //方法名称
		if($scope.entity.goods.id != null) { //如果有ID
			methodName = 'update'; //则执行修改方法 
		}

		GoodsService.SaveAndUpdate(methodName, $scope.entity).success(
			function(res) {
				$scope.forward_login_seller(res);
				if(res.success) {
					alert('保存成功');
					$scope.entity = {};
					editor.html(''); //清空富文本编辑器
					window.location.href = 'goods.html';
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
		GoodsService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}

	/**
	 * 上传图片
	 */
	$scope.uploadFile = function() {
		UploadService.uploadFile().success(function(res) {
			$scope.forward_login_seller(res);
			if(res.success) { //如果上传成功，取出url
				$scope.image_entity.url = res.message; //设置文件地址
			} else {
				alert(res.message);
			}
		}).error(function() {
			alert("上传发生错误");
		});
	};

	//添加图片列表
	$scope.add_image_entity = function() {
		$scope.entity.goodsDesc.itemImages.push($scope.image_entity);
	}

	//列表中移除图片
	$scope.remove_image_entity = function(index) {
		$scope.entity.goodsDesc.itemImages.splice(index, 1);
	}

	//读取一级分类
	$scope.selectItemCat1List = function() {
		ItemCatService.findByParentId(0).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.itemCat1List = res;
			}
		);
	}

	//读取二级分类
	$scope.$watch('entity.goods.category1Id', function(newValue, oldValue) {
		//根据选择的值，查询二级分类
		ItemCatService.findByParentId(newValue).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.itemCat2List = res;
				if($location.search()['id'] == null)
					$scope.itemCat3List = [];
			}
		);
	});

	//读取三级分类
	$scope.$watch('entity.goods.category2Id', function(newValue, oldValue) {
		//根据选择的值，查询二级分类
		ItemCatService.findByParentId(newValue).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.itemCat3List = res;
			}
		);
	});

	//三级分类选择后  读取模板
	$scope.$watch('entity.goods.category3Id', function(newValue, oldValue) {
		ItemCatService.findOne(newValue).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.entity.goods.typeTemplateId = res.typeId; //更新模板ID  
				TypeTemplateService.findOne(res.typeId).success(function(res) {
					$scope.forward_login_seller(res);
					$scope.typeName = res.name;
				});
			}
		);
	});

	//模板选择后  更新品牌列表
	$scope.$watch('entity.goods.typeTemplateId', function(newValue, oldValue) {
		if($location.search()['id'] == null) {
			$scope.entity.itemList = [];
			$scope.entity.goodsDesc.specificationItems = [];
		}
		TypeTemplateService.findOne(newValue).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.typeTemplate = res; //获取类型模板
				$scope.typeTemplate.brandIds = JSON.parse($scope.typeTemplate.brandIds); //品牌列表
				if($location.search()['id'] == null)
					$scope.entity.goodsDesc.customAttributeItems = JSON.parse($scope.typeTemplate.customAttributeItems); //扩展属性
			}
		);
		//查询规格列表
		TypeTemplateService.findSpecList(newValue).success(
			function(res) {
				$scope.forward_login_seller(res);
				$scope.specList = res;
			}
		);
	});

	//更新规格选项
	$scope.updateSpecAttribute = function($event, name, value) {
		var object = $scope.searchObjectByKey($scope.entity.goodsDesc.specificationItems, 'attributeName', name);
		if(object != null) {
			if($event.target.checked) {
				object.attributeValue.push(value);
			} else {
				//取消勾选 移除选项
				object.attributeValue.splice(object.attributeValue.indexOf(value), 1);
				//如果选项都取消了，将此条记录移除
				if(object.attributeValue.length == 0) {
					$scope.entity.goodsDesc.specificationItems.splice($scope.entity.goodsDesc.specificationItems.indexOf(object), 1);
				}
			}
		} else {
			$scope.entity.goodsDesc.specificationItems.push({ "attributeName": name, "attributeValue": [value] });
		}
	}

	//创建SKU列表
	$scope.createItemList = function() {
		$scope.entity.itemList = [{ spec: {}, price: 0, num: 100, status: '0', isDefault: '0' }];
		var items = $scope.entity.goodsDesc.specificationItems;
		for(var i = 0; i < items.length; i++) {
			$scope.entity.itemList = addColumn($scope.entity.itemList, items[i].attributeName, items[i].attributeValue);
		}
	}
	//添加列值 
	addColumn = function(list, columnName, conlumnValues) {
		var newList = []; //新的集合
		for(var i = 0; i < list.length; i++) {
			var oldRow = list[i];
			for(var j = 0; j < conlumnValues.length; j++) {
				newRow = JSON.parse(JSON.stringify(oldRow)); //深度克隆
				newRow.spec[columnName] = conlumnValues[j];
				newList.push(newRow);
			}
		}
		return newList;
	}

	//批量修改状态
	$scope.updateStatus = function(status) {
		GoodsService.updateStatus($scope.selectIds, status).success(
			function(res) {
				$scope.forward_login_seller(res);
				if(res.success) {
					$scope.selectIds = [];
					$scope.reloadList(); //刷新列表
				} else {
					alert("操作失败")
				}
			}
		);

	}

	//修改单一状态
	$scope.updateStatusOne = function(id, status) {
		GoodsService.updateStatus(id, status).success(
			function(res) {
				$scope.forward_login_seller(res);
				if(res.success) {
					$scope.reloadList(); //刷新列表
				} else {
					alert("操作失败")
				}
			}
		);
	}

	//修改上下架状态
	$scope.isMarketable = function(id, status) {
		GoodsService.isMarketable(id, status).success(
			function(res) {
				$scope.forward_login_seller(res);
				if(res.success) {
					$scope.reloadList(); //刷新列表
				} else {
					alert("操作失败")
				}
			}
		);
	}
});