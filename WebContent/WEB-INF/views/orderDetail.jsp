<%@page import="java.text.DecimalFormat"%>
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��������</title>

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

						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--������-->
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
                                   <p class="stage-name">������Ʒ</p>
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
                                   <p class="stage-name">���ҷ���</p>
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
                                   <p class="stage-name">ȷ���ջ�</p>
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
                                   <p class="stage-name">�������</p>
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
											<span class="package-detail">������:${ins.aab309 }</span>
											<span class="package-detail">��ݵ���: </span>
											<span class="package-number">${ins.aab309 }</span>
											<a href="logistics.html">�鿴</a>
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
										<span class="new-txt">��ϵ��:<%=session.getAttribute("aaa103") %></span>
										<span class="new-txt-rd2">��ϵ��ʽ:<%=session.getAttribute("aaa108") %></span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">�ջ���ַ��${ins.aab311 }</span>
											
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="order-infomain">
							<div class="order-title">
										<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div><br/><br/>
										<span>����ʱ�䣺${ins.aab304 }</span><br/>
										<span>����ʱ�䣺${ins.aab305 }</span><br/>
										<span>����ʱ�䣺${ins.aab306 }</span><br/>
										<span>�ջ�ʱ�䣺${ins.aab307 }</span><br/>
							</div>
							<div class="order-top">
								<div class="th th-item">
									<td class="td-inner">��Ʒ</td>
								</div>
								<div class="th th-price">
									<td class="td-inner">����</td>
								</div>
								<div class="th th-number">
									<td class="td-inner">����</td>
								</div>
								<div class="th th-operation">
									<td class="td-inner">��Ʒ����</td>
								</div>
								<div class="th th-amount">
									<td class="td-inner">�ϼ�</td>
								</div>
								<div class="th th-status">
									<td class="td-inner">����״̬</td>
								</div>
								<div class="th th-change">
									<td class="td-inner">���ײ���</td>
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
																	<p>��Ʒid:${ins.aab203 }</p>
																	<p class="info-little">����1:��û��
																		<br/>����2:��û�� </p>
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
															<span>��</span>${ins.aab310 }
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
														�ϼƣ�<%=df.format(total) %>
														<p>���˷ѣ�<span>${ins.aab313 }</span></p>
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">�ȴ���Ҹ���</p>
															<p class="order-info"><a href="#">ȡ������</a></p>

														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu" onclick="goPay(${ins.aab302})" >
															һ��֧��</div>
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
																<p>��Ʒid:${ins.aab203 } </p>
																<p class="info-little">����1:����
																	<br/>����2:����</p>
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
														<span>��</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">�˿�</a>
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
													�ϼƣ�<%=df.format(total) %>
													<p>���˷ѣ�<span>${ins.aab313 }</span></p>
												</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">����Ѹ���</p>
														
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="remind()">
														���ѷ���</div>
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
																<p>��Ʒid:${ins.aab203 }</p>
																<p class="info-little">����1:����
																	<br/>����2:����</p>
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
														<span>��</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">�˿�/�˻�</a>
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
														�ϼƣ�<%=df.format(total) %>
														<p>���˷ѣ�<span>${ins.aab313 }</span></p>
													</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">�����ѷ���</p>
														
														
														<p class="order-info"><a href="#">�ӳ��ջ�</a></p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="recieveOrder(${ins.aab302})">
														ȷ���ջ�</div>
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
																<p>��Ʒid:${ins.aab203 }</p>
																<p class="info-little">����1:����
																	<br/>����2:���� </p>
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
														<span>��</span>${ins.aab310 }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<a href="refund.html">�˿�/�˻�</a>
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
															�ϼƣ�<%=df.format(total) %>
															<p>���˷ѣ�<span>${ins.aab313 }</span></p>
														</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">���׳ɹ�</p>
														
													</div>
												</li>
												<li class="td td-change">
													<a href="#" onclick="goComment(${ins.aab302})">
														<div class="am-btn am-btn-danger anniu">
															<c:choose>
																<c:when test="${ ins.aab303 eq '05'}">ȥ����</c:when>
																<c:when test="${ ins.aab303 eq '06'}">ȥ׷��</c:when>
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
																<p>��Ʒid:${ins.aab203 }</p>
																<p class="info-little">����1:����
																	<br/>����2:���� </p>
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
														<span>��</span>${ins.aab310 }
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
													�ϼƣ�<%=df.format(total) %>
													<p>���˷ѣ�<span>${ins.aab313 }</span></p>
												</div>
											</li>
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">���׹ر�</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
														ɾ������</div>
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
																	<p>��Ʒid:${ins.aab203 }</p>
																	<p class="info-little">���1:��û��
																					  <br/>���2:��û�� </p>
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
															<span>��</span>${ins.aab310 }
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
														�ϼƣ�<%=df.format(total) %>
														<p>���˷ѣ�<span>${ins.aab313 }</span></p>
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">
																<c:choose>
																<c:when test="${ins.aab303 eq '07' }">���׳ɹ�</c:when>
																<c:when test="${ins.aab303 eq '08' }">���ۺ���</c:when>
																<c:when test="${ins.aab303 eq '09' }">�����ߴ���</c:when>
																</c:choose>
															</p>
															
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu" onclick="deleteOrder(${ins.aab302})">
															ɾ������</div>
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