<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的足迹</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/footstyle.css" rel="stylesheet" type="text/css">

	</head>
	
	<Script type="text/javascript">
		function delHistory(vaaa701)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/delHistory.html?aaa701="+vaaa701;
			vform.submit();
		}
	</Script>
	<body>
		<form id="myform" action="###.html" method="post">
		
		</form>
		<%
		//获取今天日期
		java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();
		String today = formatter1.format(currentTime); 
		request.setAttribute("today", today);
		//获取昨天日期
		java.util.Calendar c1 = java.util.Calendar.getInstance();
		c1.add(java.util.Calendar.DAY_OF_MONTH, -1);
		java.text.SimpleDateFormat formatter2 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String yesterday = formatter2.format(c1.getTime());
		request.setAttribute("yesterday", yesterday);
		//获取上周日期
		java.util.Calendar c2 = java.util.Calendar.getInstance();
		c2.add(java.util.Calendar.DAY_OF_MONTH, -7);
		java.text.SimpleDateFormat formatter3 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String lastWeek = formatter2.format(c2.getTime());
		request.setAttribute("lastWeek", lastWeek);
		//获取上月日期
		java.util.Calendar c3 = java.util.Calendar.getInstance();
		c3.add(java.util.Calendar.DAY_OF_MONTH, -30);
		java.text.SimpleDateFormat formatter4 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String lastMonth = formatter3.format(c3.getTime());
		request.setAttribute("lastMonth", lastMonth);
		 %>
		<!--头 -->
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录<%=session.getAttribute("aaa102") %></a>
									<a href="#" target="_top">免费注册</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=path%>/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
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
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-foot">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>
						
						<%int dayCount=0; %>
						<!--足迹列表 -->
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${ins.aaa702 eq today }">
							<div class="goods">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if (dayCount==0){ %>
									<span><i class="date-desc">今天</i></span>
									<del class="am-icon-trash"></del>
									<%} %>
									<%dayCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
											<a class="goods-pic-link" target="_blank" href="#" title="${ins.aab202 }">
												<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
										</div>
										<a class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="#" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="#" class="match-recom-item">找相似</a>
												<a href="#" class="match-recom-item">找搭配</a>
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int yesterdayCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${ins.aaa702 eq yesterday }">
							<div class="goods">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(yesterdayCount==0){ %>
									<span><i class="date-desc">昨天</i></span>
									<del class="am-icon-trash"></del>
									<%} %>
									<%yesterdayCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
											<a class="goods-pic-link" target="_blank" href="#" title="${ins.aab202 }">
												<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
										</div>
										<a class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="#" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="#" class="match-recom-item">找相似</a>
												<a href="#" class="match-recom-item">找搭配</a>
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int weekCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${(ins.aaa702 ge lastWeek)&&(ins.aaa702 lt yesterday) }">
							<div class="goods">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(weekCount==0){ %>
									<span><i class="date-desc">一周内</i></span>
									<del class="am-icon-trash"></del>
									<%} %>
									<%weekCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
											<a class="goods-pic-link" target="_blank" href="#" title="${ins.aab202 }">
												<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
										</div>
										<a class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="#" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="#" class="match-recom-item">找相似</a>
												<a href="#" class="match-recom-item">找搭配</a>
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int monthCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${(ins.aaa702 ge lastMonth)&&(ins.aaa702 lt lastWeek)  }">
							<div class="goods">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(monthCount==0){ %>
									<span><i class="date-desc">一月内</i></span>
									<del class="am-icon-trash"></del>
									<%} %>
									<%monthCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
											<a class="goods-pic-link" target="_blank" href="#" title="${ins.aab202 }">
												<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
										</div>
										<a class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="#" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="#" class="match-recom-item">找相似</a>
												<a href="#" class="match-recom-item">找搭配</a>
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
					</div>
				</div>

				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>&copy; 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">地址管理</a></li>
							<li> <a href="cardlist.html">快捷支付</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a href="points.html">我的积分</a></li>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="walletlist.html">账户余额</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="consultation.html">商品咨询</a></li>
							<li> <a href="suggest.html">意见反馈</a></li>							
							
							<li> <a href="news.html">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>