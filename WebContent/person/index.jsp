<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>个人中心</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/vipstyle.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/hmstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>
	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<%@ include file="/navigate.jsp" %>
					<!--悬浮搜索框-->
					<%@include file="/navSearch.jsp" %>
					<div class="clear"></div>
				</div>
			</article>
		</header>
		<div class="nav-table">
			<%@include file="/navClassify.jsp" %>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
				<!--标题 -->
				<div class="am-cf am-padding">
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="<%=path %>/person/home.jsp"></iframe>
			    </div>								
				</div>
				<!--底部-->
				<%@ include file="/footer.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="<%=path %>/person/index.jsp" target="iframe"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="showUserInfo.html" target="iframe">个人信息</a></li>
							<li> <a href="<%=path%>/person/safety.jsp" target="iframe">安全设置</a></li>
							<li> <a href="showAddress.html" target="iframe">地址管理</a></li>
							<li> <a href="<%=path%>/person/cardlist.jsp" target="iframe">快捷支付</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="<%=path %>/person/order.jsp" target="iframe">订单管理</a></li>
							<li> <a href="<%=path %>/person/change.jsp" target="iframe">退款售后</a></li>
							<li> <a href=javascript:void(0); target="iframe">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a href="<%=path %>/person/points.jsp" target="iframe">我的积分</a></li>
							<li> <a href="<%=path %>/discount/getCustomerCoupons.html" target="iframe">优惠券 </a></li>
							<li> <a href="<%=path %>/person/bonus.jsp" target="iframe">红包</a></li>
							<li> <a href="<%=path %>/person/walletlist.jsp" target="iframe">账户余额</a></li>
							<li> <a href="<%=path %>/person/bill.jsp" target="iframe">账单明细</a></li>
							<li> <a href="<%=path %>/advertise/showAccount.html" target="iframe">广告账户</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="<%=path %>/person/collection.jsp" target="iframe">收藏</a></li>
							<li> <a href="<%=path %>/person/foot.jsp" target="iframe">足迹</a></li>														
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="<%=path %>/person/consultation.jsp" target="iframe">商品咨询</a></li>
							<li> <a href="<%=path %>/person/suggest.jsp" target="iframe">意见反馈</a></li>							
							
							<li> <a href="<%=path %>/person/news.jsp" target="iframe">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>
		<!--引导 -->
		<%@include file="/bottomGuide.jsp" %>
	</body>
	<script type="text/javascript">
	function SetIFrameHeight() {
		var iframeid = document.getElementById("iframe"); //iframe id
		if(document.getElementById) {
			iframeid.height = document.documentElement.clientHeight;
			//iframeid.width = document.documentElement.clientWidth*0.8;
		}
	}
	</script>
</html>