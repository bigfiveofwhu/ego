<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>优惠券</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/cpstyle.css" rel="stylesheet" type="text/css">
			
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
					<div class="user-coupon">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">优惠券</strong> / <small>Coupon</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">可用优惠券</a></li>
								<li><a href="#tab2">已用/过期优惠券</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="coupon-items">
									<c:if test="${empty usable }">您还未拥有任何优惠券，快去逛逛吧！</c:if>
									<c:forEach items="${usable }" var="item">
										<c:choose>
											<c:when test="${item.aaa502==2 }"><%--有条件 --%>
												<div class="coupon-item coupon-item-d">
												<div class="coupon-list">
													<div class="c-type">
														<div class="c-class">
															<strong>${item.aaa503}</strong>
														</div>
														
														<div class="c-price">
															<strong>￥8</strong>
														</div>
														<div class="c-limit">
															【消费满&nbsp;${item.aaa504 }元&nbsp;可用】
														</div>
														<div class="c-time"><span>使用期限</span>截止至${item.aaa506 }</div>
														<div class="c-type-top"></div>
														<div class="c-type-bottom"></div>
													</div>
												
													<div class="c-msg">
														<div class="c-range">
															<div class="range-all">
																<div class="range-item">
																	<span class="label">店&nbsp;铺&nbsp;名&nbsp;称：</span>
																	<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
																</div>
															</div>
														</div>
														<div class="op-btns">
															<a href="#" onclick="parent.location.href='/ego/shop/home.html?shopId=${item.aab102}'" class="btn"><span class="txt">立即使用</span><b></b></a>
														</div>
													</div>
												</div>
												</div>
											</c:when>
											
											<c:when test="${item.aaa502==1}">
												<div class="coupon-item coupon-item-yf">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>￥${item.aaa503}</strong>
													</div>
													<div class="c-price">
														<strong>可抵运费</strong>
													</div>
													<div class="c-limit">
														无条件
													</div>
													<div class="c-time"><span>使用期限</span>截止至${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">店&nbsp;铺&nbsp;名&nbsp;称：</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>

													</div>
													<div class="op-btns">
													
														<a href="#"  onclick="parent.location.href='/ego/shop/home.html?shopId=${item.aab102}'" class="btn" ><span class="txt">立即使用</span><b></b></a>
													</div>
												</div>
											</div>
										</div>
											</c:when>
										</c:choose>
									</c:forEach>
									</div><%-- tab1结束 --%>
								</div>
								
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="coupon-items">
									
									<c:forEach items="${invalid }" var="item">
										<c:choose>
											<c:when test="${item.aaa502==1}">
												<div class="coupon-item coupon-item-d" id="${item.aaa501 }">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>￥${item.aaa503 }</strong>
													</div>
													<div class="c-limit">
														【消费满&nbsp;${item.aaa504 }元&nbsp;可用】
													</div>
													<div class="c-time"><span>使用期限</span>截止至${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">店&nbsp;铺&nbsp;名&nbsp;称：</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>
													</div>
													<div class="op-btns c-del">
														<a href="#" class="btn" tag="delete" data="${item.aaa501 }"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="<%=path%>/images/gift_stamp_21.png"></span>
													</div>
												</li>
																								
											</div>
										</div>
											</c:when>
											
											<c:when test="${item.aaa502==2}">
												<div class="coupon-item coupon-item-yf" id="${item.aaa501 }">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>￥${item.aaa503 }</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>可抵运费</strong>
													</div>
													<div class="c-limit">
														【无条件】
													</div>
													<div class="c-time"><span>使用期限</span>截止至${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">店&nbsp;铺&nbsp;名&nbsp;称：</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>

													</div>
													<div class="op-btns c-del">
														<a href="#"  class="btn" tag="delete" data="${item.aaa501 }"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="<%=path%>/images/gift_stamp_21.png"></span>
													</div>
												</li>
											</div>
										</div>
											
											</c:when>
										</c:choose>
									</c:forEach>
										
									</div>
									
								</div>
							</div>

						</div>

					</div>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script>
$("[tag='delete']").click(function(){
	var a=$(this);
	$.getJSON('deleteUserCoupon.ajax',{'aaa501':a.attr('data')},function(data){
		  if(data.result==true){
			  $('#'+a.attr('data')).remove();
		  }else{
			  alert("删除失败")
		  }
	  }).fail(function() {
		  alert("未知错误")
	  })
})
$("")
</script>
	</body>

</html>