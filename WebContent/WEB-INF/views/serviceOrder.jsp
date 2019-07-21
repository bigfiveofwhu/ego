<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>服务订单管理</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		function goComment(vaac402)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/goServiceOrderDetail.html?aac402="+vaac402;
			vform.submit();
		}
		</script>

	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post"></form>
		
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">服务订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">服务商</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">服务类型</td>
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
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${ins.aac402 }</a></div>
													<span>创建时间：${ins.aac403 }</span>
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
																			<p>${ins.aac103 }</p>
																			<p class="info-little">服务类型:${ins.aac410 }</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-amount">
															<div class="item-amount"><br/><br/>
																合计：${ins.aac407 }
																<p>预付款：<span>${ins.aac406 }</span></p>
															</div>
														</li>
															
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-status">
														<c:choose>
															<c:when test="${ins.aac408 eq '01' }">
																<div class="item-status"><br/>
																	<p class="Mystatus">已预付</p>
																</div>
															</c:when>
															<c:when test="${ins.aac408 eq '02' }">
																<div class="item-status"><br/>
																	<p class="Mystatus">已完工</p>
																</div>
															</c:when>
															<c:when test="${ins.aac408 eq '03' }">
																<div class="item-status"><br/>
																	<p class="Mystatus">已评价</p>
																	<p style="color:orange;">查看评价>>></p><br/>
																</div>
															</c:when>
														</c:choose>
														</li>
													</div>
													<div class="am-btn am-btn-danger anniu" onclick="goDetail(${ins.aac402})">
														订单详情
													</div>	
												</div>
											</div>
										</c:forEach>
										</c:when>
										</c:choose>
											
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>