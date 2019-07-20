<%@ page import="java.text.DecimalFormat"%>
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
		
            
			<b class="line"></b>		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

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
									<%DecimalFormat df=new DecimalFormat("0.00"); %>
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
																			<br/>��Ʒ:${ins.aab202 } </p>
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
																	<span>���׽�</span><%=df.format(total) %>
																</div>
															</li>
															<li class="td td-changeprice">
																<div class="item-changeprice">
																	<span>�˿��</span><%=df.format(spend) %>
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
				
			</div>

		</div>

	</body>

</html>