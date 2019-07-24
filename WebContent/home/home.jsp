<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<%
	if(request.getAttribute("isSendRedirect") ==null)
	{
		response.sendRedirect(basePath+"/home/home.html");
	}
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>eGo首页</title>
<%@include file="/head.jsp" %>
<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/skin.css" rel="stylesheet" type="text/css" />
<c:if test="${msg!=null }">
	<script type="text/javascript">
	$(function(){
		alert('${msg}');
	});
	</script>
</c:if>
</head>
<body>
	<div class="hmtop">
		<%--顶部导航条 --%>
		<%@include file="/navigate.jsp" %>
		<%--悬浮搜索框 --%>
		<%@ include file="/navSearch.jsp" %>
		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
			<c:forEach items="${loopShow }" var="Img">
				<li class="banner4">
				<%--商品类型 --%>
				<c:if test="${Img.aad303=='00' }">
				<a href="<%=path%>/shop/detail.html?aId=${Img.aad302 }&productId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad307 }" /></a>
				</c:if>
				<%--店铺类型 --%>
				<c:if test="${Img.aad303=='01' }">
				<a href="<%=path%>/shop/home.html?aId=${Img.aad302 }&shopId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad307 }" /></a>
				</c:if>
				</li>
			</c:forEach>
			<%-- 
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
				</li>--%>
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
							<%@include file="/home/productType.jsp" %>
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
			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html">
					    <img src="<%=path%>/images/navsmall.jpg" />
						<div class="title">商品分类</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
					    <img src="<%=path%>/images/huismall.jpg" />
						<div class="title">大聚惠</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
						<img src="<%=path%>/images/mansmall.jpg" />
						<div class="title">个人中心</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
						<img src="<%=path%>/images/moneysmall.jpg" />
						<div class="title">投资理财</div>
					</a>
				</div>
			</div>

			<!--走马灯 -->
			<div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">
					<ul>
						<li class="title-first">
							<a target="_blank" href="#">
								<img src="<%=path%>/images/TJ2.jpg"/> 
								<span>[特惠]</span>商城爆品1分秒 
							</a>
						</li>
						<li class="title-first">
							<a target="_blank" href="#"> 
								<span>[公告]</span>商城与广州市签署战略合作协议
								<img src="<%=path%>/images/TJ.jpg"/>
								<p>XXXXXXXXXXXXXXXXXX</p> 
							</a>
						</li>
						<div class="mod-vip">
						<c:choose>
						   <c:when test="${aaa102!=null}">
				   				<div class="m-baseinfo">
								<a href="<%=path%>/person/index.jsp"> 
								<img src="<%=path%>/images/upload/user_${aaa102 }.jpg"> </a> 
								<em> Hi,<span class="s-name">${aaa103}</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
								</div>
							</c:when>
							<c:otherwise>
								<div class="m-baseinfo">
									<a href="#"> 
									<img src="<%=path%>/images/getAvatar.do.jpg"> 
									</a> 
									<em> Hi,<span class="s-name">欢迎</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
								</div>
								<div class="member-logout">
									<a class="am-btn-warning btn" href="login.jsp">登录</a>
									<a class="am-btn-warning btn" href="register.jsp">注册</a>
								</div>
							</c:otherwise>
						</c:choose>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>
						<li>
						    <a target="_blank" href="#">
						    	<span>[特惠]</span>洋河年末大促，低至两件五折
						    </a>
						</li>
						<li>
							<a target="_blank" href="#">
							    <span>[公告]</span>华北、华中部分地区配送延迟
							</a>
						</li>
						<li>
						    <a target="_blank" href="#">
						        <span>[特惠]</span>家电狂欢千亿礼券 买1送1！
						    </a>
						</li>
					</ul>
					<div class="advTip">
						<img src="<%=path%>/images/advTip.jpg" />
					</div>
				</div>
			</div>
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
			<!--今日推荐 -->
			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3">
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
					<h4>活动</h4>
					<h3>每期活动 优惠享不停</h3>
					<span class="more "> 
						<a href="# ">全部活动<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${activityList}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>秒杀</h4>
							<div class="activityMain ">
							    <!--  点击图片显示图片详细 -->
								<a href="<%=path %>/shop/detail.html?productId=${item.aab203}"><img src="${item.aab603 }"></img></a>
							</div>
							<div class="info ">
								<h3>${item.aab604 }</h3>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear "></div>
				<%--热门店铺 --%>
				<div class="shopTitle ">
					<h4>热门店铺</h4>
					<h3>热门店铺 优惠享不停</h3>
					<span class="more "> 
						<a href="# ">全部店铺<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${hotShop}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>实惠</h4>
							<div class="activityMain ">
							    <!--  点击图片显示图片详细 -->
								<a href="<%=path %>/shop/home.html?aId=${item.aad302 }&shopId=${item.aad306}">
								<img src="<%=path%>/images/advertise/${item.aad307 }"></img></a>
							</div>
							<div class="info ">
								<h3>${item.aab103 }</h3>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear "></div>
				
				<div id="f1">
					<!--热门商品-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>热门商品</h4>
							<h3>今日份热门商品</h3>
							<div class="today-brands ">
							<!--
								<a href="# ">桂花糕</a> 
								<a href="# ">奶皮酥</a> 
								<a href="# ">栗子糕</a>
								<a href="# ">马卡龙</a>
								<a href="# ">铜锣烧</a>
								<a href="# ">豌豆黄</a>
							-->
							</div>
							<span class="more ">
								<a href="# ">更多美味
									<i class="am-icon-angle-right" style="padding-left:10px ;"></i> 
								</a>
							</span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
							<c:forEach begin="0" end="5">
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b> 
								    </span> 
								</a>
							</c:forEach>
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">开抢啦！</div>
									<div class="sub-title ">零食大礼包</div>
								</div> 
								<img src="<%=path%>/images/act1.png" /> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<c:forEach items="${hotProduct}" var="item1" varStatus="">
							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">${item1.aab202 }</div>
									<div class="sub-title ">&yen;${item1.aab205 }</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<!-- 甜品 -->
								<a href="<%=path %>/shop/detail.html?aId=${item1.aad302 }&productId=${item1.aab203}">
								<img src="<%=path %>/images/advertise/${item1.aad307 }" alt="${item1.aab202 }" /> 
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>
				<div id="f2">
					<!--新品推荐-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>最新商品</h4>
							<h3>酥酥脆脆，回味无穷</h3>
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
								        <b class="text">核桃</b> 
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
						<c:forEach items="${productList}" var="item2" varStatus="vs">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?productId=${item2.aab203}">
								    <img id="pro${vs.count}" src="<%=path %>${item2.aab208}" />
								    <script type="text/javascript">
								    	$(function(){
								    		var img${vs.count}='${item2.aab208}';
								    		$("#pro${vs.count}").attr("src","<%=path %>"+img${vs.count}.split(";")[0]);
								    	});
								    </script>
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
				</div>
				<div id="f3">
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
								    <img src="<%=path %>/images/advertise/${item2.aad307}" />
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
						<%--
						<c:forEach items="${productList}" var="item2" varStatus="">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?productId=${item2.aab203}">
								    <img src="${productImg }" />
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
						 --%>
					</div>
					<div class="clear "></div>
				</div>
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