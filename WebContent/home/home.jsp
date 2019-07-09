<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>eGo首页</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="../css/skin.css" rel="stylesheet" type="text/css" />

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>
<body>
	<div class="hmtop">
		<%--顶部导航条 --%>
		<%@include file="/navigate.jsp" %>
		<%--悬浮搜索框 --%>
		<div class="nav white">
		<div class="logo">
			<img src="../images/logo.png" />
		</div>
		<div class="logoBig">
			<li>
			<img src="../images/logobig.png" />
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
			<a href="introduction.html"><img src="../images/ad1.jpg" /></a>
			</li>
			<li class="banner2">
			<a><img src="../images/ad2.jpg" /> </a>
			</li>
			<li class="banner3">
			<a><img src="../images/ad3.jpg" /> </a>
			</li>
			<li class="banner4">
			<a><img src="../images/ad4.jpg" /> </a>
			</li>
			<li class="banner5">
			<a><img src="../images/ad4.jpg" /> </a>
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
								<li class="appliance js_toggle relative first">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/cake.png"> </i>
											<a class="ml-22" title="点心">点心/蛋糕</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">蛋糕</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">点心</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>

													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="呵官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">呵官方旗舰店</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
																	rel="nofollow"><span>格瑞旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																	href="#" rel="nofollow"><span class="red">飞彦大厂直供</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																	href="#" rel="nofollow"><span>红e·艾菲妮</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
																	rel="nofollow"><span class="red">本真旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="杭派女装批发网" target="_blank"
																	href="#" rel="nofollow"><span class="red">杭派女装批发网</span>
																</a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/cookies.png"> </i><a
												class="ml-22" title="饼干、膨化">饼干/膨化</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="饼干">饼干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="薯片">薯片</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">虾条</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="YYKCLOT" target="_blank"
																	href="#" rel="nofollow"><span class="red">YYKCLOT</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="池氏品牌男装" target="_blank"
																	href="#" rel="nofollow"><span class="red">池氏品牌男装</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="男装日志" target="_blank" href="#"
																	rel="nofollow"><span>男装日志</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>索比诺官方旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="onTTno傲徒" target="_blank"
																	href="#" rel="nofollow"><span class="red">onTTno傲徒</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="玛狮路男装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>玛狮路男装旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="劳威特品牌男装" target="_blank"
																	href="#" rel="nofollow"><span>劳威特品牌男装</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																	href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span>
																</a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/meat.png"> </i><a class="ml-22"
												title="熟食、肉类">熟食/肉类</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="猪肉脯">猪肉脯</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="牛肉丝">牛肉丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="小香肠">小香肠</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
																	rel="nofollow"><span class="red">花颜巧语 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																	rel="nofollow"><span>糖衣小屋</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡拉迪克  " target="_blank"
																	href="#" rel="nofollow"><span class="red">卡拉迪克
																</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="暖春童话 " target="_blank" href="#"
																	rel="nofollow"><span>暖春童话 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																	href="#" rel="nofollow"><span>华盛童装批发行 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>奈仕华童装旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																	href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="猫儿朵朵 " target="_blank" href="#"
																	rel="nofollow"><span>猫儿朵朵 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																	rel="nofollow"><span class="red">童衣阁</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/bamboo.png"> </i><a
												class="ml-22" title="素食、卤味">素食/卤味</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="豆干">豆干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="干笋">干笋</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="鸭脖">鸭脖</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																	href="#" rel="nofollow"><span>爱丝蓝内衣厂</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																	href="#" rel="nofollow"><span>香港优蓓尔防辐射</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																	href="#" rel="nofollow"><span>蓉莉娜内衣批发</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/nut.png"> </i><a class="ml-22"
												title="坚果、炒货">坚果/炒货</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">坚果</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">锅巴</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="呵呵嘿官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">呵呵嘿官方旗舰店</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
																	rel="nofollow"><span>格瑞旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																	href="#" rel="nofollow"><span class="red">飞彦大厂直供</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																	href="#" rel="nofollow"><span>红e·艾菲妮</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
																	rel="nofollow"><span class="red">本真旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="杭派女装批发网" target="_blank"
																	href="#" rel="nofollow"><span class="red">杭派女装批发网</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="华伊阁旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>华伊阁旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="独家折扣旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>独家折扣旗舰店</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/candy.png"> </i><a class="ml-22"
												title="糖果、蜜饯">糖果/蜜饯</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="糖果">糖果</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蜜饯">蜜饯</span>
															</dt>
															<dd>
																<a title="猕猴桃干" href="#"><span>猕猴桃干</span> </a>
															</dd>
															<dd>
																<a title="糖樱桃" href="#"><span>糖樱桃</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="YYKCLOT" target="_blank"
																	href="#" rel="nofollow"><span class="red">YYKCLOT</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="池氏品牌男装" target="_blank"
																	href="#" rel="nofollow"><span class="red">池氏品牌男装</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="男装日志" target="_blank" href="#"
																	rel="nofollow"><span>男装日志</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>索比诺官方旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="onTTno傲徒" target="_blank"
																	href="#" rel="nofollow"><span class="red">onTTno傲徒</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																	href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span>
																</a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/chocolate.png"> </i><a
												class="ml-22" title="巧克力">巧克力</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">巧克力</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">果冻</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
																	rel="nofollow"><span class="red">花颜巧语 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																	rel="nofollow"><span>糖衣小屋</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡拉迪克  " target="_blank"
																	href="#" rel="nofollow"><span class="red">卡拉迪克
																</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="暖春童话 " target="_blank" href="#"
																	rel="nofollow"><span>暖春童话 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																	href="#" rel="nofollow"><span>华盛童装批发行 </span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>奈仕华童装旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																	href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																	rel="nofollow"><span class="red">童衣阁</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/fish.png"> </i><a class="ml-22"
												title="海味、河鲜">海味/河鲜</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="海带丝">海带丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="小鱼干">小鱼干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="鱿鱼丝">鱿鱼丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span>
																</a>
															</dd>
															<dd>
																<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																	href="#" rel="nofollow"><span>爱丝蓝内衣厂</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="炫点服饰" target="_blank" href="#"
																	rel="nofollow"><span>炫点服饰</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="雪茵美内衣厂批发" target="_blank"
																	href="#" rel="nofollow"><span>雪茵美内衣厂批发</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="金钻夫人" target="_blank" href="#"
																	rel="nofollow"><span>金钻夫人</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="伊美莎内衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">伊美莎内衣</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="粉客内衣旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>粉客内衣旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="泽芳行旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>泽芳行旗舰店</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="彩婷" target="_blank" href="#"
																	rel="nofollow"><span class="red">彩婷</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="黛兰希" target="_blank" href="#"
																	rel="nofollow"><span>黛兰希</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																	href="#" rel="nofollow"><span>香港优蓓尔防辐射</span> </a>
															</dd>
															<dd>
																<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																	href="#" rel="nofollow"><span>蓉莉娜内衣批发</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/tea.png"> </i><a class="ml-22"
												title="花茶、果茶">花茶/果茶</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">蛋糕</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">点心</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a title="今生只围你" target="_blank" href="#" rel="nofollow"><span>今生只围你</span>
																</a>
															</dd>
															<dd>
																<a title="忆佳人" target="_blank" href="#" rel="nofollow"><span
																	class="red">忆佳人</span> </a>
															</dd>
															<dd>
																<a title="斐洱普斯" target="_blank" href="#" rel="nofollow"><span
																	class="red">斐洱普斯</span> </a>
															</dd>
															<dd>
																<a title="聚百坊" target="_blank" href="#" rel="nofollow"><span
																	class="red">聚百坊</span> </a>
															</dd>
															<dd>
																<a title="朵朵棉织直营店" target="_blank" href="#"
																	rel="nofollow"><span>朵朵棉织直营店</span> </a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b></li>
								<li class="appliance js_toggle relative last">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="../images/package.png"> </i><a
												class="ml-22" title="品牌、礼包">品牌/礼包</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="大包装">大包装</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="两件套">两件套</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span> </a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span> </a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span> </a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span> </a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span> </a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span> </a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span> </a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span> </a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span> </a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a title="琳琅鞋业" target="_blank" href="#" rel="nofollow"><span>琳琅鞋业</span>
																</a>
															</dd>
															<dd>
																<a title="宏利鞋业" target="_blank" href="#" rel="nofollow"><span>宏利鞋业</span>
																</a>
															</dd>
															<dd>
																<a title="比爱靓点鞋业" target="_blank" href="#"
																	rel="nofollow"><span>比爱靓点鞋业</span> </a>
															</dd>
															<dd>
																<a title="浪人怪怪" target="_blank" href="#" rel="nofollow"><span>浪人怪怪</span>
																</a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div></li>
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
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>



			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="../images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">

					<ul>
						<li class="title-first"><a target="_blank" href="#"> <img
								src="../images/TJ2.jpg"></img> <span>[特惠]</span>商城爆品1分秒 </a>
						</li>
						<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
								<img src="../images/TJ.jpg"></img>
								<p>XXXXXXXXXXXXXXXXXX</p> </a>
						</li>

						<div class="mod-vip">
						
						<c:choose>
						<c:when test="${USER_IN_SESSION==null}">
					
							<div class="m-baseinfo">
								<a href="#"> <img
									src="../images/getAvatar.do.jpg"> </a> <em> Hi,<span
									class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="login.jsp">登录</a> <a
									class="am-btn-warning btn" href="register.jsp">注册</a>
							</div>
						</c:when>
						
							<c:when test="${USER_IN_SESSION!=null}">
				   				<div class="m-baseinfo">
								<a href="../person/information.jsp"> <img
									src="../images/getAvatar.do.jpg"> </a> <em> Hi,<span
									class="s-name">${USER_IN_SESSION.username}</span> <a href="#"><p>点击更多优惠活动</p> </a> </em>
							</div>
							</c:when>
						</c:choose>
						
						
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>

						<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a>
						</li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a>
						</li>
						<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
								买1送1！</a>
						</li>

					</ul>
					<div class="advTip">
						<img src="../images/advTip.jpg" />
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
    <iframe id="google_ads_frame3" name="google_ads_frame3" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1341152667756824&amp;output=html&amp;h=90&amp;slotname=5754098212&amp;adk=1811165632&amp;adf=3847671124&amp;w=728&amp;lmt=1562068081&amp;guci=2.2.0.0.2.2.0.0&amp;format=728x90&amp;url=https%3A%2F%2Fconvertio.co%2Fzh%2Fpng-svg%2F&amp;flash=0&amp;wgl=1&amp;dt=1562068081169&amp;bpp=17&amp;bdt=307&amp;fdt=18&amp;idt=18&amp;shv=r20190626&amp;cbv=r20190131&amp;saldr=aa&amp;abxe=1&amp;prev_fmts=728x90%2C728x90&amp;correlator=7564648527725&amp;frm=20&amp;pv=1&amp;ga_vid=1553896000.1562067597&amp;ga_sid=1562068081&amp;ga_hid=2108996575&amp;ga_fc=0&amp;iag=0&amp;icsg=41130&amp;dssz=13&amp;mdo=0&amp;mso=0&amp;u_tz=480&amp;u_his=3&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=588&amp;ady=926&amp;biw=1903&amp;bih=888&amp;scr_x=0&amp;scr_y=0&amp;eid=21060853%2C368226351%2C368226361%2C633794000%2C633794002&amp;oid=3&amp;ref=https%3A%2F%2Fconvertio.co%2Fzh%2Fimage-converter%2F&amp;rx=0&amp;eae=0&amp;fc=656&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1920%2C888&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=24&amp;bc=31&amp;osw_key=2046013984&amp;ifi=3&amp;uci=3.8obyei4cvcy4&amp;fsb=1&amp;xpc=njCIeAerN8&amp;p=https%3A//convertio.co&amp;dtd=27" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="3.8obyei4cvcy4" data-google-query-id="CPrY4YiVluMCFdMlrQYd1s4Msg" data-load-complete="true"></iframe>
            
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="../images/2016.png "></img>
					<p>
						今日<br>推荐
					</p>
				</div>
				<!-- <div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>真的有鱼</h3>
						<h4>开年福利篇</h4>
					</div>
					<div class="recommendationMain one">
						<a href="introduction.html"><img src="../images/tj.png "></img>
						</a>
					</div>
				</div> -->
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

					<!--   <div class="am-u-sm-3 ">
							<div class="icon-sale one"></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="../images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>													
						</div> -->

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
								<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a>
								<a href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
							</div>
							<span class="more "> <a href="# ">更多美味<i
									class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
						</div>
					</div>

					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
								<a class="outer" href="#"><span class="inner"><b
										class="text">核桃</b> </span> </a> <a class="outer" href="#"><span
									class="inner"><b class="text">核桃</b> </span> </a> <a class="outer"
									href="#"><span class="inner"><b class="text">核桃</b>
								</span> </a> <a class="outer" href="#"><span class="inner"><b
										class="text">核桃</b> </span> </a> <a class="outer" href="#"><span
									class="inner"><b class="text">核桃</b> </span> </a> <a class="outer"
									href="#"><span class="inner"><b class="text">核桃</b>
								</span> </a>
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">开抢啦！</div>
									<div class="sub-title ">零食大礼包</div>
								</div> <img src="../images/act1.png " /> </a>
							<div class="triangle-topright"></div>
						</div>

						<!-- 	<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="../images/2.jpg" /> </a>
						</div>
						
						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="../images/2.jpg" /> </a>
						</div> -->

						<c:forEach items="${sessionScope.list2}" var="item1" varStatus="">

							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">${item1.name }</div>
									<div class="sub-title ">¥${item1.price }</div>
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
								<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
									href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
							</div>
							<span class="more "> <a href="# ">更多美味<i
									class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<a class="outer" href="#"><span class="inner"><b
										class="text">核桃</b> </span> </a> <a class="outer" href="#"><span
									class="inner"><b class="text">核桃</b> </span> </a> <a class="outer"
									href="#"><span class="inner"><b class="text">核桃</b>
								</span> </a> <a class="outer" href="#"><span class="inner"><b
										class="text">核桃</b> </span> </a> <a class="outer" href="#"><span
									class="inner"><b class="text">核桃</b> </span> </a> <a class="outer"
									href="#"><span class="inner"><b class="text">核桃</b>
								</span> </a>
							</div>
							<a href="# "> <img src="../images/act1.png " />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
								</div> </a>
							<div class="triangle-topright"></div>
						</div>
						<!-- 	<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="../images/6.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div> -->


						<c:forEach items="${sessionScope.list3}" var="item2" varStatus="">

							<div class="am-u-sm-4 text-four">
							<!-- 坚果信息 -->
								<%-- <a href="${item2.website }"> <img src="${item2.path }" /> --%>
								<a href="${url}/intrServlet?goodId=${item2.id}"><img src="${item2.path }" />
									<div class="outer-con ">
										<div class="title ">${item2.name }</div>
										<div class="sub-title ">¥${item2.price }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div> </a>
							</div>

						</c:forEach>

						<!-- 		<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="../images/7.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>

						<div class="am-u-sm-4 text-four ">
							<a href="# "> <img src="../images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div> -->

						<!-- 	<div class="am-u-sm-4 text-four ">
							<a href="# "> <img src="../images/8.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="../images/9.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="../images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">雪之恋和风大福</div>
									<div class="sub-title ">¥13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>
 -->
					</div>

					<div class="clear "></div>
				</div>






				<div class="footer ">
					<div class="footer-hd ">
						<p>
							<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
								href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
						</p>
					</div>
					<div class="footer-bd ">
						<p>
							<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
							<a href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</a> </em>
						</p>
					</div>
				</div>

			</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home.html"><i
					class="am-icon-home "></i>首页</a>
			</li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a>
			</li>
			<li><p onclick="javascript:window.open('/shoppingPro/shoppingCart?cmd=showCart')">购物车</p>
			</li>
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a>
			</li>
		</div>
		
		<!--菜单 -->
		<%@include file="/rMenu.jsp" %>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>

</html>