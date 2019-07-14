<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��������<%=session.getAttribute("aaa102") %></title>

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
			function goCommentDetail(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goCommentDetail.html?aab302="+vaab302;
				vform.submit();
			}
		</script>

	</head>

	<body>
		<%double total=0; %>
		<form id="myform" action="<%=path%>/###.html" method="post"></form>
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--���������� -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">�ף����¼</a>
									<a href="#" target="_top">���ע��</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">�̳���ҳ</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>��������</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>���ﳵ</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>�ղؼ�</span></a></div>
						</ul>
						</div>

						<!--����������-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=path%>/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="����" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="����" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">ȫ������</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">��ҳ</a></li>
                                <li class="qc"><a href="#">����</a></li>
                                <li class="qc"><a href="#">��ʱ��</a></li>
                                <li class="qc"><a href="#">�Ź�</a></li>
                                <li class="qc last"><a href="#">���װ</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>�ҵĸ���
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">���ж���</a></li>
								<li><a href="#tab2">������</a></li>
								<li><a href="#tab3">������</a></li>
								<li><a href="#tab4">���ջ�</a></li>
								<li><a href="#tab5">������</a></li>
							</ul>

							<div class="am-tabs-bd">
<!-- ��������1 ����-->
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
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
										<div class="order-list">
															
										<c:choose>
											<c:when test="${rows!=null }">
												<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												
												<c:when test = "${ins.aab303 eq '01' }">
												<div class="order-status1">
													<div class="order-title">
														<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
														<span>�ύʱ�䣺${ins.aab304 }</span>
														<!--    <em>���̣�С�۵�</em>-->
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
																	�ϼƣ�<%=total %>
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
													<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
													<span>����ʱ�䣺${ins.aab305 }</span>
													<!--    <em>���̣�С�۵�</em>-->
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
																�ϼƣ�<%=total %>
																<p>���˷ѣ�<span>${ins.aab313 }</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">����Ѹ���</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
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
													<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
													<span>����ʱ�䣺${ins.aab306 }</span>
													<!--    <em>���̣�С�۵�</em>-->
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
																	�ϼƣ�<%=total %>
																	<p>���˷ѣ�<span>${ins.aab313 }</span></p>
																</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">�����ѷ���</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																	<p class="order-info"><a href="#">�ӳ��ջ�</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" onclick="goOrderDetail(${ins.aab302})">
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
													<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
													<span>�ջ�ʱ�䣺${ins.aab307 }</span>

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
																		�ϼƣ�<%=total %>
																		<p>���˷ѣ�<span>${ins.aab313 }</span></p>
																	</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">���׳ɹ�</p>
																	<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																</div>
															</li>
															<c:choose>
																<c:when test="${ ins.aab303 eq '05'}">
																<li class="td td-change">
																	<a href="#" onclick="goComment(${ins.aab302})">
																		<div class="am-btn am-btn-danger anniu">
																			ȥ����
																		</div>
																	</a>
																</li>
																</c:when>
																<c:when test="${ ins.aab303 eq '06'}">
																<li class="td td-change">
																	<a href="#" onclick="goCommentDetail(${ins.aab302})">
																		<div class="am-btn am-btn-danger anniu">
																			ȥ׷��
																		</div>
																	</a>
																</li>
																</c:when>
															</c:choose>
															
														</div>
													</div>
												</div>
												</div>
												</c:when>
												
												<c:when test="${ins.aab303 eq '03' }">
												<div class="order-status0">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
													<span>����ʱ�䣺${ins.aab304 }</span>
													<!--    <em>���̣�С�۵�</em>-->
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
																�ϼƣ�<%=total %>
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
														<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
														<span>�ɽ�ʱ�䣺${ins.aab305 }</span>
														<!--    <em>���̣�С�۵�</em>-->
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
																	�ϼƣ�<%=total %>
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
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																		<p class="order-info"><a href="logistics.html">�鿴����</a></p>
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
												</c:forEach>
											</c:when>
										</c:choose>	

										</div>

									</div>

								</div>
<!-- /�������� 1 ����-->
<!-- ��������2 ������ -->
								<div class="am-tab-panel am-fade" id="tab2">
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
										<div class="order-list">
	<!-- ������ѭ���� -->	
										<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aab303 eq '01' }">
													<div class="order-status1">
													<div class="order-title">
														<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
														<span>�ύʱ�䣺${ins.aab304 }</span>
														<!--    <em>���̣�С�۵�</em>-->
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
																	�ϼƣ�<%=total %>
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
																	<div class="am-btn am-btn-danger anniu" onclick="goPay(${ins.aab302})">
																		һ��֧��</div>
																</li>
															</div>
														</div>
	
														</div>
													</div>
												</c:when>
												</c:choose>
											</c:forEach>
											</c:when>
										</c:choose>
	<!-- /������ѭ���� -->										
											
											
											
										</div>

									</div>
								</div>
<!-- /��������2 ������ -->
<!-- ��������3 ������ -->
								<div class="am-tab-panel am-fade" id="tab3">
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
										<div class="order-list">
	<!-- ������ѭ���� -->										
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${ins.aab303 eq '02' }">
													<div class="order-status2">
													<div class="order-title">
														<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
														<span>����ʱ�䣺${ins.aab305 }</span>
														<!--    <em>���̣�С�۵�</em>-->
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
																	�ϼƣ�<%=total %>
																	<p>���˷ѣ�<span>${ins.aab313 }</span></p>
																</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">����Ѹ���</p>
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																	</div>
																</li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">
																		���ѷ���</div>
																</li>
															</div>
														</div>
													</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>
	<!-- /������ѭ���� -->
										</div>
									</div>
								</div>
<!-- /��������3 ������ -->
<!-- ��������4 ���ջ� -->
								<div class="am-tab-panel am-fade" id="tab4">
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
										<div class="order-list">
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${ins.aab303 eq '04' }">
													<div class="order-status3">
														<div class="order-title">
															<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
															<span>����ʱ�䣺${ins.aab306 }</span>
															<!--    <em>���̣�С�۵�</em>-->
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
																		�ϼƣ�<%=total %>
																		<p>���˷ѣ�<span>${ins.aab313 }</span></p>
																	</div>
																</li>
																<div class="move-right">
																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">�����ѷ���</p>
																			<p class="order-info"><a href="#" onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																			<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																			<p class="order-info"><a href="#">�ӳ��ջ�</a></p>
																		</div>
																	</li>
																	<li class="td td-change">
																		<div class="am-btn am-btn-danger anniu" onclick="goOrderDetail(${ins.aab302})">
																			ȷ���ջ�</div>
																	</li>
																</div>
															</div>
														</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>
											
										</div>
									</div>
								</div>
<!-- /��������4 ���ջ�-->
<!-- ��������5 ������-->
								<div class="am-tab-panel am-fade" id="tab5">
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
										<div class="order-list">
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:choose>
													<c:when test="${(ins.aab303 eq '05')||(ins.aab303 eq '06') }">
													<div class="order-status4">
													<div class="order-title">
														<div class="dd-num">������ţ�<a href="javascript:;">${ins.aab302 }</a></div>
														<span>�ջ�ʱ�䣺${ins.aab307 }</span>
	
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
																			�ϼƣ�<%=total %>
																			<p>���˷ѣ�<span>${ins.aab313 }</span></p>
																		</div>
															</li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">���׳ɹ�</p>
																		<p class="order-info"><a href="#"  onclick="goOrderDetail(${ins.aab302})">��������</a></p>
																		<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																	</div>
																</li>
																<c:choose>
																	<c:when test="${ ins.aab303 eq '05'}">
																	<li class="td td-change">
																		<a href="#" onclick="goComment(${ins.aab302})">
																			<div class="am-btn am-btn-danger anniu">
																				ȥ����
																			</div>
																		</a>
																	</li>
																	</c:when>
																	<c:when test="${ ins.aab303 eq '06'}">
																	<li class="td td-change">
																		<a href="#" onclick="goCommentDetail(${ins.aab302})">
																			<div class="am-btn am-btn-danger anniu">
																				ȥ׷��
																			</div>
																		</a>
																	</li>
																	</c:when>
																</c:choose>
															</div>
														</div>
														</div>
													</div>
													</c:when>
													</c:choose>
													</c:forEach>
												</c:when>
											</c:choose>	
											
											
											
											
										</div>
									</div>
								</div>
<!-- /��������5 -->
							</div>

						</div>
					</div>
				</div>
				<!--�ײ�-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">�����Ƽ�</a>
							<b>|</b>
							<a href="#">�̳���ҳ</a>
							<b>|</b>
							<a href="#">֧����</a>
							<b>|</b>
							<a href="#">����</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">���ں���</a>
							<a href="#">�������</a>
							<a href="#">��ϵ����</a>
							<a href="#">��վ��ͼ</a>
							<em>&copy; 2015-2025 Hengwang.com ��Ȩ����. ����ģ�� <a href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��">ģ��֮��</a> - Collect from <a href="http://www.cssmoban.com/" title="��ҳģ��" target="_blank">��ҳģ��</a></em>
						</p>
					</div>

				</div>
			</div>
			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
						<ul>
							<li> <a href="information.html">������Ϣ</a></li>
							<li> <a href="safety.html">��ȫ����</a></li>
							<li> <a href="address.html">��ַ����</a></li>
							<li> <a href="cardlist.html">���֧��</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵĽ���</p>
						<ul>
							<li><a href="order.html">��������</a></li>
							<li> <a href="change.html">�˿��ۺ�</a></li>
							<li> <a href="comment.html">������Ʒ</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>�ҵ��ʲ�</p>
						<ul>
							<li> <a href="points.html">�ҵĻ���</a></li>
							<li> <a href="coupon.html">�Ż�ȯ </a></li>
							<li> <a href="bonus.html">���</a></li>
							<li> <a href="walletlist.html">�˻����</a></li>
							<li> <a href="bill.html">�˵���ϸ</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>�ҵ��ղ�</p>
						<ul>
							<li> <a href="collection.html">�ղ�</a></li>
							<li> <a href="foot.html">�㼣</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>���߿ͷ�</p>
						<ul>
							<li> <a href="consultation.html">��Ʒ��ѯ</a></li>
							<li> <a href="suggest.html">�������</a></li>							
							
							<li> <a href="news.html">�ҵ���Ϣ</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>