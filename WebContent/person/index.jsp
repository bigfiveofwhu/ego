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
		<script src="<%=path%>/js/iframe.js"></script>
		
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
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src=""></iframe>
			    </div>								
				</div>
				<!--底部-->
				<%@ include file="/footer.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="<%=path %>/person/home.jsp" target="iframe"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person" >
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>

					<ul>
						    <li> <a href="<%=path %>/person/showUserInfo.html" target="iframe">个人信息</a></li>
							<li> <a href="<%=path%>/person/safety.jsp" target="iframe">安全设置</a></li>
							<li> <a href="<%=path%>/person/showAddress.html" target="iframe">地址管理</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="<%=path %>/showOrder.html" target="iframe">订单管理</a></li>
							<li> <a href="<%=path %>/showRefund.html" target="iframe">退款售后</a></li>
							<li> <a href="<%=path %>/showComment.html" target="iframe">我的评价</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的服务</p>
						<ul>
							<li><a href="<%=path %>/goPostNeed.html" target="iframe">我有需求</a></li>
							<li> <a href="<%=path %>/showNeed.html" target="iframe">历史需求</a></li>
							<li> <a href="<%=path %>/showServiceOrder.html" target="iframe">服务订单</a></li>
							<li> <a href="<%=path %>/showServiceComment.html" target="iframe">服务评价</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a href="<%=path %>/showPoint.html" target="iframe">我的积分</a></li>
							<li> <a href="<%=path %>/discount/getCustomerCoupons.html" target="iframe">优惠券 </a></li>
							<li> <a href="<%=path %>/report/userReport.html?type=1" target="iframe">流水报表</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="<%=path %>/person/showCollection.html" target="iframe">收藏</a></li>
							<li> <a href="<%=path %>/showHistory.html" target="iframe">足迹</a></li>														
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
						<!--  
							<li> <a href="<%=path %>/person/consultation.jsp" target="iframe">商品咨询</a></li>
							<li> <a href="<%=path %>/person/suggest.jsp" target="iframe">意见反馈</a></li>							
						-->
							<li> <a href="<%=path %>/message/readMessage.html" target="iframe">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>
		<!--引导 -->
		<%@include file="/bottomGuide.jsp" %>
	</body>
	<script type="text/javascript">
	window.onload=function(){
		var ors = window.location.search.match(/(?:\?|&)iframe=([^&]+)/);
		if (ors) {
		    document.getElementById("iframe").src = ors[1];
		}
		else
			 document.getElementById("iframe").src = "<%=path %>/person/home.jsp";
		}
	

	</script>

</html>