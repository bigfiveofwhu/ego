<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�Ż�ȯ</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/cpstyle.css" rel="stylesheet" type="text/css">
			
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
					<div class="user-coupon">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�Ż�ȯ</strong> / <small>Coupon</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">�����Ż�ȯ</a></li>
								<li><a href="#tab2">����/�����Ż�ȯ</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="coupon-items">
									<c:if test="${empty usable }">����δӵ���κ��Ż�ȯ����ȥ���ɣ�</c:if>
									<c:forEach items="${usable }" var="item">
										<c:choose>
											<c:when test="${item.aaa502==1 }">
												<div class="coupon-item coupon-item-d">
												<div class="coupon-list">
													<div class="c-type">
														<div class="c-class">
															<strong>����ȯ</strong>
														</div>
														
														<div class="c-price">
															<strong>��8</strong>
														</div>
														<div class="c-limit">
															��������&nbsp;${item.aaa503 }Ԫ&nbsp;���á�
														</div>
														<div class="c-time"><span>ʹ������</span>��ֹ��${item.aaa506 }</div>
														<div class="c-type-top"></div>
														<div class="c-type-bottom"></div>
													</div>
												
													<div class="c-msg">
														<div class="c-range">
															<div class="range-all">
																<div class="range-item">
																	<span class="label">��&nbsp;��&nbsp;��&nbsp;�ƣ�</span>
																	<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
																</div>
															</div>
														</div>
														<div class="op-btns">
															<a href="#" onclick="parent.location.href='/ego/shop/home.html?shopId=${item.aab102}'" class="btn"><span class="txt">����ʹ��</span><b></b></a>
														</div>
													</div>
												</div>
												</div>
											</c:when>
											
											<c:when test="${item.aaa502==2}">
												<div class="coupon-item coupon-item-yf">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>��${item.aaa503}</strong>
													</div>
													<div class="c-price">
														<strong>�ɵ��˷�</strong>
													</div>
													<div class="c-limit">
														������
													</div>
													<div class="c-time"><span>ʹ������</span>��ֹ��${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">��&nbsp;��&nbsp;��&nbsp;�ƣ�</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>

													</div>
													<div class="op-btns">
													
														<a href="#"  onclick="parent.location.href='/ego/shop/home.html?shopId=${item.aab102}'" class="btn" ><span class="txt">����ʹ��</span><b></b></a>
													</div>
												</div>
											</div>
										</div>
											</c:when>
										</c:choose>
									</c:forEach>
									</div><%-- tab1���� --%>
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
														<strong>����ȯ</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>��${item.aaa503 }</strong>
													</div>
													<div class="c-limit">
														��������&nbsp;${item.aaa504 }Ԫ&nbsp;���á�
													</div>
													<div class="c-time"><span>ʹ������</span>��ֹ��${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">��&nbsp;��&nbsp;��&nbsp;�ƣ�</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>
													</div>
													<div class="op-btns c-del">
														<a href="#" class="btn" tag="delete" data="${item.aaa501 }"><span class="txt">ɾ��</span><b></b></a>
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
														<strong>��${item.aaa503 }</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>�ɵ��˷�</strong>
													</div>
													<div class="c-limit">
														����������
													</div>
													<div class="c-time"><span>ʹ������</span>��ֹ��${item.aaa506 }</div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">��&nbsp;��&nbsp;��&nbsp;�ƣ�</span>
																<span class="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.shopName}</span>
															</div>
														</div>

													</div>
													<div class="op-btns c-del">
														<a href="#"  class="btn" tag="delete" data="${item.aaa501 }"><span class="txt">ɾ��</span><b></b></a>
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
			  alert("ɾ��ʧ��")
		  }
	  }).fail(function() {
		  alert("δ֪����")
	  })
})
$("")
</script>
	</body>

</html>