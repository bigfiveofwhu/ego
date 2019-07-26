<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">			
		<title>��������--${shop.aab103 }</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/shop/sortstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/shop/home.css" rel="stylesheet" type="text/css" />
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	</head>
	<body>
			<!--���������� -->
			<%@include file="/navigate.jsp" %>

			<!--����������-->
			<%@include file="/navSearch.jsp" %>
			<div class="clear"></div>
		<!--����-->
		<%-- 
		<div id="nav" class="navfull">
			<div class="area clearfix">
				<div class="category-content" id="guide_2">
					<div class="long-title"><span class="all-goods">ȫ������</span><span id="meauBack"><a href="home.html">����</a></span></div>
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
			   <p onclick="location.href='<%=path%>/shop/home.html?shopId=${shop.aab102 }'">�������</p>
			</div>
			<div class="gradeInfo">
				<div class="pro">
					<span>��Ʒ</span>
					<p>${shop.aab111 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="deliver">
					<span>����</span>
					<p>${shop.aab109 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="service">
					<span>�ۺ�</span>
					<p>${shop.aab110 }</p>
				</div>
			</div>
			<div class="addr">
				<p style="color:red;">�ص�:</p>
				<p>${shop.aab105 }</p>
			</div>
			<div style="padding-top: 10px;cursor:pointer;">
			 <a><span onclick="addShopCollection();" class="am-icon-heart">�ղر���</span></a>
			 </div>
		</div>
		<div class="clear"></div>
		<div class="loopShow" style="background-image: url('${path}/images/shop/home_${shop.aab102}.jpg');background-size: cover;"></div>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=DD279b2a90afdf0ae7a3796787a0742e"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
		<script type="text/javascript">
			var myCity = new BMap.LocalCity();
			var map = new BMap.Map("container");    // ����Mapʵ��,�ɹرյ�ͼ�ɵ㹦��,{enableMapClick:false}
			var address = null;
			
			myCity.get(function(result){
			    // ��ʼ����ͼ,�������ĵ�����͵�ͼ���� 
			    map.centerAndZoom(new BMap.Point(${position.center}), 15);
			    console.log(result.level);
				//lng:������,lat:����γ��,level:չʾ��ǰ���е���ѵ�ͼ����
			    //��ӵ�ͼ���Ϳؼ�
			    map.addControl(new BMap.MapTypeControl());
			    //��������������
			    map.enableScrollWheelZoom(true);
				address = result.name;
				//alert("��ǰ���ڳ���:"+result.name);
			}); 
		
		   function findPlace(){
			var myGeo = new BMap.Geocoder();
				// ����ַ���������ʾ�ڵ�ͼ��,��������ͼ��Ұ
			myGeo.getPoint(document.getElementById("address").value, function(point){
				if (point) {
					 map.centerAndZoom(point, 18);
					 map.enableScrollWheelZoom(true);
					map.addOverlay(new BMap.Marker(point));
				}else{
					alert("��ѡ����̵겻�ڸ��з�Χ��!");
				}
			}, address);
		  }
		   var MAX = 10;
		   var markers = [];
		   var pt = null;
		   var i = 0;
	       pt = new BMap.Point(${position.center});
	       markers.push(new BMap.Marker(pt));
		   
		   //��򵥵��÷�������һ��marker���飬Ȼ�����markerClusterer�༴�ɡ�
		   var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
		</script>  
		<div class="clear"></div>
		<div class="sort">
			<div class="element selected" index="1">
			ȫ����Ʒ
			</div>
			<div class="element" index="2">
			������Ʒ
			</div>
			<div class="element" index="3">
			������Ʒ
			</div>
		</div>
		<div class="clear"></div>
		<div class="shopNav">
		<%-- 
		<c:forEach begin="0" end="19">
			<div class="product">
				<a href="#">
				<img alt="��Ʒ���� �ְ�����218g ������� ��������" src="/ego/images/01_mid.jpg"/>
				<span>��Ʒ���� �ְ�����218g ������� ��������</span>
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
// 						console.log("����ʧ��");
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
			    layer.msg("�ղسɹ�");
			else
				layer.msg("�������ѱ��ղ�")
		},
		error:function(res,status){
			console.log("�ղ�ʧ��");
		}
	});
}
</script>
		<!--���� -->
		<%@include file="/footer.jsp" %>
		<%@include file="/bottomGuide.jsp" %>
	</body>
</html>