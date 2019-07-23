<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>${info.aac203 }-服务详情</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="<%=path%>/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/localCity/style.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/localCity/serviceDetail.css" rel="stylesheet" />
		<link href="${path }/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="<%=path%>/basic/js/quick_links.js"></script>
		<script type="text/javascript" src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="<%=path%>/js/list.js"></script>
	</head>
	<body>
		<!--顶部导航条 -->
		<%@include file="/localCity/navigate.jsp" %>
		<!--悬浮搜索框-->
		<%@include file="/localCity/navSearch.jsp" %>
		<div class="clear"></div>
        <b class="line"></b>
			<div class="listMain">
				<!--分类-->
			<div class="nav-table">
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
					<ul>
						<li class="index"><a href="#">首页</a></li>
                              <li class="qc"><a href="#">闪购</a></li>
                              <li class="qc"><a href="#">限时抢</a></li>
                              <li class="qc"><a href="#">团购</a></li>
                              <li class="qc last"><a href="#">大包装</a></li>
					</ul>
				    <div class="nav-extra">
				    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
				    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				    </div>
				</div>
			</div>
			<ol class="am-breadcrumb am-breadcrumb-slash">
				<li><a href="/localCity/home.heml">首页</a></li>
				<li><a href="/localCity/search.html">分类</a></li>
				<li class="am-active">${info.servicetype}</li>
			</ol>
			<script type="text/javascript">
				$(function() {
					$('.flexslider').flexslider({
						animation: "slide",
						start: function(slider) {
							$('body').removeClass('loading');
						}
					});
				});
				$(window).load(function() {
					
				});
			</script>
			<div class="scoll">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
						<%-- 
							<li>
								<img src="<%=path%>/images/01.jpg" title="pic" />
							</li>
							<li>
								<img src="<%=path%>/images/02.jpg" />
							</li>
							<li>
								<img src="<%=path%>/images/03.jpg" />
							</li>--%>
						<c:forEach items="${imgList }" var="img" varStatus="i">
						<c:if test="${i.count==1 }">
						    <li>
								<img src="<%=path%>${img}" title="pic" />
							</li>
						</c:if>
						<c:if test="${i.count!=1 }">
						    <li>
								<img src="<%=path%>${img}" />
							</li>
						</c:if>
						</c:forEach>
						</ul>
					</div>
				</section>
			</div>
				<!--放大镜-->
				<div class="item-inform">
					<div class="clearfixRight">
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>${info.aac203 }</h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="service-info">
								<div class="itemInfo">
									<p class="item_title">类&emsp;别:</p>
									<p class="pname"><b class="item_info">${info.servicetype }</b> </p>                                 
								</div>
								<div class="itemInfo">
									<p class="item_title">服务方式:</p>
									<p class="pname"><b class="item_info">${info.servicemethod }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">联系方式:</p>
									<p class="pname"><b class="item_info">电话:${info.aac209 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">地&emsp;址:</p>
									<p class="pname"><b class="item_info">${info.aac104 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">服务描述:</p>
									<p class="pname"><b class="item_info">${info.aac207 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">服务价格:</p>
									<p><b class="item_info">${info.aac206 }元</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">公司名称:</p>
									<p style="margin-right: 20px;"><b class="item_info">${info.aac103 }</b></p>	
									<p onclick="location.href='<%=path %>/localCity/companyDetail.html?id=${info.aac102}'" class="item_pag">进入公司主页</p>								
								</div>
								<div class="itemInfo">
									<p class="item_title">综合评分:</p>
									<p><b class="item_info">${info.aac110 }</b></p>									
								</div>
								<div class="clear"></div>
							</div>
							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">1015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">6015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
						<div class="pay">
							<div class="pay-opt">
							<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" onclick="">立即下单</a>
								</div>
							</li>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<!-- introduce-->
				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>		    
						     	<div class="mt">
						            <h2>看了又看</h2>        
					            </div>
							      <li class="first">
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                 
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子218g】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#"><span class="index-needs-dt-txt">全部评价</span></a>
								</li>
								<li>
									<a href="#"><span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active">
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>${grade*10000/100.0 }<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                       			<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                       			<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                       			<q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                       			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                       			<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                       			<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                       			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                       			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                       			<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(${AllComment })</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>
									<ul class="am-comments-list am-comments-list-flip">
									<%-- 
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>--%>
										<c:forEach items="${comments }" var="comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/no-img_mid_.jpg" />
												<!-- 评论者头像 -->
											</a>
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${comment.aaa103} (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">${comment.aac505 }</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${comment.aac503 }
														</div>
														<div class="tb-r-act-bar">
															服务评分：${comment.aac507}
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										</c:forEach>
									</ul>
									<div class="clear"></div>
									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<c:if test="${AllComment==0}">	
											<li class="am-disabled"><a href="#">&laquo;</a></li>
											<li class="am-active"><a href="#">1</a></li>	
											<li><a href="#">&raquo;</a></li>
										</c:if>
										<c:if test="${AllComment!=0}">
											<li class="am-disabled"><a href="#">&laquo;</a></li>
										<c:forEach begin="1" end="${(AllComment-1)/12+1}" varStatus="i">
										<c:if test="${i.count==1 }">
											<li class="am-active"><a href="#">1</a></li>
										</c:if>
										<c:if test="${i.count!=1 }">
											<li><a href="#">${i.count}</a></li>
										</c:if>
										</c:forEach>
											<li><a href="#">&raquo;</a></li>
										</c:if>
										<%-- 
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>--%>
									</ul>
									<div class="clear"></div>
									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<%@include file="/footer.jsp" %>
					</div>

				</div>
			</div>
			<!--菜单 -->
			<%@include file="/rMenu.jsp" %>
	</body>
</html>