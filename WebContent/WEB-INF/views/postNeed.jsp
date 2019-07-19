<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我有需求</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$("#service-type").change(function() {	
				var p = $(this).val();
				$('input[name="aac603"]').val(p);
			});
			$("#service-method").change(function() {	
				var p = $(this).val();
				$('input[name="aac604"]').val(p);
			});
			$("#province").change(function() {	
				var p = $(this).val();
				$('input[name="provinceTmp"]').val(p);
			});
			$("#city").change(function() {	
				var p = $(this).val();
				$('input[name="cityTmp"]').val(" "+p+" ");
			});
			$("#area").change(function() {	
				var p = $(this).val();
				$('input[name="areaTmp"]').val(p);
			});
		})
		
		function sendNeed(vaaa102)
		{
			var vform = document.getElementById("myform");
			$('input[name="aac605"]').val($("#description").val());
			$('input[name="aac607"]').val($("#address").val());
			vform.action="<%=path%>/postNeed.html?aaa102="+vaaa102;
			vform.submit();
			
		}
		</script>
	</head>

	<body>
		
		
		<form id="myform" action="##.html" method="post">
			<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102") %>" />
			<input name="aac603" type="hidden" value="01" />
			<input name="aac604" type="hidden" value="01" />
			<input name="aac605" type="hidden" value="" />
			<input name="aac607" type="hidden" value="" />
			<input name="provinceTmp" type="hidden" value="浙江省" />
			<input name="cityTmp" type="hidden" value="温州市" />
			<input name="areaTmp" type="hidden" value="瑞安区" />
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
			<div class="long-title"><span class="all-goods">我有需求</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">服务首页</a></li>
					<li class="qc"><a href="#">个人中心</a></li>
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

					<div class="user-address">
						
						<div class="clear"></div>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal">
									
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在城市</label>
											<div class="am-form-content address">
												<select id="province" data-am-selected>
													<option value="浙江省" selected>浙江省</option>
													<option value="湖北省">湖北省</option>
												</select>
												<select id="city" data-am-selected>
													<option value="温州市" selected>温州市</option>
													<option value="武汉市" >武汉市</option>
												</select>
												<select id="area" data-am-selected>
													<option value="瑞安区" selected>瑞安区</option>
													<option value="洪山区">洪山区</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="address" placeholder="输入详细地址(非必须)"></textarea>
												<small>50字以内写出你的详细地址...</small>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">服务类型</label>
											<div class="am-form-content address">
												<select id="service-type" data-am-selected>
													<option value="01">家政服务</option>
													<option value="02" selected>维修服务</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">服务方式</label>
											<div class="am-form-content address">
												<select id="service-method" data-am-selected>
													<option value="01">上门服务</option>
													<option value="02" selected>自行前往</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">需求说明</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="description" placeholder="输入详细说明" required="required"></textarea>
												<small>描述你的具体需求...</small>
											</div>
										</div>

										

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" onclick="sendNeed(1)">保存</a>
												<a href="javascript:;" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

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
							<em>&copy;2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

			
		</div>

	</body>

</html>