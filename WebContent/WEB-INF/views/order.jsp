<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理<%=session.getAttribute("aaa102") %></title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
			function deleteOrder(vaab302)
			{
				window.location.href='payOrder.html';
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/delOrderById.html?aab302="+vaab302;
				vform.submit();
			}
				
			function goPay(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goPay.html?aab302="+vaab302;
				vform.submit();
			}
			
			function goOrderDetail(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goOrderDetail.html?aab302="+vaab302;
				vform.submit();
			}
			
			function goComment(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goComment.html?aab302="+vaab302;
				vform.submit();
			}
			function goCommentDetail(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goCommentDetail.html?aab302="+vaab302;
				vform.submit();
			}
		</script>

	</head>

	<body>
		<%double total=0; %>
		<form id="myform" action="<%=path%>/###.html" method="post"></form>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">
<!-- 订单区域1 所有-->
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
															
										<c:choose>
											<c:when test="${rows!=null }">
												<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												
												<c:when test = "${ins.aab303 eq '01' }">
												<div class="order-status1">
													<div class="order-title">
														<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
														<span>提交时间：${ins.aab304 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>	
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>商品id:${ins.aab203 }</p>
																				<p class="info-little">属性1:还没填
																					<br/>属性2:还没填 </p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aab314 }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${ins.aab310 }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
	
																	</div>
																</li>
															</ul>
														</div>
														
														<div class="order-right">
															<li class="td td-amount">
																<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
															    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
															    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
															    <%  total=Double.valueOf((String)request.getAttribute("number"))
															    				*Double.valueOf((String)request.getAttribute("price"))
															    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																<div class="item-amount">
																	合计：<%=total %>
																	<p>含运费：<span>${ins.aab313 }</span></p>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">等待买家付款</p>
																		<p class="order-info"><a href="#">取消订单</a></p>
	
																	</div>
																</li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu" onclick="goPay(${ins.aab302})" >
																		一键支付</div>
																</li>
															</div>
														</div>
	
														</div>
												</div>
												</c:when>
												
												<c:when test="${ins.aab303 eq '02' }">
												<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
													<span>付款时间：${ins.aab305 }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>商品id:${ins.aab203 } </p>
																			<p class="info-little">属性1:尚无
																				<br/>属性2:尚无</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ins.aab314 }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ins.aab310 }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
														    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
														    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
														    <%  total=Double.valueOf((String)request.getAttribute("number"))
														    				*Double.valueOf((String)request.getAttribute("price"))
														    				+Double.valueOf((String)request.getAttribute("transFee")); %>
															<div class="item-amount">
																合计：<%=total %>
																<p>含运费：<span>${ins.aab313 }</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
												</div>
												</c:when>
												
												<c:when test="${ins.aab303 eq '04' }">
												<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
													<span>发货时间：${ins.aab306 }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>商品id:${ins.aab203 }</p>
																			<p class="info-little">属性1:尚无
																				<br/>属性2:尚无</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ins.aab314 }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ins.aab310 }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
															    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
															    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
															    <%  total=Double.valueOf((String)request.getAttribute("number"))
															    				*Double.valueOf((String)request.getAttribute("price"))
															    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																<div class="item-amount">
																	合计：<%=total %>
																	<p>含运费：<span>${ins.aab313 }</span></p>
																</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" onclick="goOrderDetail(${ins.aab302})">
																	确认收货</div>
															</li>
														</div>
													</div>
												</div>

												</div>
												</c:when>
												
												<c:when test="${(ins.aab303 eq '05')||(ins.aab303 eq '06') }">
												<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
													<span>收货时间：${ins.aab307 }</span>

												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>商品id:${ins.aab203 }</p>
																			<p class="info-little">属性1:尚无
																				<br/>属性2:尚无 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ins.aab314 }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ins.aab310 }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
																    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
																    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
																    <%  total=Double.valueOf((String)request.getAttribute("number"))
																    				*Double.valueOf((String)request.getAttribute("price"))
																    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																	<div class="item-amount">
																		合计：<%=total %>
																		<p>含运费：<span>${ins.aab313 }</span></p>
																	</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																</div>
															</li>
															<c:choose>
																<c:when test="${ ins.aab303 eq '05'}">
																<li class="td td-change">
																	<a href="#" onclick="goComment(${ins.aab302})">
																		<div class="am-btn am-btn-danger anniu">
																			去评价
																		</div>
																	</a>
																</li>
																</c:when>
																<c:when test="${ ins.aab303 eq '06'}">
																<li class="td td-change">
																	<a href="#" onclick="goCommentDetail(${ins.aab302})">
																		<div class="am-btn am-btn-danger anniu">
																			去追评
																		</div>
																	</a>
																</li>
																</c:when>
															</c:choose>
															
														</div>
													</div>
												</div>
												</div>
												</c:when>
												
												<c:when test="${ins.aab303 eq '03' }">
												<div class="order-status0">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
													<span>创建时间：${ins.aab304 }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>商品id:${ins.aab203 }</p>
																			<p class="info-little">属性1:尚无
																				<br/>属性2:尚无 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ins.aab314 }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ins.aab310 }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
													</div>
													
													<div class="order-right">
														<li class="td td-amount">
															<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
														    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
														    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
														    <%  total=Double.valueOf((String)request.getAttribute("number"))
														    				*Double.valueOf((String)request.getAttribute("price"))
														    				+Double.valueOf((String)request.getAttribute("transFee")); %>
															<div class="item-amount">
																合计：<%=total %>
																<p>含运费：<span>${ins.aab313 }</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易关闭</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
																	删除订单</div>
															</li>
														</div>
													</div>
												</div>
												</div>	
												
												</c:when>
												
												<c:when test="${(ins.aab303 eq '07')||(ins.aab303 eq '08')||(ins.aab303 eq '09')}">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
														<span>成交时间：${ins.aab305 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>商品id:${ins.aab203 }</p>
																				<p class="info-little">规格1:还没填
																								  <br/>规格2:还没填 </p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aab314 }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${ins.aab310 }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		
																	</div>
																</li>
															</ul>
														</div>
														
														<div class="order-right">
															<li class="td td-amount">
																<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
															    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
															    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
															    <%  total=Double.valueOf((String)request.getAttribute("number"))
															    				*Double.valueOf((String)request.getAttribute("price"))
															    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																<div class="item-amount">
																	合计：<%=total %>
																	<p>含运费：<span>${ins.aab313 }</span></p>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">
																			<c:choose>
																			<c:when test="${ins.aab303 eq '07' }">交易成功</c:when>
																			<c:when test="${ins.aab303 eq '08' }">已售后处理</c:when>
																			<c:when test="${ins.aab303 eq '09' }">已申诉处理</c:when>
																			</c:choose>
																		</p>
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																		<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	</div>
																</li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
																		删除订单</div>
																</li>
															</div>
														</div>
													</div>
												</div>
												</c:when>

												</c:choose>
												</c:forEach>
											</c:when>
										</c:choose>	

										</div>

									</div>

								</div>
<!-- /订单区域 1 所有-->
<!-- 订单区域2 待付款 -->
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
	<!-- 待付款循环体 -->	
										<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aab303 eq '01' }">
													<div class="order-status1">
													<div class="order-title">
														<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
														<span>提交时间：${ins.aab304 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>	
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>商品id:${ins.aab203 }</p>
																				<p class="info-little">属性1:还没填
																					<br/>属性2:还没填 </p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aab314 }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${ins.aab310 }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
	
																	</div>
																</li>
															</ul>
														</div>
														
														<div class="order-right">
															<li class="td td-amount">
																<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
															    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
															    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
															    <%  total=Double.valueOf((String)request.getAttribute("number"))
															    				*Double.valueOf((String)request.getAttribute("price"))
															    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																<div class="item-amount">
																	合计：<%=total %>
																	<p>含运费：<span>${ins.aab313 }</span></p>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">等待买家付款</p>
																		<p class="order-info"><a href="#">取消订单</a></p>
	
																	</div>
																</li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu" onclick="goPay(${ins.aab302})">
																		一键支付</div>
																</li>
															</div>
														</div>
	
														</div>
													</div>
												</c:when>
												</c:choose>
											</c:forEach>
											</c:when>
										</c:choose>
	<!-- /待付款循环体 -->										
											
											
											
										</div>

									</div>
								</div>
<!-- /订单区域2 待付款 -->
<!-- 订单区域3 待发货 -->
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top"> 
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td> 
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
	<!-- 待发货循环体 -->										
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${ins.aab303 eq '02' }">
													<div class="order-status2">
													<div class="order-title">
														<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
														<span>付款时间：${ins.aab305 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>商品id:${ins.aab203 } </p>
																				<p class="info-little">属性1:尚无
																					<br/>属性2:尚无</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aab314 }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${ins.aab310 }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		<a href="refund.html">退款</a>
																	</div>
																</li>
															</ul>
														</div>
													
														<div class="order-right">
															<li class="td td-amount">
																<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
															    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
															    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
															    <%  total=Double.valueOf((String)request.getAttribute("number"))
															    				*Double.valueOf((String)request.getAttribute("price"))
															    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																<div class="item-amount">
																	合计：<%=total %>
																	<p>含运费：<span>${ins.aab313 }</span></p>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">买家已付款</p>
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																	</div>
																</li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">
																		提醒发货</div>
																</li>
															</div>
														</div>
													</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>
	<!-- /待发货循环体 -->
										</div>
									</div>
								</div>
<!-- /订单区域3 待发货 -->
<!-- 订单区域4 待收货 -->
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${ins.aab303 eq '04' }">
													<div class="order-status3">
														<div class="order-title">
															<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
															<span>发货时间：${ins.aab306 }</span>
															<!--    <em>店铺：小桔灯</em>-->
														</div>
														<div class="order-content">
															<div class="order-left">
																<ul class="item-list">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint">
																				<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																			</a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>商品id:${ins.aab203 }</p>
																					<p class="info-little">属性1:尚无
																						<br/>属性2:尚无</p>
																				</a>
																			</div>
																		</div>
																	</li>
																	<li class="td td-price">
																		<div class="item-price">
																			${ins.aab314 }
																		</div>
																	</li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${ins.aab310 }
																		</div>
																	</li>
																	<li class="td td-operation">
																		<div class="item-operation">
																			<a href="refund.html">退款/退货</a>
																		</div>
																	</li>
																</ul>
															</div>
															
															<div class="order-right">
																<li class="td td-amount">
																	<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
																    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
																    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
																    <%  total=Double.valueOf((String)request.getAttribute("number"))
																    				*Double.valueOf((String)request.getAttribute("price"))
																    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																	<div class="item-amount">
																		合计：<%=total %>
																		<p>含运费：<span>${ins.aab313 }</span></p>
																	</div>
																</li>
																<div class="move-right">
																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">卖家已发货</p>
																			<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																			<p class="order-info"><a href="logistics.html">查看物流</a></p>
																			<p class="order-info"><a href="#">延长收货</a></p>
																		</div>
																	</li>
																	<li class="td td-change">
																		<div class="am-btn am-btn-danger anniu" onclick="goOrderDetail(${ins.aab302})">
																			确认收货</div>
																	</li>
																</div>
															</div>
														</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>
											
										</div>
									</div>
								</div>
<!-- /订单区域4 待收货-->
<!-- 订单区域5 待评价-->
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${(ins.aab303 eq '05')||(ins.aab303 eq '06') }">
													<div class="order-status4">
													<div class="order-title">
														<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div>
														<span>收货时间：${ins.aab307 }</span>
	
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>商品id:${ins.aab203 }</p>
																				<p class="info-little">属性1:尚无
																					<br/>属性2:尚无 </p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aab314 }
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${ins.aab310 }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		<a href="refund.html">退款/退货</a>
																	</div>
																</li>
															</ul>
	
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
																	    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
																	    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
																	    <%  total=Double.valueOf((String)request.getAttribute("number"))
																	    				*Double.valueOf((String)request.getAttribute("price"))
																	    				+Double.valueOf((String)request.getAttribute("transFee")); %>
																		<div class="item-amount">
																			合计：<%=total %>
																			<p>含运费：<span>${ins.aab313 }</span></p>
																		</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">交易成功</p>
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">订单详情</a></p>
																		<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	</div>
																</li>
																<c:choose>
																	<c:when test="${ ins.aab303 eq '05'}">
																	<li class="td td-change">
																		<a href="#" onclick="goComment(${ins.aab302})">
																			<div class="am-btn am-btn-danger anniu">
																				去评价
																			</div>
																		</a>
																	</li>
																	</c:when>
																	<c:when test="${ ins.aab303 eq '06'}">
																	<li class="td td-change">
																		<a href="#" onclick="goCommentDetail(${ins.aab302})">
																			<div class="am-btn am-btn-danger anniu">
																				去追评
																			</div>
																		</a>
																	</li>
																	</c:when>
																</c:choose>
															</div>
														</div>
														</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>	
											
											
											
											
										</div>
									</div>
								</div>
<!-- /订单区域5 -->
							</div>

						</div>
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