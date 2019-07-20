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
			function goCommentDetail(vaac502)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goServiceCommentDetail.html?aac502="+vaac502;
				vform.submit();
			}
		</script>

	</head>

	<body>
	<form id="myform" action="<%=path%>/###.html" method="post"></form>
	
		
		
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的服务评价</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="comment-main">
								<div class="comment-top">
										<div class="th th-price">
											<td class="td-inner">评价</td>
										</div>
										<div class="th th-item">
											<td class="td-inner">服务</td>
										</div>													
								</div>
								<c:choose>
									<c:when test="${rows!=null }">
									<c:forEach items="${rows }" var="ins" varStatus="vs">
									
										<div class="comment-list">
													<ul class="item-list">
														
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic">
																	</a>
																</div>
															</li>
			
															<li class="td td-comment">
																<div class="item-title">
																	<div class="item-opinion" style="width:20%;">评分:<br/>
																	${ins.aac507 }分
																	</div>
																	<div class="item-opinion" style="width:20%;"><br/><br/><br/><br/>
																	
																	</div>
																	<div class="item-name">
																		<a href="#">
																			<p class="item-basic-info">${ins.aac103 }</p>
																		</a>
																		<p class="item-basic-info" style="color:orange;">${ins.aac410 }</p>
																		<p class="item-basic-info">${ins.aac411 }</p>
																	</div>
																</div>
																<div class="item-comment">
																	<a href="javascript:;">${ins.aac503 }</a>
																</div>
			
																<div class="item-info">
																	<div>
																		<p class="info-little">
																		<span>订单号:${ins.aac402 }</span> 
																		</p>
																		<p class="info-time">${ins.aac505 }</p>  
			
																	</div>
																</div>
															</li>
														</ul>
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