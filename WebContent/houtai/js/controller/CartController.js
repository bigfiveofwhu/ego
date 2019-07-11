//购物车控制层 
app.controller('CartController', function($scope, $controller, CartService, AddressService) {
	$controller("BaseController", { $scope: $scope });
	//查询购物车列表
	$scope.findCartList = function() {
		CartService.findCartList().success(
			function(response) {
				$scope.cartList = response;
				$scope.totalValue = CartService.sum($scope.cartList); //求合计数
			}
		);
	}

	//添加商品到购物车
	$scope.addGoodsToCartList = function(itemId, num) {
		CartService.addGoodsToCartList(itemId, num).success(
			function(response) {
				if(response.success) {
					$scope.findCartList(); //刷新列表
				} else {
					alert(response.message); //弹出错误提示
				}
			}
		);
	}

	//获取地址列表
	$scope.findAddressList = function() {
		CartService.findAddressList().success(
			function(response) {
				$scope.forward_login(response);
				$scope.addressList = response;
				//设置默认地址
				for(var i = 0; i < $scope.addressList.length; i++) {
					if($scope.addressList[i].isDefault == '1') {
						$scope.address = $scope.addressList[i];
						break;
					}
				}
			}
		);
	}

	//选择地址
	$scope.selectAddress = function(address) {
		$scope.address = address;
	}

	//判断是否是当前选中的地址
	$scope.isSelectedAddress = function(address) {
		if(address == $scope.address) {
			return true;
		} else {
			return false;
		}
	}

	$scope.order = { paymentType: '1' };

	//选择支付方式
	$scope.selectPayType = function(type) {
		$scope.order.paymentType = type;
	}

	//保存订单
	$scope.submitOrder = function() {
		$scope.order.receiverAreaName = $scope.address.address; //地址
		$scope.order.receiverMobile = $scope.address.mobile; //手机
		$scope.order.receiver = $scope.address.contact; //联系人
		CartService.submitOrder($scope.order).success(
			function(response) {
				$scope.forward_login(response);
				if(response.success) {
					//页面跳转
					if($scope.order.paymentType == '1') { //如果是微信支付，跳转到支付页面
						location.href="pay.html#?type="+$scope.order.paymentType;
					} else { //如果货到付款，跳转到提示页面
						location.href = "paysuccess.html";
					}
				} else {
					alert(response.message); //也可以跳转到提示页面				
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

});