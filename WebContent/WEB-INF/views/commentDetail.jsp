<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>评价详情</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
			function sendComment2(vaab302)
			{
				var vform = document.getElementById("myform");
				if($("#comment2_text").val()==""){
						alert("还没有填写追评哦");
					}
				else{
					$('input[name="aab404"]').val($("#comment2_text").val());
					vform.action="<%=path%>/makeComment2.html?aab302="+vaab302;
					vform.submit();
				}
			}
			
			function delComment(vaab302)
			{
				var message=confirm("确定要删除评价吗?这将永远无法恢复!")
				if(message==true){
					var vform = document.getElementById("myform");
					vform.action="<%=path%>/delComment.html?aab302="+vaab302;
					vform.submit();
				}
				
			}
			
		</script>
	</head>

	<body>
		<form id="myform" method="post">
			<input name="aab404" value="" type="hidden"/>
			<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		</form>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录<%=session.getAttribute("aab102") %></a>
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

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价详情</strong> / <small>Comment&nbsp;Detail</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
					
							<div class="comment-main">
								<div class="comment-list">
									<ul class="item-list">

										
										<div class="comment-top">
											<div class="th th-price">
												<td class="td-inner">初次评价</td>
											</div>
											<div class="th th-item">
												<td class="td-inner">商品</td>
											</div>													
										</div>
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint">
														<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic">
													</a>
												</div>
											</li>											
											
											<li class="td td-comment">
												<div class="item-title">
													
													<div class="item-name">
														<a href="#">
															<p class="item-basic-info" align="center">${ins.aab202 }</p>
														</a>
													</div>
												</div>
												<div class="item-comment">
													<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">${ins.aab403 }</a>
													<br/>
													<div class="item-opinion" style="width:60%">物流评价:${ins.aab409 }分</div>
													<div class="item-opinion" style="width:60%">服务评价:${ins.aab411 }分</div>
													<div class="item-opinion" style="width:60%">商品评价:${ins.aab410 }分</div>
													<c:choose>
													<c:when test="${ins.aab412 eq '01' }">
														<div class="filePic"><img src="<%=path%>/images/image.jpg" alt=""></div>	
													</c:when>
													</c:choose>
												
												</div>

												<div class="item-info">
													<div>
														<p class="info-little">
														<span>订单号:<br/>${ins.aab302 }</span> 
														</p>
														<p class="info-time">${ins.aab406 }</p>

													</div>
												</div>
											</li>

									</ul>

								</div>
							</div>
							<hr/>
							<br/><br/>
							
							
							<c:choose>
								<c:when test="${ins.aab404!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">我的追评</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
													${ins.aab404 }
													<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab407 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose>
								<c:when test="${ins.aab405!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">商家回复</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
														${ins.aab405 }
														<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab408 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose> 
								<c:when test="${ins.aab404==null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
		
												
												<div class="comment-top" >
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">追加评价</td>
													</div>										
												</div>
												
																			
													
													<li class="td td-comment" style="position:relative;">
													<textarea style="width:80%;height:200px;left:0;" id="comment2_text" placeholder="在这里输入您的追加评价!"></textarea>			
													<br/><br/>
													<a href="#" onclick="sendComment2(${ins.aab302})">
													<div class="am-btn am-btn-danger anniu" style="position:absolute;right:50px;bottom:5px;">
														追加评价		
													</div>
													</a>
													</li>
		
											</ul>
		
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							<a href="#" onclick="delComment(${ins.aab302})">
							<div class="am-btn am-btn-danger anniu" style="float:right;">
								删除评价							
							</div>
							</a>
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