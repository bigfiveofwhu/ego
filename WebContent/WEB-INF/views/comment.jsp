<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>评价管理</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		
		<script type="text/javascript">
			function goCommentDetail(vaab302)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goCommentDetail.html?aab302="+vaab302;
				vform.submit();
			}
		</script>

	</head>

	<body>
	<%String url="";String[] arr=null; %>
	<form id="myform" action="<%=path%>/###.html" method="post"></form>
	
		
		
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>
								<li><a href="#tab2">有图评价</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="comment-main">
														<div class="comment-top">
																<div class="th th-price">
																	<td class="td-inner">评价</td>
																</div>
																<div class="th th-item">
																	<td class="td-inner">商品</td>
																</div>													
														</div>
									<c:choose>
										<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aab412 eq '02' }">
												<div class="comment-list">
													<ul class="item-list">
															<li class="td td-item">
															<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
																<% url=(request.getAttribute("url")).toString();
															  		arr=url.split(";");
																%>
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%><%=arr[0] %>" class="itempic">
																	</a>
																</div>
															</li>
			
															<li class="td td-comment">
																<div class="item-title">
																	<div class="item-opinion" style="width:60px;">${ins.aab410 }分</div>
																	<div class="item-name">
																		<a href="#">
																			<p class="item-basic-info" style="font-size:20px;">${ins.aab202 }</p>
																		</a>
																	</div>
																</div>
																<div class="item-comment">
																	<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">
																	<span style="color:orange;">初次评价:</span>
																	${ins.aab403 }
																	</a>
																</div>
			
																<div class="item-info">
																	<div>
																		<p class="info-little">
																		<span>订单号:${ins.aab302 }</span> 
																		</p>
																		<p class="info-time">${ins.aab406 }</p>  
			
																	</div>
																</div>
															</li>
														</ul>
													</div>
													<br/>
												</c:when>
												<c:when test="${ins.aab412 eq '01' }">
													<div class="comment-list">
														<ul class="item-list">
															<li class="td td-item">
															<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
																<% url=(request.getAttribute("url")).toString();
															  		arr=url.split(";");
																%>
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%><%=arr[0] %>" class="itempic">
																	</a>
																</div>
															</li>											
															
															<li class="td td-comment">
																<div class="item-title">
																	<div class="item-opinion" style="width:60px;">${ins.aab410 }分</div>
																	<div class="item-name">
																		<p class="item-basic-info" style="font-size:20px;">${ins.aab202 }</p>
																	</div>
																</div>
																<div class="item-comment">
																	<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">
																	<span style="color:orange;">初次评价:</span>
																	${ins.aab403 }
																	</a>
																<div class="filePic"><img src="<%=path%>/images/comments/${ins.aab402}" alt=""></div>	
																</div>
			
																<div class="item-info">
																	<div>
																		<p class="info-little">
																		<span>订单号:${ins.aab302 }</span> 
																		</p>
																		<p class="info-time">${ins.aab406 }</p>
			
																	</div>
																</div>
															</li>
														</ul>
													</div>
													<br/>
												</c:when>
												</c:choose>
											</c:forEach>
										</c:when>
									</c:choose>
								</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="comment-main">
									<c:choose>
										<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aab412 eq '01' }">
													<div class="comment-list">
														<ul class="item-list">
															
															<div class="comment-top">
																<div class="th th-price">
																	<td class="td-inner">评价</td>
																</div>
																<div class="th th-item">
																	<td class="td-inner">商品</td>
																</div>													
															</div>
															<li class="td td-item">
															<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
																<% url=(request.getAttribute("url")).toString();
															  		arr=url.split(";");
																%>
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%><%=arr[0] %>" class="itempic">
																	</a>
																</div>
															</li>											
															
															<li class="td td-comment">
																<div class="item-title">
																	<div class="item-opinion" style="width:60px;">${ins.aab410 }分</div>
																	<div class="item-name">
																		<a href="#">
																			<p class="item-basic-info">${ins.aab202 }</p>
																		</a>
																	</div>
																</div>
																<div class="item-comment">
																	<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">${ins.aab403 }</a>
																<div class="filePic"><img src="<%=path%>/images/comments/${ins.aab402}" alt=""></div>	
																</div>
			
																<div class="item-info">
																	<div>
																		<p class="info-little">
																		<span>订单号:${ins.aab302 }</span> 
																		</p>
																		<p class="info-time">${ins.aab406 }</p>
			
																	</div>
																</div>
															</li>
														</ul>
													</div>
													<br/>
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

	</body>

</html>