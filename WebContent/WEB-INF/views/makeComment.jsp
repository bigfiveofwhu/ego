<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#comment1 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab409"]').val(p);
					$("#point1").text(p);
				});
				
				$("#comment2 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab411"]').val(p);
					$("#point2").text(p);
				});
				
				$("#comment3 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab410"]').val(p);
					$("#point3").text(p);
					
				});
	    	 })
	    	function sendComment(vaab302)
			{
				var vform = document.getElementById("myform");
				$('input[name="aab403"]').val($("#comment_text").val());
				vform.action="<%=path%>/makeComment.html?aab302="+vaab302;
				vform.submit();
			}
		</script>
		
	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post" >
		<!-- input name="aaa102"  value="<%=session.getAttribute("aaa102") %>" type="hidden"/-->
		<input name="aab409" type="hidden"/>
		<input name="aab411" type="hidden"/>
		<input name="aab410" type="hidden"/>
		<input name="aab403" type="hidden"/>
		<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		<input name="aab412" value="02" type="hidden"/>
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
									<a href="#" target="_top" class="h">session中用户id:${aaa102 }</a>
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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">物流评价</p>
										</a>
									</div>
								</div>
								<div id="comment1" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point1" >0</span>分</div>
								</div> 
								
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">服务评价</p>
										</a>
									</div>
								</div>
								<div id="comment2" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point2" >0</span>分</div>
								</div>
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">商品评价</p>
										</a>
									</div>
								</div>
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="<%=path%>/images/comment.jpg_400x400.jpg" class="itempic">
									</a>
								</div>
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">商品id:${ins.aab203 }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>订单号:${ins.aab302 }</span>
											<span>属性2:尚无</span>
										</div>
										<div class="item-price">
											价格：<strong>${ins.aab314 }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<hr/>
								
								
								
								
								<div class="item-comment">
									<textarea id="comment_text" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								<div class="filePic">
									<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*" >
									<span>晒照片(0/5)</span>
									<img src="<%=path%>/images/image.jpg" alt="">
								</div>
								
								<div id="comment3" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point3" >0</span>分</div>
								</div> 

							</div>

							<div class="info-btn" onclick="sendComment(${ins.aab302})">
								<div class="am-btn am-btn-danger">发表评论</div>
							</div>
							<%int point=0; %>
														
										
					
												
							
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