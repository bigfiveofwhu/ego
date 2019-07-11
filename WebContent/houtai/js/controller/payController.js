app.controller('payController' ,function($scope,$timeout ,$location,payService){	
	$scope.payType = [ '','微信支付','货到付款' ];
	
	$scope.getType=function(){
		return $location.search()['type'];
	}

	$scope.getorderid=function(){
		return $location.search()['orderid'];
	}
	
	function GetQueryString(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null){
		     return unescape(r[2]);
	     }
	     return null;
	}
	$scope.UpdatePayStatus=function(){
		var orderid=GetQueryString('orderid');
		if(typeof(orderid)=='undefined'){
			return
		}		
		payService.UpdatePayStatus(orderid).success(
			function(response){
				console.log(response)
				$scope.paylog=response
			}
		);		
	}


	$scope.createNative=function(){
		$scope.type=$scope.getType();
		payService.createNative('http://127.0.0.1:8020/Shopping/html/webfront/paysuccess.html',$scope.type).success(
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
