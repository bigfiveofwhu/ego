<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">			
		<title>店铺详情--${shop.aab103 }</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/shop/sortstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/shop/home.css" rel="stylesheet" type="text/css" />
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	</head>
	<body>
			<!--顶部导航条 -->
			<%@include file="/navigate.jsp" %>

			<!--悬浮搜索框-->
			<%@include file="/navSearch.jsp" %>
			<div class="clear"></div>
		<!--主体-->
		<%-- 
		<div id="nav" class="navfull">
			<div class="area clearfix">
				<div class="category-content" id="guide_2">
					<div class="long-title"><span class="all-goods">全部分类</span><span id="meauBack"><a href="home.html">返回</a></span></div>
					<div class="category">
						<%@include file="/shop/sort.jsp" %>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$("li").click(function() {		
				     	$(this).addClass("selected").siblings().removeClass("selected");
			       });
			});
		</script>--%>
		<div class="shopInfo">
			<div id="shopHeader">
			   <img alt="${shop.aab103 }" src="<%=path %>/images/shop/shop_${shop.aab102}.jpg">
			   <span>${shop.aab103 }</span>
			   <p onclick="location.href='<%=path%>/shop/home.html?shopId=${shop.aab102 }'">进入店铺</p>
			</div>
			<div class="gradeInfo">
				<div class="pro">
					<span>商品</span>
					<p>${shop.aab111 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="deliver">
					<span>物流</span>
					<p>${shop.aab109 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="service">
					<span>售后</span>
					<p>${shop.aab110 }</p>
				</div>
			</div>
			<div class="addr">
				<p style="color:red;">地点:</p>
				<p>${shop.aab105 }</p>
			</div>
			<div style="padding-top: 10px;cursor:pointer;">
			 <a><span onclick="addShopCollection();" class="am-icon-heart">收藏本店</span></a>
			 </div>
		</div>
		<div class="clear"></div>
		<div class="loopShow" style="background-image: url('${path}/images/shop/home_${shop.aab102}.jpg');background-size: cover;"></div>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=DD279b2a90afdf0ae7a3796787a0742e"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
		<script type="text/javascript">
			var myCity = new BMap.LocalCity();
			var map = new BMap.Map("container");    // 创建Map实例,可关闭底图可点功能,{enableMapClick:false}
			var address = null;
			
			myCity.get(function(result){
			    // 初始化地图,设置中心点坐标和地图级别 
			    map.centerAndZoom(new BMap.Point(${position.center}), 15);
			    console.log(result.level);
				//lng:地理精度,lat:地理纬度,level:展示当前城市的最佳地图级别
			    //添加地图类型控件
			    map.addControl(new BMap.MapTypeControl());
			    //开启鼠标滚轮缩放
			    map.enableScrollWheelZoom(true);
				address = result.name;
				//alert("当前所在城市:"+result.name);
			}); 
		
		   function findPlace(){
			var myGeo = new BMap.Geocoder();
				// 将地址解析结果显示在地图上,并调整地图视野
			myGeo.getPoint(document.getElementById("address").value, function(point){
				if (point) {
					 map.centerAndZoom(point, 18);
					 map.enableScrollWheelZoom(true);
					map.addOverlay(new BMap.Marker(point));
				}else{
					alert("你选择的商店不在该市范围内!");
				}
			}, address);
		  }
		   var MAX = 10;
		   var markers = [];
		   var pt = null;
		   var i = 0;
	       pt = new BMap.Point(${position.center});
	       markers.push(new BMap.Marker(pt));
		   
		   //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
		   var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
		</script>  
		<div class="clear"></div>
		<div class="sort">
			<div class="element selected" index="1">
			全部商品
			</div>
			<div class="element" index="2">
			热门商品
			</div>
			<div class="element" index="3">
			新增商品
			</div>
		</div>
		<div class="clear"></div>
		<div class="shopNav">
		<%-- 
		<c:forEach begin="0" end="19">
			<div class="product">
				<a href="#">
				<img alt="良品铺子 手剥松子218g 坚果炒货 巴西松子" src="/ego/images/01_mid.jpg"/>
				<span>良品铺子 手剥松子218g 坚果炒货 巴西松子</span>
				</a>
			</div>
		</c:forEach>
		--%>
		<div class="products1 selected" style="width:100%;">
		<c:forEach items="${productList }" var="product" varStatus="vs">
			<div class="product">
				<a href="<%=path%>/shop/detail.html?productId=${product.aab203}">
				<img id="pro102_${vs.count}" alt="${product.aab202 }" src="${product.aab208 }"/>
				<span>${product.aab202 }</span>
				</a>
			</div>
			<script type="text/javascript">
				$(function(){
					var pro102_${vs.count}='${product.aab208 }';
					$("#pro102_${vs.count}").attr("src","/ego"+pro102_${vs.count}.split(";")[0]);
				});
			</script>
		</c:forEach>
		</div>
		<div class="products2" style="width:100%;display:none;">
			<c:forEach items="${hotProducts }" var="item">
				<div class="product">
					<a href="<%=path%>/shop/detail.html?productId=${item.aab203}">
					<img alt="${item.aab202 }" src="/ego${item.path }"/>
					<span>${item.aab202 }</span>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="products3" style="width:100%;display:none;">
			<c:forEach items="${latestProducts }" var="item">
				<div class="product">
					<a href="<%=path%>/shop/detail.html?productId=${item.aab203}">
					<img alt="${item.aab202 }" src="/ego${item.path }"/>
					<span>${item.aab202 }</span>
					</a>
				</div>
			</c:forEach>
		</div>

		</div>
		<div class="clear" style="margin-bottom: 33px;"></div>
		<script type="text/javascript">
			
			$(".element").click(function(){
				$(this).addClass("selected").siblings(".selected").removeClass("selected");
				var type=$(this).attr("index");
				var index=".products"+type;
				$(index).addClass("selected").css("display","inline")
						.siblings(".selected").css("display","none").removeClass("selected");
// 				$.ajax({
<%-- 					url:"<%=path%>/getProducts.ajax", --%>
// 					type:"post",
// 					dataType:"json",
// 					timeout:20000,
// 					data:{
// 						"type":type,
// 						"id":'${shop.aab102}'
// 					},
// 					success:function(res,status){
// 						var products=res.products;
// 						var n=products.length;
// 						var html="";
// 						for(var i=0;i<n;i++){
// 							var product=products[i];
// 							html+="<div class='product'>"+
// 								  "<a href='/ego/shop/detail.html?productId="+product.aab203+"'>"+
// 								  "<img alt='"+product.aab202+"' src='/ego"+product.aab208.split(";")[0]+"'/>"+
// 								  "<span>"+product.aab202+"</span></a></div>"
// 						}
// 						$(".shopNav>.selected").html(html);
// 					},
// 					error:function(res,status){
// 						console.log("请求失败");
// 					}
// 				});
			});
		</script>
		<script src="/ego/layui/layui.js"></script>
<script>
layui.use('layer', function(){
	layer = layui.layer;
});
function addShopCollection()
{
	alert('${shop.aab102}');
	if('${aaa102}' == '')
		return;
	$.ajax({
		url:"${path}/addCollection.ajax",
		type:"post",
		dataType:"json",
		timeout:20000,
		data:{
			"aaa303": '${shop.aab102}',
			"aaa302": "02"
		},
		success:function(res,status){
			if(res.tag == 1)
			    layer.msg("收藏成功");
			else
				layer.msg("该商铺已被收藏")
		},
		error:function(res,status){
			console.log("收藏失败");
		}
	});
}
</script>
		<!--引导 -->
		<%@include file="/footer.jsp" %>
		<%@include file="/bottomGuide.jsp" %>
	</body>
</html>