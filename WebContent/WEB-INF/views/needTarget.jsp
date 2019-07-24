<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>ѡ�񱨼�</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		function selectTarget(vaac302)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/selectTarget.html?aac302="+vaac302;
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

						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">ѡ�񱨼�</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">���б���</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">������</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:choose>
											<c:when test="${rows!=null}">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<div class="order-status5">
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="<%=path%>/images/server.jpg" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>${ins.aac304 }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		${ins.aac303 }
																	</div>
																</li>
																<li class="td td-number" style="width:100">
																	<div class="item-number">
																		${ins.aac103 }<br/>
																		<a href="javascript:;">
																		<span style="color:orange;">����>>></span>
																		</a>
																	</div>
																</li>
																
															</ul>
	
															
														</div>
														<div class="order-right">
															
															<div class="move-right">
																<c:choose>
																	<c:when test="${(ins.aac305 eq '01') }">
																		<li class="td td-change">
																			<div class="am-btn am-btn-danger anniu" onclick="selectTarget(${ins.aac302})">
																				ѡ�������
																			</div>
																		</li>
																	</c:when>
																	<c:when test="${ins.aac305 eq '02'}">
																		<li class="td td-change">
																			<div class="am-btn am-btn-danger anniu" style="background-color:#5eb95e;">
																				��ѡ��
																			</div>
																		</li>
																	</c:when>
																	<c:when test="${(ins.aac305 eq '03') }">
																		<li class="td td-change">
																			<div class="am-btn am-btn-danger anniu" style="background-color:#999999;">
																				�ѷ�
																			</div>
																		</li>
																	</c:when>
																</c:choose>
																		
															</div>
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
			
		</div>

	</body>

</html>