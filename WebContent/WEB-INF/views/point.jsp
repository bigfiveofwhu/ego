<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>积分明细</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/point.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
		
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">
					<div class="points">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的积分</strong> / <small>My&nbsp;Point</small></div>
						</div>
						<hr/>
						<div class="pointsTitle">
						   <div class="usable">可用积分<span>${ins.aaa106 }</span></div>
						   <!--div class="pointshop"><a href="#"><i><img src="<%=path%>/images/u5.png" /></i>积分商城</a></div-->
						   <div class="signIn"><a href="#"><i class="am-icon-calendar"></i><em>+5</em>每日签到</a></div>
						</div>
						<div class="pointlist am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">全部</a></li>
								<li><a href="#tab2">获得</a></li>
								<li><a href="#tab3">支出</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">积分详情</th>
												<th class="th2">积分变动</th>
												<th class="th3">变动时间</th>
											</tr>
										</thead>										
										<tbody>
										<c:choose>
										<c:when test="${rows!=null }">
										<c:forEach items="${rows }" var="ins" varStatus="vs">
											<tr>
												<td class="pointType">${ins.fvalue }</td>
												<td class="pointNum">${ins.aaa1003 }</td>
												<td class="pointTime">${ins.aaa1005 }</td>
											</tr>
											
										</c:forEach>
										</c:when>
										</c:choose>
											
											
										</tbody>
									</table>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">积分详情</th>
												<th class="th2">获取积分</th>
												<th class="th3">变动时间</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aaa1004 eq '01' }">
													<tr>
														<td class="pointType">${ins.fvalue }</td>
														<td class="pointNum">${ins.aaa1003 }</td>
														<td class="pointTime">${ins.aaa1005 }</td>
													</tr>
												</c:when>
												</c:choose>
											</c:forEach>
											</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">积分详情</th>
												<th class="th2">消耗积分</th>
												<th class="th3">变动时间</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
											<c:when test="${rows!=null }">
											<c:forEach items="${rows }" var="ins" varStatus="vs">
												<c:choose>
												<c:when test="${ins.aaa1004 eq '02' }">
													<tr>
														<td class="pointType">变化类型: ${ins.aaa1004 }</td>
														<td class="pointNum">${ins.aaa1003 }</td>
														<td class="pointTime">${ins.aaa1005 }</td>
													</tr>
												</c:when>
												</c:choose>
											</c:forEach>
											</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>

							</div>

						</div>
					</div>
				</div>
				
			</div>


		</div>

	</body>

</html>