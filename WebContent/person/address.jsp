<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
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

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                               <c:forEach items="${addrlist }" var="ins" varStatus="vs">
							   <c:choose>
							   <c:when test="${ins.aaa407 > 0 }">
							   	<li class="user-addresslist defaultAddr">
							   </c:when>
							   <c:otherwise>
							   <li   class="user-addresslist">
							   </c:otherwise>
							    </c:choose>
								<span class="new-option-r" value="${ins.aaa401 }"><i class="am-icon-check-circle"></i>默认地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${ins.aaa405 }</span>
									<span class="new-txt-rd2">${ins.aaa406}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址:</span>
										<span class="province">${ins.aaa402 }</span>
										<span class="street">${ins.aaa403 }</span>
									</p>
								</div>
								<div class="new-addr-btn">
									<a onclick="window.location.href='editAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a onclick="window.location.href='deleteAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);" ><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>
							</c:forEach>

						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form  action="addAddress.html" class="am-form am-form-horizontal">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" name="aaa405"  id="user-name" required="required" placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone"  class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input  name= "aaa406" placeholder="手机号必填" required="required" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<!-- 地址插件 -->
											<div class="am-form-content address">
												<select name="addr_1" id="addr_1" >
												</select>
												<select name="addr_2" id="addr_2" class="childs" >
												</select>
												<select name="addr_3" id="addr_3" class="childs" >
												</select>
											</div>
										  </div>
                                      <div class="am-form-group">
											<label  class="am-form-label">备注</label>
											<div class="am-form-content">
												<input name="aaa404" placeholder="备注" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea name="aaa403" class="" rows="3" id="user-intro" placeholder="输入详细地址" required="required"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit"  value = "保存"class="am-btn am-btn-danger"></input>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
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
								$.ajax({
									url:"<%=basePath%>/setDefAddr.ajax",
									type:"post",
									dataType:"json",
									timeout:20000,
									data:{
										"aaa401":$(this).attr("value")
									},
									success:function(res,status){
		                              console.log("修改默认地址成功");
									},
									error:function(res,status){
										console.log("修改默认地址失败");
									}
								});
							});
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						});
						
					
						
			
			$("#addr_1").change(function(){
				var A_id=$(this).children("option:selected").attr("A_id");
				$("#addr_2").html("");
				$("#addr_3").html("");
				loadAddr(A_id,2);
			});
			$("#addr_2").change(function(){
				var A_id=$(this).children("option:selected").attr("A_id");
				$("#addr_3").html("");
				loadAddr(A_id,3);
			});
			
			<%-- 地址初始化的异步加载--%>
			function loadAddr(type,index){
				if(index>3) return;
				$.ajax({
					url:"<%=basePath%>/getAddr.ajax",
					type:"post",
					timeout:20000,
					dataType:"json",
					data:{
						"type":type
					},
					success:function(res,status){
						var addrs=res.addrs;
						var n=addrs.length;
						var html="";
						if(n>0){
							html="<option value='"+addrs[0].areaname+"' A_id='"+addrs[0].areaid+"' selected='selected'>"+addrs[0].areaname+"</option>";
							for(var i=1;i<n;i++){
								html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
							}
						}
						$("#addr_"+index).html(html);
						loadAddr(addrs[0].areaid,++index);
					},
					error:function(res,status){
						console.log("#addr_"+index+"地址异步加载错误");
					}
				});
			}
			loadAddr("-1",1);
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
						<li> <a href="showUserInfo.html">个人信息</a></li>
							<li> <a href="<%=path%>/person/safety.jsp">安全设置</a></li>
							<li> <a href="showAddress.html">地址管理</a></li>
							<li> <a href="<%=path%>/person/cardlist.jsp">快捷支付</a></li>
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