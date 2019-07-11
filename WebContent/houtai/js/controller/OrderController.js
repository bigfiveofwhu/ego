app.controller('OrderController', function($scope, $controller, $location, OrderService) {
	$controller("BaseController", { $scope: $scope });
	$scope.payType = [ '','微信支付', '货到付款'];
	$scope.loadOrderId = function() {
		$scope.id = $location.search()['id'];
		$scope.findByOrderId($scope.id)
	}

	//查询实体 
	$scope.findAll = function() {
		OrderService.findAll().success(function(res) {
			$scope.forward_login(res);
			$scope.list = res
		});
	}
	$scope.findOne = function(id) {
		OrderService.findOne(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res
		});
	}

	$scope.findByOrderId = function(id) {
		OrderService.findByOrderId(id).success(function(res) {
			$scope.forward_login(res);
			$scope.entity = res

		});
	}
	
	$scope.UpdateOrderStatus = function(id,status) {
		OrderService.UpdateOrderStatus(id,status).success(function(res) {
			$scope.forward_login(res);
			if(res.success) {
				$scope.selectstatus($scope.status);
			}else{
				alert(res.message)
			}
		});
	}

	//批量删除
	$scope.delete = function() {
		//获取选中的复选框			
		OrderService.delete($scope.selectIds).success(
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
		OrderService.SaveAndUpdate(methodName, $scope.entity).success(
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
		OrderService.search(page, row, $scope.search_domain).success(
			function(res) {
				$scope.forward_login(res);
				$scope.list = res.rows;
				$scope.paginationConf.totalItems = res.total;
			}
		);
	}
	$scope.findByUserName = function(status) {
		OrderService.findByUserName(status).success(function(res) {
			$scope.forward_login(res);
			totalFee(res)
			$scope.list = res
		});
	}

	$scope.findBySellerId = function(status) {
		OrderService.findByUserName(status).success(function(res) {
			$scope.forward_login(res);
			totalFee(res)
			$scope.list = res
		});
	}


	function totalFee(res) {
		var totalFee = 0;
		for(var i = 0; i < res.length; i++) {
			for(var j = 0; j < res[i].orderItemlist.length; j++) {
				var t = res[i].orderItemlist[j].totalFee;
				totalFee = totalFee + t;
			}
			res[i].totalFee = totalFee;
			totalFee = 0;
		}
	}

	//当前选中的状态
	$scope.selectstatus = function(status) {
		$scope.status = status;
		$scope.findByUserName(status)
	}


	//判断是否是当前选中的状态
	$scope.isSelectedstatus = function(status) {
		if(status == $scope.status) {
			return true;
		} else {
			return false;
		}
	}

	//判断是否大于订单状态
	$scope.isGtStatus = function(s1, s2) {
		if(s2 >= s1) {
			return true;
		} else {
			return false;
		}
	}
	
	//付款跳转
	$scope.pay=function(type){
		console.log(type)
		OrderService.createNative('http://127.0.0.1:8020/Shopping/html/webfront/paysuccess.html',type).success(
			function(response){
				console.log(response)
				post('https://pay.mmbbo.cn/',response);
			}
		);		
	}
	
	function post(URL, PARAMS) { 
	      var temp = document.createElement("form"); 
	      temp.action = URL; 
	      temp.method = "post"; 
	      temp.style.display = "none"; 
	      for (var x in PARAMS) { 
	        var opt = document.createElement("textarea"); 
	        opt.name = x; 
	        opt.value = PARAMS[x]; // alert(opt.name) 
	        temp.appendChild(opt); 
	        } 
	      document.body.appendChild(temp); 
	      temp.submit(); 
	      return temp;
	  }
	
	
});