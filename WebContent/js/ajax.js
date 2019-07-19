
$(function() {
	addTocart()
})
function addTocart() {
	
	var username = $("#usernameId").html();
	$.get("/shoppingPro/shoppingCart?cmd=cartNum&username="+username,function(data,status){
		$("#J_MiniCartNum").html(data);    
	  });
}
function checkChange(box){
	if(box.checked){
		$.each($(".check"),function(){
			this.checked=true;
		});
	}else{
		$.each($(".check"),function(){
			this.checked=false;
		});
	}
	selectCart(false);
}
function selectCart(y) {
	//console.log($("#J_CheckBox_"+id).css("selected"))
	if(y) $("#J_SelectAllCbx2").attr("checked",false);
	var box=$(".check:checked");
	var n=box.length;
	$("#J_SelectedItemsCount").text(n);
	var sum=0.00;
	for(var i=0;i<n;i++){
		var id=box[i].getAttribute("value");
		var price=parseFloat($(".singleTotalPrice"+id).text());
		sum+=price;
	}
	$("#J_Total").text(parseInt(sum*100)/100.0);
}
function changeNum(cha,index,id) {
	var count=parseInt($("#count"+index).val());
	if(cha){
		if(count=='1'){
			
		}else{
			--count;
		}
	}else{
		++count;
	}
	$.ajax({
		url:"/ego/updateShopCart.ajax",
		type:"post",
		timeout:20000,
		dataType:"json",
		data:{
			"aab203":id,
			"aaa202":count,
			"type":"1"
		},
		success:function(res,status){
			if(res.status=='200'){
				$("#count"+index).val(res.count);
				var single=parseFloat($("#price"+index).text());
				var price=parseInt(single*count*100)/100.0
				$(".singleTotalPrice"+id).text(price+"");
				selectCart(false);
			}if(res.status=='201'){
				alert("操作失败!");
			}if(res.status=='202'){
				alert("重新登录");
				location.href="/ego/home/login.jsp";
			}
		},
		error:function(res,status){
			alert("网络故障!");
			console.log("购物车修改失败!");
		}
	});
}

function showCart(id){

	var kouwei=$("#kouwei"+id).val();

	var baozhuang=$("#baozhuang"+id).val();

	var num=$("#text_box").val();

	$.get("/shoppingPro/introduction?cmd=addToCart&id="+id+"&kouwei="+kouwei+"&baozhuang="+baozhuang+"&num="+num,
			function(data,status){
		
	/*	alert(data);*/
		$(".cart_num").html(data);
		
	});
}

