<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>验证邮箱</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
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
								<li><img src="../images/logobig.png" /></li>
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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">验证邮箱</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-email" class="am-form-label">验证邮箱</label>
							<div class="am-form-content">
								<input type="email" id="email" placeholder="请输入邮箱地址">
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="tel" id="verifyCode" onblur="checkVerify()" placeholder="验证码">
							</div>
							<a class="btn" href="javascript:void(0);"  id="sendMobileCode">
								<button class="am-btn am-btn-danger sendVerifyCode" >发送验证码</button>
							</a>
							<span id="vstatus"></span>
						</div>
						<div class="info-btn">
							<button class="am-btn am-btn-danger" id="savemodify">保存修改</button>
							<span id="issuccess" ></span>
						</div>
					

					</form>

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
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
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


<script type="text/javascript">
	function checkVerify()
	{
		var verCode=$("#verifyCode").val();
		isVerify=false;
		console.log(verCode);
		$.ajax({
			url:"<%=basePath%>/verify.ajax",
			type:"post",
			timeout:20000,
			data:{
				"verCode":verCode
			},
			dataType:"json",
			success:function(res,status){
				console.log("返回");
				if(res.status=='200'){
					//$(".successIcon").css("display","inline");
					//$(".failIcon").css("display","none");
					//alert("验证成功")
				    $(".sendVerifyCode").text("验证成功");
					isVerify=true;
				}else{
					console.log("s验证失败")
					//$(".successIcon").css("display","none");
					//$(".failIcon").css("display","inline");
					$(".sendVerifyCode").text("验证失败");
				}
			},
			error:function(res,status){
				console.log("验证失败")
				$("#vstatus").html()="验证失败,网络故障"
			}
		});
	}
	
	
	var count=60;
	function countTime(){
		var button=$(".sendVerifyCode");
		button.text((count--)+"秒后重新发送");
		if(count>=0){
			setTimeout(countTime,1000);
		}else{
			setTimeout(function(){
				button.text("发送验证码");
				button.attr("disabled",false);
				count=60;
			},1000);
		}
	}
	$(function(){
		<%-- 验证码的异步发送--%>
		$(".sendVerifyCode").click(function(){
			$(".sendVerifyCode").attr("disabled",true);
			$(".sendVerifyCode").text("正在发送...");
			console.log("发送验证码...");
			
			$.ajax({
				url:"<%=basePath%>/verifyCode.ajax",
				type:"post",
				timeout:20000,
				dataType:"json",
				data:{
					"object":$("#email").val()
					
					
				},
				success:function(res,status){
					console.log(res.status);
					console.log(res.status=='200');
					 if(res.status=='200'){
						 //$(".sendVerifyCode").text("60秒后重新发送");
						 countTime();
					 }else{
						 $(".sendVerifyCode").text("发送失败,重新发送");
						 $(".sendVerifyCode").attr("disabled",false);
					 }
				},
				error:function(res,status){
					console.log("返回值:"+res+";  返回状态:"+status);
					$(".sendVerifyCode").text("发送失败,重新发送");
					$(".sendVerifyCode").attr("disabled",false);
				}
			});
		});		
	});
	
	$(function()
 {
	$("#savemodify").click(function(){
		$.ajax({
			url:"<%=basePath%>/modifyEmail.ajax",
			type:"post",
			dataType:"json",
			timeout:20000,
			data:{
				"aaa104":$("#email").val()
			},
			success:function(res,status){
				//alert("修改成功")
              console.log("修改邮箱成功");
              $("#issuccess").html()="修改成功";
			},
			error:function(res,status){
				console.log("修改邮箱失败");
			}
		});
	});	
	});	

	
	
</script>
	</body>
	

</html>