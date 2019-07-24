<%@page import="java.text.DecimalFormat"%>
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>售后详情</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/refstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
		
           
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">售后详情</strong> / <small>Refund&nbsp;Detail</small></div>
					</div>
					<hr/>
					<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
					<% String url=(request.getAttribute("url")).toString();
				  	   String[] arr=url.split(";");
					%>
					<div class="comment-list">
						<div class="record-aside">
							<div class="item-pic">
								<a href="#" class="J_MakePoint">
									
									<img src="<%=path%><%=arr[0] %>" class="itempic">
								</a>
							</div>

							<div class="item-title">

								<div class="item-name">
									<a href="#">
										<p class="item-basic-info">${ins.aab202 }</p>
									</a>
								</div>
								<div class="info-little">
									<span>商品ID:${ins.aab203 }</span>
								</div>
							</div>
							<div class="clear"></div>
							<div class="item-info">
								<div class="item-ordernumber">
									<span class="info-title">退款编号：</span><a>${ins.aaa802 }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">退款类型：</span><a>${ins.type }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">退款原因：</span><a>${ins.reason }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">原因描述：</span><a>${ins.aaa805 }</a>
								</div>

								<div class="item-time">
									<span class="info-title">申请时间：</span><span class="time">${ins.aaa807 }</span>
								</div>

							</div>
							<div class="clear"></div>
						</div>
						
						<%double spend=0; %>
						<%DecimalFormat df=new DecimalFormat("0.00"); %>
						<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
					    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
					    <%  spend=Double.valueOf((String)request.getAttribute("number"))
					    				*Double.valueOf((String)request.getAttribute("price")); 
					    %>
						<div class="record-main">
							<div class="detail-list refund-process">
							    <div class="fund-tool">退款金额</div>
								<div class="money"><%=df.format(spend) %></div>
							</div>
							<div class="clear"></div>
							<!--进度条-->
							<div class="m-progress" style="height: 100px;">
								<div class="m-progress-list">
									<span class="step-1 step">
		                                <em class="u-progress-stage-bg"></em>
		                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
		                                <p class="stage-name">申请提交 </p>
		                                <p class="stage-name">${ins.aaa807 }</p>
		                            </span>
		                            
		                            <c:choose>
			                            <c:when test="${ins.aaa803 eq '01' }">
			                            	<span class="step-2 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
				                                <p class="stage-name">商家处理</p>
				                                <p class="stage-name"><br/><br/></p>
			                            	</span>
			                            </c:when>
			                            <c:otherwise>
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
				                                <p class="stage-name">商家处理</p>
				                                <p class="stage-name">${ins.aaa808 }</p>
			                            	</span>
			                            </c:otherwise>
		                            </c:choose>
									
									<c:choose>
			                            <c:when test="${ins.aaa803 eq '03' }">
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">退款成功</p>
				                                <p class="stage-name">${ins.aaa809 }</p>
				                            </span>
			                            </c:when>
			                            <c:when test="${ins.aaa803 eq '04' }">
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">退款被拒绝</p>
				                                <p class="stage-name">${ins.aaa809 }</p>
				                            </span>
			                            </c:when>
			                            <c:otherwise>
			                            	<span class="step-3 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">退款成功</p>
				                                <p class="stage-name"><br/><br/></p>
				                            </span>
			                            </c:otherwise>
		                            </c:choose>
									
									<span class="u-progress-placeholder"></span>
								</div>
								<div class="u-progress-bar total-steps-2">
									<div class="u-progress-bar-inner"></div>
								</div>
							</div>
						</div>

					</div>
					<div class="clear"></div>
				</div>

				
			</div>

		</div>

	</body>

</html>