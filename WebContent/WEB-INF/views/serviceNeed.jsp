<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>需求列表</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		function selectTarget(vaac602)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/showNeedTarget.html?aac602="+vaac602;
			vform.submit();
		}
		function del(vaac602)
		{
			var message=confirm("您确认删除这条需求吗?")
			if(message==true){
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/delNeed.html?aac602="+vaac602;
				vform.submit();
			}
			
		}
		</script>

	</head>

	<body>
		<form id="myform" action="###.html" method="post">
			<input name="aaa804" type="hidden" value="01" />
			<input name="aaa806" type="hidden" value="01" />
			<input name="aaa805" type="hidden" value="" />
			<input name="aab102" type="hidden" value="${ins.aab102 }" />
			<input name="aab203" type="hidden" value="${ins.aab203 }" />
		</form>
		
            
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">需求列表</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">不定向需求</a></li>
								<li><a href="#tab2">定向需求</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">需求信息</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">服务方式</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
											<c:choose>
											<c:when test="${ins.aac611 eq '01' }">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">需求编号：<a href="javascript:;">${ins.aac602 }</a></div>
														<span>提交时间：${ins.aac608 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path %>/images/postneed.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p><span style="color:orange;">服务类型:<br/></span>${ins.type }</p>
																				<p class="info-little">
																				<span style="color:orange;">具体服务描述:<br/></span>
																				${ins.aac605 }
																				</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.method	 }
																	</div>
																</li>
																
																
															</ul>
														</div>
														<div class="order-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:choose>
																		<c:when test="${ins.aac609 eq '01' }">
																			<p class="Mystatus">尚无报价</p>
																		</c:when>
																		<c:when test="${ins.aac609 eq '02' }">
																			<p class="Mystatus">有报价</p>
																		</c:when>
																		<c:when test="${ins.aac609 eq '03' }">
																			<p class="Mystatus">已预约</p>
																		</c:when>
																	</c:choose>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-change">
																<c:choose>
																	<c:when test="${ins.aac609 eq '01' }">
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="del(${ins.aac602})">
																			删除需求
																		</div>
																	</c:when>
																	<c:when test="${ins.aac609 eq '02' }">
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="selectTarget(${ins.aac602})">
																			选择报价
																		</div>
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="del(${ins.aac602})">
																			删除需求
																		</div>
																	</c:when>
																	<c:when test="${ins.aac609 eq '03' }">
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="selectTarget(${ins.aac602})">
																			我的选择
																		</div>
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="del(${ins.aac602})">
																			删除需求
																		</div>
																	</c:when>
																</c:choose>
																
																
																	
																</li>
															</div>
														</div>
													</div>
												</div>
												<br/><br/>
											</c:when>
											</c:choose>
											</c:forEach>
											</c:when>
										</c:choose>
													
								
											
										</div>
									</div>
								</div>
								
								
								<div class="am-tab-panel am-fade am-in am-active" id="tab2">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">需求信息</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">服务方式</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
											<c:choose>
											<c:when test="${ins.aac611 eq '02' }">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">需求编号：<a href="javascript:;">${ins.aac602 }</a></div>
														<span>提交时间：${ins.aac608 }</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path %>/images/postneed.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p><span style="color:orange;">服务类型:<br/></span>${ins.type }</p>
																				<p class="info-little">
																				<span style="color:orange;">具体服务描述:<br/></span>
																				${ins.aac605 }
																				</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.method	 }
																	</div>
																</li>
																
																
															</ul>
														</div>
														<div class="order-right">
															<li class="td td-status">
																<div class="item-status">
																	<c:choose>
																		<c:when test="${ins.aac609 eq '01' }">
																			<p class="Mystatus">尚无报价</p>
																		</c:when>
																		<c:when test="${ins.aac609 eq '02' }">
																			<p class="Mystatus">有报价</p>
																		</c:when>
																		<c:when test="${ins.aac609 eq '03' }">
																			<p class="Mystatus">已预约</p>
																		</c:when>
																	</c:choose>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-change">
																<c:choose>
																	<c:when test="${(ins.aac609 eq '01')||(ins.aac609 eq '03') }">
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="del(${ins.aac602})">
																			删除需求
																		</div>
																	</c:when>
																	<c:when test="${ins.aac609 eq '02' }">
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="selectTarget(${ins.aac602})">
																			去看报价
																		</div>
																		<div class="am-btn am-btn-danger anniu" href="javascript:;" onclick="del(${ins.aac602})">
																			删除需求
																		</div>
																	</c:when>
																</c:choose>
																
																
																	
																</li>
															</div>
														</div>
													</div>
												</div>
												<br/><br/>
											</c:when>
											</c:choose>
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
			
		</div>

	</body>

</html>