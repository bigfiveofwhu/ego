<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<%
	if(request.getAttribute("isSendRedirect") ==null)
	{
		response.sendRedirect(basePath+"/localCity/home.html");
	}
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>eGo同城</title>
<%@include file="/head.jsp" %>
<link href="<%=path %>/css/localCity/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/skin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/home.css" rel="stylesheet" type="text/css" />
<%@include file="/prompt.jsp" %>
<c:if test="${msg!=null }">
	<script type="text/javascript">
	$(function(){
		promptGlobal("${msg}");
	});
	</script>
</c:if>
</head>
<body>
	<div class="hmtop">
		<%--顶部导航条 --%>
		<%@include file="/localCity/navigate.jsp" %>
		<%--悬浮搜索框 --%>
		<%@ include file="/localCity/navSearch.jsp" %>
		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
			<%--
			<c:forEach items="${loopShow }" var="Img">
				<li class="banner1">
				<!--商品类型 -->
				<c:if test="${Img.aad303=='00' }">
				<a href="<%=path%>/shop/detail.html?aId=${Img.aad302 }&productId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad302 }.jpg" /></a>
				</c:if>
				<!--店铺类型 -->
				<c:if test="${Img.aad303=='01' }">
				<a href="<%=path%>/shop/home.html?aId=${Img.aad302 }&shopId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad302 }.jpg" /></a>
				</c:if>
				</li>
			</c:forEach> --%>
				<li class="banner1">
				<a href="introduction.html"><img src="<%=path%>/images/ad1.jpg" /></a>
				</li>
				<li class="banner2">
				<a><img src="<%=path%>/images/ad2.jpg" /> </a>
				</li>
				<li class="banner3">
				<a><img src="<%=path%>/images/ad3.jpg" /> </a>
				</li>
				<li class="banner4">
				<a><img src="<%=path%>/images/ad4.jpg" /> </a>
				</li>
				<li class="banner4">
				<a><img src="<%=path%>/images/ad4.jpg" /> </a>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<!-- 顶部分类导航 -->
			<%@include file="/navClassify.jsp" %>
			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul class="category-list" id="js_climit_li">
							<%-- <%@include file="/home/productType.jsp" %>--%>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(".productType").click(function(){
					var id=$(this).attr("ptype_id");
					location.href="<%=path%>/search.html?type="+id;
				});
			</script>
			<!--轮播-->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document).ready(function() {
					$("li").hover(function() {
						$(".category-content .category-list li.first .menu-in").css("display","none");
						$(".category-content .category-list li.first").removeClass("hover");
					    $(this).addClass("hover");
						$(this).children("div.menu-in").css("display","block")
					},
					function() {
						$(this).removeClass("hover")
						$(this).children("div.menu-in").css("display","none")
				    });
				});
			</script>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--服务分类-->
			<div id="serviceSort" class="am-g am-g-fixed recommendation">
				<%@include file="/localCity/serviceSort.jsp" %>
			</div>
			<!--今日推荐-->
			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="<%=path%>/images/2016.png "/>
					<p>
						今日<br>推荐
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>真的有鱼</h3>
						<h4>开年福利篇</h4>
					</div>
					<div class="recommendationMain one">
						<a href="introduction.html"><img src="<%=path%>/images/tj.png "></img>
						</a>
					</div>
				</div>
				<c:forEach items="${list4 }" varStatus="" var="item3">

					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>${item3.name }</h3>
							<h4>${item3.price }</h4>
						</div>
						<div class="recommendationMain one">
							<a href="<%=path %>/shop/detail.html?productId=${item3.id}"><img src="${item3.path }"></img>
							</a>
						</div>
					</div>

				</c:forEach>
			</div>
			<div class="clear "></div>
			<!--热门活动 -->
			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>新增服务商</h4>
					<h3>新增服务商 优惠享不停</h3>
					<span class="more "> 
						<a href="# ">全部服务商<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed service-101">
				</div>
				<script type="text/javascript">
				$(function(){
					setTimeout(()=>{
						$.ajax({
							url:"<%=path%>/service.ajax",
							type:"post",
							dataType:"json",
							timeout:20000,
							data:{
								"type":"1",
								"location":myGeoLocation
							},
							success:function(res,status){
								console.log(res.services.toString());
								var services=res.services;
								var n=services.length;
								var html="";
								for(var i=0;i<n;i++){
									var service=services[i]
									html+=  "<div class='service-body'>"+
											"	<div class='am-u-sm-3 '>"+
											"		<div class='icon-sale one'></div>"+
											"		<h4>优惠</h4>"+
											"		<div class='activityMain'>"+
											"			<a href='${path}/localCity/companyDetail.html?id="+service.aac102+"'>"+
											"           <img src='${path}/images/service/service_"+service.aac102+".jpg' onerror='this.src=\"${path}/images/service/"+service.aac102+".jpg\"'></img></a>"+
											"		</div>"+
											"		<div class='info'>"+
											"			<h3>"+service.aac103+"</h3>"+
											"		</div>"+
											"	</div>"+
											"	<div class='service-intro'>"+
											"		<div class='service-intro-item'>"+
											"			<p class='title'>服务商名称</p>"+
											"			<P class='value'>"+service.aac103+"</P>"+
											"		</div>"+
											"		<div class='service-intro-item'>"+
											"			<p class='title'>服务类型</p>"+
											"			<P class='value'>"+service.aac106+"</P>"+
											"		</div>"+
											"		<div class='service-intro-item'>"+
											"			<p class='title'>公司地址</p>"+
											"			<P class='value'>"+service.aac104+"</P>"+
											"		</div>"+
											"		<div class='service-intro-item'>"+
											"			<p class='title'>综合评分</p>"+
											"			<P class='value'>"+service.aac110+"</P>"+
											"		</div>"+
											"		<div class='service-intro-item'>"+
											"			<p class='title'>公司电话</p>"+
											"			<P class='value'>"+service.aac111+"</P>"+
											"		</div>"+
											"	</div>"+
											"</div>";
								}
								$(".service-101").html(html);
							},
							error:function(res,status){
								console.log("网络故障!");
							}
						});
					},500);
				});
				</script>
				<div class="clear "></div>
				<%--
				<div id="f1">
					<!-- 猜你喜欢 -->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>猜你喜欢</h4>
							<h3>今日份猜你喜欢</h3>
							<div class="today-brands ">
								<a href="# ">腰果</a> 
								<a href="# ">松子</a> 
								<a href="# ">夏威夷果</a> 
								<a href="# ">碧根果</a>
								<a href="# ">开心果</a> 
								<a href="# ">核桃仁</a>
							</div>
							<span class="more "> 
							    <a href="# ">更多美味
							        <i class="am-icon-angle-right" style="padding-left:10px ;"></i> 
							    </a> 
							</span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
							<c:forEach begin="0" end="5">
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">水蜜桃</b> 
								    </span> 
								</a>
							</c:forEach>
							</div>
							<a href="# "> 
							    <img src="<%=path%>/images/act1.png " />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
								</div> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<c:forEach items="${guessProduct}" var="item2" varStatus="">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?aId=${item2.aad302 }&productId=${item2.aad306}">
								    <img src="<%=path %>/images/advertise/${item2.aad302}.jpg" />
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>--%>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	</div>
	<!--引导 -->
	<%@include file="/bottomGuide.jsp" %>
	<!--菜单 -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="<%=path %>/basic/js/quick_links.js "></script>
</body>
</html>