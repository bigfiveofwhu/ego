<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">			
		<title>公司详情--${com.aac103 }</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/shop/sortstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/localCity/detail.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	</head>
	<body>
			<!--顶部导航条 -->
			<%@include file="/localCity/navigate.jsp" %>

			<!--悬浮搜索框-->
			<%@include file="/localCity/navSearch.jsp" %>
			<div class="clear"></div>
		<!--主体-->
		<div class="shopInfo">
			<div id="shopHeader">
			   <img alt="${com.aac103 }" src="<%=path %>/images/3.jpg">
			   <span>${com.aac103 }</span>
			   <p onclick="location.href='<%=path%>/localCity/companyDetail.html?id=${com.aac102 }'">公司主页</p>
			</div>
			<div class="gradeInfo">
				<div class="pro">
					<span>综合评分</span>
					<p>${com.aac110 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="deliver">
					<span>综合评分</span>
					<p>${com.aac110 }</p>
				</div>
				<div class="seperator">|</div>
				<div class="service">
					<span>综合评分</span>
					<p>${com.aac110}</p>
				</div>
			</div>
			<div class="addr">
				<p style="color:red;">地点:</p>
				<p>${com.aac104 }</p>
			</div>
		</div>
		<div class="clear"></div>
		<div class="loopShow">
			
		</div>
		<div class="clear"></div>
		<div class="sort">
			<div class="element selected" index="1">
			详细信息
			</div>
			<div class="element" index="2">
			全部服务
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
			<div class="comInfo">
				<div class="comItem">
					<p class="comItem_title">公司名称</p>
					<p class="comItem_value">${com.aac103}</p>
					<p class="comPage" onclick="location.href='<%=path%>/localCity/companyDetail.html?id=${com.aac102 }'">公司主页</p>
				</div>
				<div class="comItem">
					<p class="comItem_title">联系电话</p>
					<p class="comItem_value">${com.aac111}</p>
				</div>
				<div class="comItem">
					<p class="comItem_title">公司地址</p>
					<p class="comItem_value">${com.aac104}</p>
				</div>
				<div class="comItem">
					<p class="comItem_title">服务类别</p>
					<p class="comItem_value">${com.aac106}</p>
				</div>
				<div class="comItem">
					<p class="comItem_title">服务评分</p>
					<p class="comItem_value">${com.aac110}</p>
				</div>
				<div class="comItem">
					<p class="comItem_title">注册时间</p>
					<p class="comItem_value">${com.aac112}</p>
				</div>
			</div>
		</div>
		<div class="products2" style="width:100%;display:none;">
			全部服务
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
				if(type=='1'){
					return;
				}
				$.ajax({
					url:"<%=path%>/getServices.ajax",
					type:"post",
					dataType:"json",
					timeout:20000,
					data:{
						"aac102":'${com.aac102}'
					},
					success:function(res,status){
						var products=res.services;
						var n=products.length;
						var html="";
						for(var i=0;i<n;i++){
							var product=products[i];
							var p=product.aac210.split(";");
							html+="<div class='product'>"+
								  "<a href='/ego/localCity/detail.html?serviceId="+product.aac202+"'>"+
								  "<img alt='"+product.aac203+"' src='/ego/"+p[0]+"'/>"+
								  "<span>"+product.aac203+"</span></a></div>"
						}
						$(".shopNav>.selected").html(html);
					},
					error:function(res,status){
						console.log("请求失败");
					}
				});
			});
		</script>
		<!--引导 -->
		<%@include file="/footer.jsp" %>
		<%@include file="/bottomGuide.jsp" %>
	</body>
</html>