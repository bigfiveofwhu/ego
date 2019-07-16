<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�˻�������</title>

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
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
			<!--���������� -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<a href="#" target="_top" class="h">�û�id:<%=session.getAttribute("aaa102") %></a>
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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�˻�������</strong> / <small>Change</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">�˿����</a></li>
								<!--  li><a href="#tab2">�ۺ����</a></li-->

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-orderprice th-price">
											<td class="td-inner">���׽��</td>
										</div>
										<div class="th th-changeprice th-price">
											<td class="td-inner">�˿���</td>
										</div>
										<div class="th th-status th-moneystatus">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change th-changebuttom">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>
		
									<div class="order-main">
									<%double total=0; double spend=0;%>
									<c:choose>
										<c:when test="${rows!=null }">
										<c:forEach items="${rows }" var="ins" varStatus="vs">
										<div class="order-list">
											<div class="order-title">
												<div class="dd-num">�˿��ţ�<a href="javascript:;">${ins.aaa802 }</a></div>
												<span>����ʱ�䣺${ins.aaa807 }</span>
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
																		<p>${ins.aab202 }</p>
																		<p class="info-little">������:${ins.aab302 }
																			<br/>��Ʒid:${ins.aab203 } </p>
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
																	<span>���׽�</span><%=total %>
																</div>
															</li>
															<li class="td td-changeprice">
																<div class="item-changeprice">
																	<span>�˿��</span><%=spend %>
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
																<p class="Mystatus">���ύ����</p>
																</c:when>
																<c:when test="${ins.aab803 eq 02 }">
																<p class="Mystatus">������</p>
																</c:when>
																<c:when test="${ins.aab803 eq 03 }">
																<p class="Mystatus">�˿�ɹ�</p>
																</c:when>
															</c:choose>
															</div>
														</li>
													</div>
													<li class="td td-change td-changebutton">
                                                        <a href="javascript:;" onclick="goRefundDetail(${ins.aaa802})">
														    <div class="am-btn am-btn-danger anniu">
															��ϸ��̬</div>
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