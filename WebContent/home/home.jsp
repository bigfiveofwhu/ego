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
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/skin.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>
<body>
	<div class="hmtop">
		<%--顶部导航条 --%>
		<%@include file="/navigate.jsp" %>
		<%--悬浮搜索框 --%>
		<div class="nav white">
		<div class="logo">
			<img src="<%=path%>/images/logo.png" />
		</div>
		<div class="logoBig">
			<li>
			<img src="<%=path%>/images/logobig.png" />
			</li>
		</div>
		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="<%=path %>/search.html">
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off"> 
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
			</form>
		</div>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
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
			</li></ul> 
			<script type="text/javascript">
			    $(function (){
			    	$.ajax({
			    		url:"",
			    		data:"",
			    		dataType:"",
			    		success:function (){
			    			
			    		},
			    		error:function(){
			    			
			    		}
			    	});
			    	console.log($(".am-slides").html());
			    })
			</script>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">首页</a>
					</li>
					<li class="qc"><a href="#">闪购</a>
					</li>
					<li class="qc"><a href="#">限时抢</a>
					</li>
					<li class="qc"><a href="#">团购</a>
					</li>
					<li class="qc last"><a href="#">大包装</a>
					</li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul class="category-list" id="js_climit_li">
							</ul>
						</div>
					</div>
				</div>
			</div>
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
						   <c:when test="${session_uid!=null}">
				   				<div class="m-baseinfo">
								<a href="<%=path%>/person/information.jsp"> 
								<img src="<%=path%>/images/getAvatar.do.jpg"> </a> 
								<em> Hi,<span class="s-name">${session_username}</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
								</div>
							</c:when>
							<c:otherwise>
								<div class="m-baseinfo">
									<a href="#"> 
									<img src="<%=path%>/images/getAvatar.do.jpg"> 
									</a> 
									<em> Hi,<span class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
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
   <%--  <iframe id="google_ads_frame3" name="google_ads_frame3" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1341152667756824&amp;output=html&amp;h=90&amp;slotname=5754098212&amp;adk=1811165632&amp;adf=3847671124&amp;w=728&amp;lmt=1562068081&amp;guci=2.2.0.0.2.2.0.0&amp;format=728x90&amp;url=https%3A%2F%2Fconvertio.co%2Fzh%2Fpng-svg%2F&amp;flash=0&amp;wgl=1&amp;dt=1562068081169&amp;bpp=17&amp;bdt=307&amp;fdt=18&amp;idt=18&amp;shv=r20190626&amp;cbv=r20190131&amp;saldr=aa&amp;abxe=1&amp;prev_fmts=728x90%2C728x90&amp;correlator=7564648527725&amp;frm=20&amp;pv=1&amp;ga_vid=1553896000.1562067597&amp;ga_sid=1562068081&amp;ga_hid=2108996575&amp;ga_fc=0&amp;iag=0&amp;icsg=41130&amp;dssz=13&amp;mdo=0&amp;mso=0&amp;u_tz=480&amp;u_his=3&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=588&amp;ady=926&amp;biw=1903&amp;bih=888&amp;scr_x=0&amp;scr_y=0&amp;eid=21060853%2C368226351%2C368226361%2C633794000%2C633794002&amp;oid=3&amp;ref=https%3A%2F%2Fconvertio.co%2Fzh%2Fimage-converter%2F&amp;rx=0&amp;eae=0&amp;fc=656&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1920%2C888&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=24&amp;bc=31&amp;osw_key=2046013984&amp;ifi=3&amp;uci=3.8obyei4cvcy4&amp;fsb=1&amp;xpc=njCIeAerN8&amp;p=https%3A//convertio.co&amp;dtd=27" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="3.8obyei4cvcy4" data-google-query-id="CPrY4YiVluMCFdMlrQYd1s4Msg" data-load-complete="true"></iframe>
           --%> 
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--今日推荐 -->
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
			<%-- 	<%
					//生成随机数
					
					//把随机数放在session中
					request.getSession().setAttribute("TOKEN_IN_SESSION", ${list4 });
				%> --%>
				<c:forEach items="${list4 }" varStatus="" var="item3">

					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>${item3.name }</h3>
							<h4>${item3.price }</h4>
						</div>
						<div class="recommendationMain one">
							<a href="${url}/intrServlet?goodId=${item3.id}"><img src="${item3.path }"></img>
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
					<span class="more "> <a href="# ">全部活动<i
							class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
				</div>
				<div class="am-g am-g-fixed ">

					<div class="am-u-sm-3 ">
						<div class="icon-sale one"></div>
						<h4>超值</h4>
						<div class="activityMain ">
							<img src="<%=path%>/images/activity.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>													
					</div>

					<c:forEach items="${sessionScope.list1}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>秒杀</h4>
							<div class="activityMain ">
							    <!--  点击图片显示图片详细 -->
								<%-- <a href="${item.website}"><img src="${item.path }"></img> </a> --%>
								<a href="${url}/intrServlet?goodId=${item.id}"><img src="${item.path }"></img> </a>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>

					</c:forEach>

				</div>

				<div class="clear "></div>
				<div id="f1">
					<!--甜点-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>甜品</h4>
							<h3>每一道甜品都有一个故事</h3>
							<div class="today-brands ">
								<a href="# ">桂花糕</a> 
								<a href="# ">奶皮酥</a> 
								<a href="# ">栗子糕</a>
								<a href="# ">马卡龙</a>
								<a href="# ">铜锣烧</a>
								<a href="# ">豌豆黄</a>
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
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b> 
								    </span> 
								</a>
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b>
								    </span> 
								</a>
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b>
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b> 
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b>
								     </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b>
								    </span> 
								</a>
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

						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">&yen;13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="<%=path%>/images/2.jpg" /> </a>
						</div>
						
						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">&yen;13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="<%=path%>/images/2.jpg" /> </a>
						</div>

						<c:forEach items="${sessionScope.list2}" var="item1" varStatus="">

							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">${item1.name }</div>
									<div class="sub-title ">&yen;${item1.price }</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<!-- 甜品 -->
								<%-- <a href="${item1.website }"><img src="${item1.path }" /> </a> --%>
								<a href="${url}/intrServlet?goodId=${item1.id}"><img src="${item1.path }" /> </a>
							</div>

						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>
				<div id="f2">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>坚果</h4>
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
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">核桃</b> 
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								         <b class="text">核桃</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">核桃</b>
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">核桃</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">核桃</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">核桃</b>
								     </span> 
								 </a>
							</div>
							<a href="# "> 
							    <img src="<%=path%>/images/act1.png " />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
								</div> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="<%=path%>/images/6.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>
						<c:forEach items="${sessionScope.list3}" var="item2" varStatus="">

							<div class="am-u-sm-4 text-four">
							<!-- 坚果信息 -->
								<%-- <a href="${item2.website }"> <img src="${item2.path }" /> --%>
								<a href="${url}/intrServlet?goodId=${item2.id}">
								    <img src="${item2.path }" />
									<div class="outer-con ">
										<div class="title ">${item2.name }</div>
										<div class="sub-title ">&yen;${item2.price }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>

						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="<%=path%>/images/7.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>

						<div class="am-u-sm-4 text-four ">
							<a href="# "> 
							<img src="<%=path%>/images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div> 

						<div class="am-u-sm-4 text-four ">
							<a href="# ">
							 <img src="<%=path%>/images/8.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> 
							    <img src="<%=path%>/images/9.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> 
							    <img src="<%=path%>/images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
					</div>
					<div class="clear "></div>
				</div>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><p onclick="javascript:window.open('/shoppingPro/shoppingCart?cmd=showCart')">购物车</p></li>
		<li><a href="<%=path%>/person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>
	<!--菜单 -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="<%=path %>/basic/js/quick_links.js "></script>
</body>
</html>