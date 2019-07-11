app.controller('ItemPageController', function($scope, $controller, $location, $http, ItemPageService) {
	$controller("BaseController", { $scope: $scope });
	var skuList = [];
	//加载搜索参数
	$scope.loadkeywords = function() {
		var id = $location.search()['id']; //获取参数值
		if(id == null) {
			return;
		}
		$scope.getById(id);
	}
	//加载默认SKU
	$scope.loadSku = function() {
		$scope.sku = skuList[0];
		$scope.specificationItems = JSON.parse($scope.sku.spec);
	}

	//获取实体
	$scope.getById = function(id) {
		ItemPageService.getById(id).success(function(res) {
			$scope.resMap = res
			//图片列表
			$scope.resMap.goodsDesc.itemImages = JSON.parse($scope.resMap.goodsDesc.itemImages);
			//扩展属性
			$scope.resMap.goodsDesc.customAttributeItems = JSON.parse($scope.resMap.goodsDesc.customAttributeItems);
			//规格				
			$scope.resMap.goodsDesc.specificationItems = JSON.parse($scope.resMap.goodsDesc.specificationItems);
			//SKU
			for(var i = 0; i < $scope.resMap.itemList.length; i++) {
				var sku = { "id": "", "title": "", "price": "", "spec": "", "num": "" };
				sku.id = $scope.resMap.itemList[i].id;
				sku.title = $scope.resMap.itemList[i].title;
				sku.price = $scope.resMap.itemList[i].price;
				sku.spec = $scope.resMap.itemList[i].spec;
				sku.num = $scope.resMap.itemList[i].num;
				skuList[i] = sku;
			}
			$scope.loadSku()
		});
	}

	//数量操作
	$scope.addNum = function(x) {
		$scope.num = $scope.num + x;
		if($scope.num < 1) {
			$scope.num = 1;
		}
	}

	$scope.specificationItems = {}; //记录用户选择的规格
	//用户选择规格
	$scope.selectSpecification = function(name, value) {
		$scope.specificationItems[name] = value;
		searchSku(); //读取sku
	}
	//判断某规格选项是否被用户选中
	$scope.isSelected = function(name, value) {
		if($scope.specificationItems[name] == value) {
			return true;
		} else {
			return false;
		}
	}

	//匹配两个对象
	matchObject = function(map1, map2) {
		for(var k in map1) {
			if(map1[k] != map2[k]) {
				return false;
			}
		}
		for(var k in map2) {
			if(map2[k] != map1[k]) {
				return false;
			}
		}
		return true;
	}

	//查询SKU
	searchSku = function() {
		for(var i = 0; i < skuList.length; i++) {
			if(matchObject(JSON.parse(skuList[i].spec), $scope.specificationItems)) {
				$scope.sku = skuList[i];
				return;
			}
		}
		$scope.sku = { id: 0, title: '', price: 0 }; //如果没有匹配的		
	}

	//添加商品到购物车
	$scope.addToCart = function() {
		$http.get('http://127.0.0.1:9107/Cart/addGoodsToCartList.do?itemId=' + $scope.sku.id + '&num=' + $scope.num, { withCredentials: true }).success(
			function(response) {
				if(response.success) {
					alert("已添加至购物车");
					//location.href='cart.html';//跳转到购物车页面
				} else {
					alert(response.message);
				}
			}
		);
	}

});