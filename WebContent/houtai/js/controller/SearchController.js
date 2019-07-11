app.controller('SearchController', function($scope, $controller, $location, SearchService) {
	//加载搜索参数
	$scope.loadkeywords = function() {
		$scope.searchMap.keywords = $location.search()['keywords'];
		if($scope.searchMap.keywords == 'undefined' || typeof($scope.searchMap.keywords) == 'undefined') {
			$scope.searchMap.keywords = ''
			return;
		}
		$scope.search();

		//
	}

	//搜索
	$scope.search = function() {
		$scope.searchMap.pageNo = parseInt($scope.searchMap.pageNo);
		if($scope.searchMap.keywords == '') {
			alert("请输入搜索字段")
			return
		}
		SearchService.search($scope.searchMap).success(
			function(response) {
				$scope.resultMap = response; //搜索返回的结果
				bindPageLabel();
			}
		);
	}

	$scope.searchMap = { 'keywords': '', 'category': '', 'brand': '', 'spec': {}, 'price': '', 'pageNo': 1, 'pageSize': 10, 'sort': '', 'sortFieid': '' }; //搜索对象
	//添加搜索项
	$scope.addSearchItem = function(key, value) {
		if(key == 'category' || key == 'brand' || key == 'price') { //如果点击的是分类或者是品牌
			$scope.searchMap[key] = value;
		} else {
			$scope.searchMap.spec[key] = value;
		}
		$scope.search(); //执行搜索 
	}

	//移除复合搜索条件
	$scope.removeSearchItem = function(key) {
		if(key == "category" || key == "brand" || key == 'price') { //如果是分类或品牌
			$scope.searchMap[key] = "";
		} else { //否则是规格
			delete $scope.searchMap.spec[key]; //移除此属性
		}
		$scope.search(); //执行搜索 
	}

	//页码更改
	bindPageLabel = function() {
		$scope.pageLabel = [];
		var maxPageNo = $scope.resultMap.totalPages; //总页数
		var firstPage = 1;
		var lastPage = maxPageNo;
		$scope.firstDot = true;
		$scope.lastDot = true;
		if(maxPageNo > 5) {
			if($scope.searchMap.pageNo <= 3) {
				lastPage = 5;
				$scope.firstDot = false;
			} else if($scope.searchMap.pageNo >= maxPageNo - 2) {
				firstPage = maxPageNo - 4;
				$scope.lastDot = false;
			} else {
				firstPage = $scope.searchMap.pageNo - 2;
				lastPage = $scope.searchMap.pageNo + 2
			}
		} else {
			$scope.firstDot = false;
			$scope.lastDot = false;
		}

		for(var i = firstPage; i <= lastPage; i++) {
			$scope.pageLabel.push(i);
		}
	}
	//根据页码查询
	$scope.quertByPage = function(pageNo) {
		if(pageNo < 1 || pageNo > $scope.resultMap.totalPages) {
			return
		}
		$scope.searchMap.pageNo = pageNo;
		$scope.search();
	}

	//上一页的按钮是否有效
	$scope.isTopPage = function() {
		if($scope.searchMap.pageNo == 1) {
			return true;
		}
		return false;
	}
	//下一页的按钮是否有效
	$scope.isEndPage = function() {
		if($scope.searchMap.pageNo == $scope.resultMap.totalPages) {
			return true;
		}
		return false;
	}

	//排序规则
	$scope.sortSearch = function(sortFieid, sort) {
		$scope.searchMap.sortFieid = sortFieid;
		$scope.searchMap.sort = sort;
		$scope.search();
	}

	//判断关键字是否为品牌
	$scope.keywordsIsBrand = function() {
		for(var i = 0; i < $scope.resultMap.brandList.length; i++) {
			if($scope.searchMap.keywords.indexOf($scope.resultMap.brandList[i].text) >= 0) { //如果包含
				return true;
			}
		}
		return false;
	}

});