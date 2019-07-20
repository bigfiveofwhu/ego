<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>退换货管理</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		function goRefundDetail(vaaa802)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/goRefundDetail.html?aaa802="+vaaa802;
			vform.submit();
		}
		</script>
	</head>

	<body>
		<form id="myform" action="###.html" method="post">
		
		</form>
		
            
			<b class="line"></b>		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">退换货管理</strong> / <small>Change</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">退款管理</a></li>
								<!--  li><a href="#tab2">售后管理</a></li-->

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-orderprice th-price">
											<td class="td-inner">交易金额</td>
										</div>
										<div class="th th-changeprice th-price">
											<td class="td-inner">退款金额</td>
										</div>
										<div class="th th-status th-moneystatus">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change th-changebuttom">
											<td class="td-inner">交易操作</td>
										</div>
									</div>
		
									<div class="order-main">
									<%double total=0; double spend=0;%>
									<%DecimalFormat df=new DecimalFormat("0.00"); %>
									<c:choose>
										<c:when test="${rows!=null }">
										<c:forEach items="${rows }" var="ins" varStatus="vs">
										<div class="order-list">
											<div class="order-title">
												<div class="dd-num">退款编号：<a href="javascript:;">${ins.aaa802 }</a></div>
												<span>申请时间：${ins.aaa807 }</span>
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
																		<p>${ins.aab202 }</p>
																		<p class="info-little">订单号:${ins.aab302 }
																			<br/>商品:${ins.aab202 } </p>
																	</a>
																</div>
															</div>
														</li>

														
														<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
													    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
													    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
													    <%  spend=Double.valueOf((String)request.getAttribute("number"))
													    				*Double.valueOf((String)request.getAttribute("price")); 			
													   		total=spend+Double.valueOf((String)request.getAttribute("transFee")); 			
													    %>
														<ul class="td-changeorder">
															<li class="td td-orderprice">
																<div class="item-orderprice">
																	<span>交易金额：</span><%=df.format(total) %>
																</div>
															</li>
															<li class="td td-changeprice">
																<div class="item-changeprice">
																	<span>退款金额：</span><%=df.format(spend) %>
																</div>
															</li>
														</ul>
														<div class="clear"></div>
													</ul>

													<div class="change move-right">
														<li class="td td-moneystatus td-status">
															<div class="item-status">
															<c:choose>
																<c:when test="${ins.aab803 eq 01 }">
																<p class="Mystatus">已提交申请</p>
																</c:when>
																<c:when test="${ins.aab803 eq 02 }">
																<p class="Mystatus">处理中</p>
																</c:when>
																<c:when test="${ins.aab803 eq 03 }">
																<p class="Mystatus">退款成功</p>
																</c:when>
															</c:choose>
															</div>
														</li>
													</div>
													<li class="td td-change td-changebutton">
                                                        <a href="javascript:;" onclick="goRefundDetail(${ins.aaa802})">
														    <div class="am-btn am-btn-danger anniu">
															详细动态</div>
														</a>
													</li>

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