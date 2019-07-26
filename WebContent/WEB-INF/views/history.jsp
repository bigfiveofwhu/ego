<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的足迹</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/footstyle.css" rel="stylesheet" type="text/css">

	</head>
	
	<Script type="text/javascript">
		function delHistory(vaaa701)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/delHistory.html?aaa701="+vaaa701;
			vform.submit();
		}
	</Script>
	<body>
		<form id="myform" action="###.html" method="post">
		
		</form>
		<%
		//获取今天日期
		java.text.SimpleDateFormat formatter1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();
		String today = formatter1.format(currentTime); 
		request.setAttribute("today", today);
		//获取昨天日期
		java.util.Calendar c1 = java.util.Calendar.getInstance();
		c1.add(java.util.Calendar.DAY_OF_MONTH, -1);
		java.text.SimpleDateFormat formatter2 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String yesterday = formatter2.format(c1.getTime());
		request.setAttribute("yesterday", yesterday);
		//获取上周日期
		java.util.Calendar c2 = java.util.Calendar.getInstance();
		c2.add(java.util.Calendar.DAY_OF_MONTH, -7);
		java.text.SimpleDateFormat formatter3 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String lastWeek = formatter2.format(c2.getTime());
		request.setAttribute("lastWeek", lastWeek);
		//获取上月日期
		java.util.Calendar c3 = java.util.Calendar.getInstance();
		c3.add(java.util.Calendar.DAY_OF_MONTH, -30);
		java.text.SimpleDateFormat formatter4 =  new java.text.SimpleDateFormat("yyyy-MM-dd");
		String lastMonth = formatter3.format(c3.getTime());
		request.setAttribute("lastMonth", lastMonth);
		
		String url="";String[] arr=null;
		 %>
		
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">
					<div class="user-foot">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>
						
						<%int dayCount=0; %>
						<!--足迹列表 -->
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${ins.aaa702 eq today }">
							<div class="goods" style="width:25%;">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if (dayCount==0){ %>
									<span><i class="date-desc">今天</i></span>
									
									<%} %>
									<%dayCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
										<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
										<% url=(request.getAttribute("url")).toString();
									  		arr=url.split(";");
										%>
										<a class="goods-pic-link" target="_blank" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" title="${ins.aab202 }">
											<img src="<%=path%><%=arr[0] %>" class="goods-img"></a>
										</div>
										<a style="visibility:visible;" class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" target="_blank" style="text-align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="<%=path %>/search.html?type=${ins.aab204}" target="_blank" class="match-recom-item">找相似</a>
												
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int yesterdayCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${ins.aaa702 eq yesterday }">
							<div class="goods" style="width:25%;">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(yesterdayCount==0){ %>
									<span><i class="date-desc">昨天</i></span>
									
									<%} %>
									<%yesterdayCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
										<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
										<% url=(request.getAttribute("url")).toString();
									  		arr=url.split(";");
										%>
											<a class="goods-pic-link" target="_blank" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" title="${ins.aab202 }">
												<img src="<%=path%><%=arr[0] %>" class="goods-img"></a>
										</div>
										<a  style="visibility:visible;" class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="<%=path %>/search.html?type=${ins.aab204}" target="_blank" class="match-recom-item">找相似</a>
												
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int weekCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${(ins.aaa702 ge lastWeek)&&(ins.aaa702 lt yesterday) }">
							<div class="goods" style="width:25%;">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(weekCount==0){ %>
									<span><i class="date-desc">一周内</i></span>
									
									<%} %>
									<%weekCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
										<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
										<% url=(request.getAttribute("url")).toString();
									  		arr=url.split(";");
										%>
											<a class="goods-pic-link" target="_blank" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" title="${ins.aab202 }">
												<img src="<%=path%><%=arr[0] %>" class="goods-img"></a>
										</div>
										<a style="visibility:visible;" class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="<%=path %>/search.html?type=${ins.aab204}"  target="_blank" class="match-recom-item">找相似</a>
												
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
						<div class="clear"></div>
						
						<%int monthCount=0; %>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<c:choose>
						<c:when test="${(ins.aaa702 ge lastMonth)&&(ins.aaa702 lt lastWeek)  }">
							<div class="goods" style="width:25%;">
								<div class="goods-date" data-date="${ins.aaa702 }">
									<%if(monthCount==0){ %>
									<span><i class="date-desc">一月内</i></span>
									
									<%} %>
									<%monthCount++; %>
									<s class="line"></s>
								</div>
	
								<div class="goods-box first-box">
									<div class="goods-pic">
										<div class="goods-pic-box">
										<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
										<% url=(request.getAttribute("url")).toString();
									  		arr=url.split(";");
										%>
											<a class="goods-pic-link" target="_blank" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" title="${ins.aab202 }">
												<img src="<%=path%><%=arr[0] %>" class="goods-img"></a>
										</div>
										<a style="visibility:visible;" class="goods-delete" href="javascript:;" onclick="delHistory(${ins.aaa701})">
											<i class="am-icon-trash"></i>
										</a>
										<c:choose>
										<c:when test="${ins.aab212 eq '05'  }">
											<div class="goods-status goods-status-show">
												<span class="desc">宝贝已下架</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="goods-status goods-status-show">
												<span class="desc">查看详情</span>
											</div>
										</c:otherwise>
										</c:choose>
											
									</div>
	
									<div class="goods-attr">
										<div class="good-title">
											<a class="title" href="<%=path%>/shop/detail.html?productId=${ins.aab203 }" target="_blank" style="align:center">${ins.aab202 }</a>
										</div>
										<div class="goods-price">
											<span class="g_price">                                    
	                                        <span>&yen;</span><strong>${ins.aab205 }</strong>
											</span>
											
										</div>
										<div class="clear"></div>
										<div class="goods-num">
											<div class="match-recom">
												<a href="<%=path %>/search.html?type=${ins.aab204}"  target="_blank" class="match-recom-item">找相似</a>
												
												<i><em></em><span></span></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</c:when>
						</c:choose>
						</c:forEach>
						
					</div>
				</div>

				
			</div>

			
		</div>

	</body>

</html>