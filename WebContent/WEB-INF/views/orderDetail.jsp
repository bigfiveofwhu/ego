<%@page import="java.text.DecimalFormat"%>
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单详情</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

		<script type="text/javascript">
			function deleteOrder(vaab302)
			{
				window.location.href='payOrder.html';
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/delOrderById.html?aab302="+vaab302;
				vform.submit();
			}
				
			function goPay(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goPay.html?aab302="+vaab302;
				vform.submit();
			}
			
			function goOrderDetail(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goOrderDetail.html?aab302="+vaab302;
				vform.submit();
			}
			
			function goComment(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goComment.html?aab302="+vaab302;
				vform.submit();
			}
			function recieveOrder(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/recieveOrder.html?aab302="+vaab302;
				vform.submit();
			}
		</script>
	</head>

	<body>
		<%double total=0; %>
		<%DecimalFormat df=new DecimalFormat("0.00"); %>
		<form id="myform" action="<%=path%>/###.html" method="post">
		<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102") %>">
		</form>
		
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-orderinfo">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--进度条-->
						<div class="m-progress">
							<div class="m-progress-list">
								<span class="
										<c:choose>
											<c:when test="${ins.aab303 eq '01' }">step-1 step</c:when>
											<c:otherwise>step-2 step</c:otherwise>
										</c:choose>	
											">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                   <p class="stage-name">拍下商品</p>
                                </span>
                                
								<span class="
										<c:choose>
											<c:when test="${ins.aab303 eq '01' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '02' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '03' }">step-3 step</c:when>
											<c:otherwise>step-2 step</c:otherwise>
										</c:choose>	
											">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                   <p class="stage-name">卖家发货</p>
                                </span>
								<span class="
										<c:choose>
											<c:when test="${ins.aab303 eq '01' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '02' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '03' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '04' }">step-3 step</c:when>
											<c:otherwise>step-2 step</c:otherwise>
										</c:choose>	
											">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                   <p class="stage-name">确认收货</p>
                                </span>
								<span class="
										<c:choose>
											<c:when test="${ins.aab303 eq '01' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '02' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '03' }">step-3 step</c:when>
											<c:when test="${ins.aab303 eq '04' }">step-3 step</c:when>
											<c:otherwise>step-2 step</c:otherwise>
										</c:choose>
											">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
                                   <p class="stage-name">交易完成</p>
                                </span>
								<span class="u-progress-placeholder"></span>
							</div>
							<div class="u-progress-bar total-steps-2">
								<div class="u-progress-bar-inner"></div>
							</div>
						</div>
						
						
						<div class="order-infoaside">
							<div class="order-logistics">
								<a href="javascript:;">
									
									<div class="latest-logistics">
										<div class="inquire">
											<span class="package-detail">物流号:${ins.aab309 }</span>
											<span class="package-detail">快递单号: </span>
											<span class="package-number">${ins.aab309 }</span>
											<a href="logistics.html">查看</a>
										</div>
									</div>
									<span class="am-icon-angle-right icon"></span>
								</a>
								<div class="clear"></div>
							</div>
							<div class="order-addresslist">
								<div class="order-address">
									<div class="icon-add">
									</div>
									<p class="new-tit new-p-re">
										<span class="new-txt">联系人:<%=session.getAttribute("aaa103") %></span>
										<span class="new-txt-rd2">联系方式:<%=session.getAttribute("aaa108") %></span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">收货地址：${ins.aab311 }</span>
											
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="order-infomain">
							<div class="order-title">
										<div class="dd-num">订单编号：<a href="javascript:;">${ins.aab302 }</a></div><br/><br/>
										<span>创建时间：${ins.aab304 }</span><br/>
										<span>付款时间：${ins.aab305 }</span><br/>
										<span>发货时间：${ins.aab306 }</span><br/>
										<span>收货时间：${ins.aab307 }</span><br/>
							</div>
							<div class="order-top">
								<div class="th th-item">
									<td class="td-inner">商品</td>
								</div>
								<div class="th th-price">
									<td class="td-inner">单价</td>
								</div>
								<div class="th th-number">
									<td class="td-inner">数量</td>
								</div>
								<div class="th th-operation">
									<td class="td-inner">商品操作</td>
								</div>
								<div class="th th-amount">
									<td class="td-inner">合计</td>
								</div>
								<div class="th th-status">
									<td class="td-inner">交易状态</td>
								</div>
								<div class="th th-change">
									<td class="td-inner">交易操作</td>
								</div>
							</div>
							
							
							<div class="order-main">
								<c:choose>
												
									<c:when test = "${ins.aab303 eq '01' }">
									<div class="order-status1">
										<div class="order-title">
										<div class="dd-num"><br/></div>
										
									</div>	
										<div class="order-content">
											<div class="order-left">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint">
																<img src="<%=path %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#">
																	<p>商品id:${ins.aab203 }</p>
																	<p class="info-little">属性1:还没填
																		<br/>属性2:还没填 </p>
																</a>
															</div>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price">
															${ins.aab314 }
														</div>
													</li>
													<li class="td td-number">
														<div class="item-number">
															<span>×</span>${ins.aab310 }
														</div>
													</li>
													<li class="td td-operation">
														<div class="item-operation">

														</div>
													</li>
												</ul>
											</div>
											
											<div class="order-right">
												<li class="td td-amount">
													<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
												    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
												    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
												    <%  total=Double.valueOf((String)request.getAttribute("number"))
												    				*Double.valueOf((String)request.getAttribute("price"))
												    				+Double.valueOf((String)request.getAttribute("transFee")); %>
													<div class="item-amount">
														合计：<%=df.format(total) %>
														<p>含运费：<span>${ins.aab313 }</span></p>
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">等待买家付款</p>
															<p class="order-info"><a href="#">取消订单</a></p>

														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu" onclick="goPay(${ins.aab302})" >
															一键支付</div>
													</li>
												</div>
											</div>

											</div>
									</div>
									</c:when>
									
									<c:when test="${ins.aab303 eq '02' }">
									<div class="order-status2">
									<div class="order-title">
										<div class="dd-num"><br/></div>
										
									</div>
									<div class="order-content">
										<div class="order-left">
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>商品id:${ins.aab203 } </p>
																<p class="info-little">属性1:尚无
																	<br/>属性2:尚无</p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ins.aab314 }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">退款</a>
													</div>
												</li>
											</ul>
										</div>
										
										<div class="order-right">
											<li class="td td-amount">
												<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
											    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
											    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
											    <%  total=Double.valueOf((String)request.getAttribute("number"))
											    				*Double.valueOf((String)request.getAttribute("price"))
											    				+Double.valueOf((String)request.getAttribute("transFee")); %>
												<div class="item-amount">
													合计：<%=df.format(total) %>
													<p>含运费：<span>${ins.aab313 }</span></p>
												</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">买家已付款</p>
														
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="remind()">
														提醒发货</div>
												</li>
											</div>
										</div>
									</div>
									</div>
									</c:when>
									
									<c:when test="${ins.aab303 eq '04' }">
									<div class="order-status3">
									<div class="order-title">
										<div class="dd-num"><br/></div>
										
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
																<p>商品id:${ins.aab203 }</p>
																<p class="info-little">属性1:尚无
																	<br/>属性2:尚无</p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ins.aab314 }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">退款/退货</a>
													</div>
												</li>
											</ul>
										</div>
										
										<div class="order-right">
											<li class="td td-amount">
												<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
												    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
												    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
												    <%  total=Double.valueOf((String)request.getAttribute("number"))
												    				*Double.valueOf((String)request.getAttribute("price"))
												    				+Double.valueOf((String)request.getAttribute("transFee")); %>
													<div class="item-amount">
														合计：<%=df.format(total) %>
														<p>含运费：<span>${ins.aab313 }</span></p>
													</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">卖家已发货</p>
														
														
														<p class="order-info"><a href="#">延长收货</a></p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="recieveOrder(${ins.aab302})">
														确认收货</div>
												</li>
											</div>
										</div>
									</div>

									</div>
									</c:when>
									
									<c:when test="${(ins.aab303 eq '05')||(ins.aab303 eq '06') }">
									<div class="order-status4">
									<div class="order-title">
										<div class="dd-num"><br/></div>
										
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
																<p>商品id:${ins.aab203 }</p>
																<p class="info-little">属性1:尚无
																	<br/>属性2:尚无 </p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ins.aab314 }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">退款/退货</a>
													</div>
												</li>
											</ul>

										</div>
										<div class="order-right">
											<li class="td td-amount">
												<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
													    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
													    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
													    <%  total=Double.valueOf((String)request.getAttribute("number"))
													    				*Double.valueOf((String)request.getAttribute("price"))
													    				+Double.valueOf((String)request.getAttribute("transFee")); %>
														<div class="item-amount">
															合计：<%=df.format(total) %>
															<p>含运费：<span>${ins.aab313 }</span></p>
														</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">交易成功</p>
														
													</div>
												</li>
												<li class="td td-change">
													<a href="#" onclick="goComment(${ins.aab302})">
														<div class="am-btn am-btn-danger anniu">
															<c:choose>
																<c:when test="${ ins.aab303 eq '05'}">去评价</c:when>
																<c:when test="${ ins.aab303 eq '06'}">去追评</c:when>
															</c:choose>
														</div>
													</a>
												</li>
											</div>
										</div>
									</div>
									</div>
									</c:when>
									
									<c:when test="${ins.aab303 eq '03' }">
									<div class="order-status0">
									<div class="order-title">
										<div class="dd-num"><br/></div>
										
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
																<p>商品id:${ins.aab203 }</p>
																<p class="info-little">属性1:尚无
																	<br/>属性2:尚无 </p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ins.aab314 }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														
													</div>
												</li>
											</ul>
										</div>
										
										<div class="order-right">
											<li class="td td-amount">
												<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
											    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
											    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
											    <%  total=Double.valueOf((String)request.getAttribute("number"))
											    				*Double.valueOf((String)request.getAttribute("price"))
											    				+Double.valueOf((String)request.getAttribute("transFee")); %>
												<div class="item-amount">
													合计：<%=df.format(total) %>
													<p>含运费：<span>${ins.aab313 }</span></p>
												</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">交易关闭</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
														删除订单</div>
												</li>
											</div>
										</div>
									</div>
									</div>	
									
									</c:when>
									
									<c:when test="${(ins.aab303 eq '07')||(ins.aab303 eq '08')||(ins.aab303 eq '09')}">
									<div class="order-status5">
										<div class="order-title">
										<div class="dd-num"><br/></div>
										
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
																	<p>商品id:${ins.aab203 }</p>
																	<p class="info-little">规格1:还没填
																					  <br/>规格2:还没填 </p>
																</a>
															</div>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price">
															${ins.aab314 }
														</div>
													</li>
													<li class="td td-number">
														<div class="item-number">
															<span>×</span>${ins.aab310 }
														</div>
													</li>
													<li class="td td-operation">
														<div class="item-operation">
															
														</div>
													</li>
												</ul>
											</div>
											
											<div class="order-right">
												<li class="td td-amount">
													<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
												    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
												    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
												    <%  total=Double.valueOf((String)request.getAttribute("number"))
												    				*Double.valueOf((String)request.getAttribute("price"))
												    				+Double.valueOf((String)request.getAttribute("transFee")); %>
													<div class="item-amount">
														合计：<%=df.format(total) %>
														<p>含运费：<span>${ins.aab313 }</span></p>
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">
																<c:choose>
																<c:when test="${ins.aab303 eq '07' }">交易成功</c:when>
																<c:when test="${ins.aab303 eq '08' }">已售后处理</c:when>
																<c:when test="${ins.aab303 eq '09' }">已申诉处理</c:when>
																</c:choose>
															</p>
															
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
															删除订单</div>
													</li>
												</div>
											</div>
										</div>
									</div>
									</c:when>

								</c:choose>
								
							</div>
						</div>
					</div>

				</div>
				

			</div>
		</div>
		

	</body>

</html>