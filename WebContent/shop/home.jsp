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
			   <img alt="${shop.aab103 }" src="<%=path %>/images/3.jpg">
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
		</div>
		<div class="clear"></div>
		<div class="loopShow"></div>
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
			<div class="element" index="4">
			�Ż���Ʒ
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
		<c:forEach items="${productList }" var="product">
			<div class="product">
				<a href="<%=path%>/shop/detail.html?productId=${product.aab203}">
				<img alt="${product.aab202 }" src="${product.aab208 }"/>
				<span>${product.aab202 }</span>
				</a>
			</div>
		</c:forEach>
		</div>
		<div class="products2" style="width:100%;display:none;">
			������Ʒ
		</div>
		<div class="products3" style="width:100%;display:none;">
			������Ʒ
		</div>
		<div class="products4" style="width:100%;display:none;">
			�Ż���Ʒ
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
				$.ajax({
					url:"<%=path%>/getProducts.ajax",
					type:"post",
					dataType:"json",
					timeout:20000,
					data:{
						"type":type,
						"id":'${shop.aab102}'
					},
					success:function(res,status){
						var products=res.products;
						var n=products.length;
						var html="";
						for(var i=0;i<n;i++){
							var product=products[i];
							html+="<div class='product'>"+
								  "<a href='/ego/shop/detail.html?productId="+product.aab203+"'>"+
								  "<img alt='"+product.aab202+"' src='"+product.aab208+"'/>"+
								  "<span>"+product.aab202+"</span></a></div>"
						}
						$(".shopNav>.selected").html(html);
					},
					error:function(res,status){
						console.log("����ʧ��");
					}
				});
			});
		</script>
		<!--���� -->
		<%@include file="/footer.jsp" %>
		<%@include file="/bottomGuide.jsp" %>
	</body>
</html>