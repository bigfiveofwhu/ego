<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>${location}-${key}-搜索页面</title>
	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/seastyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/search.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>
	<%-- <script type="text/javascript" src="<%=path%>/js/jquery-3.2.0.min.js"></script> --%>
	<script type="text/javascript" src="<%=path%>/js/script.js"></script>
	<script type="text/javascript" src="<%=path%>/js/search.js"></script>
</head>
<body>
	<!--顶部导航条 -->
	<%@include file="/localCity/navigate.jsp" %>
	<!--悬浮搜索框-->
	<%@ include file="/localCity/navSearch.jsp" %>
	<div class="clear"></div>
	<b class="line"></b>
         <div class="search">
	<div class="search-list">
		<div class="nav-table">
		   <%@include file="/navClassify.jsp" %>
		</div>
		<div class="am-g am-g-fixed">
			<div class="am-u-sm-12 am-u-md-12">
                <div class="theme-popover">														
				<div class="searchAbout">
					<span class="font-pale">相关搜索：</span>
					<a title="配钥匙" href="#">配钥匙</a>
					<a title="开锁" href="#">开锁</a>
					<a title="买锁" href="#">买锁</a>
				</div>
				<ul class="select">
					<p class="title font-normal">
						<span class="fl">${key }</span>
						<c:if test="${searchSum>0 }">
						<span class="total fl">搜索到<strong class="num">${searchSum}</strong>件相关商品</span>
						</c:if>
						<c:if test="${searchSum==0 }">
						<span class="total fl"><strong class="num">没有搜索到</strong>相关商品</span>
						</c:if>
					</p>
					<div class="clear"></div>
					<form id="gnameForm" method="post">
						<input type="hidden" name="gFrom" id="gFromNameInput">
					</form>
					<div class="clear"></div>
					<%-- 
					<li class="select-list">
						<dl id="select1">
							<dt class="am-badge am-round">品牌</dt>	
							 <div class="dd-conent">										
								<dd class="select-all selected"><a href="#">全部</a></dd>
								<c:forEach items="${GoodsFrom}" var="gFrom">
									<dd><a href="javascript:changGoodsFrom('${gFrom}')" id="brand">${gFrom}</a></dd>
								</c:forEach>
							 </div>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select2">
							<dt class="am-badge am-round">种类</dt>
							<div class="dd-conent">
								<dd class="select-all selected"><a href="#">全部</a></dd>
								<c:forEach items="${goodsInfo}" var="goodsInfo">
								<dd><a href="#" id="brandName" onclick="document.getElementById('searchInput').value=this.innerHTML">${goodsInfo.name}</a></dd>
								</c:forEach> 
							</div>
						</dl>
					</li>--%>
				</ul>
				<div class="clear"></div>
                </div>
				<div class="search-content">
					<div class="sort">
						<li class="first"><a title="综合">综合排序</a></li>
						<li><a title="销量">销量排序</a></li>
						<!-- <form id="priceFrom" method="post">
							<input type="hidden" id="priceId" name="price">
						</form> -->
						<li><a title="价格" href="<%=path%>/search?cmd=sortPrice">价格优先</a></li>
						<li class="big"><a title="评价" href="#">评价为主</a></li>
					</div>
					<div class="clear"></div>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
					<!-- 一个商品信息模板 -->
						<c:forEach items="${services}" var="service" varStatus="i">
						<li>
							<div class="i-pic limit">
								<div id="imgsize">
								<!-- 显示图片详细信息 -->
							<a href="<%=path%>/localCity/detail.html?serviceId=${service.aac202}">
							<img id="service${i.count }" onerror="this.src='/ego/images/01_mid.jpg'"/></a>
								</div>										
								<p class="title fl">【${service.aac203}】</p>
								<p>服务类型:${service.aac104 }</p>
								<p>服务方式:${service.aac105 }</p>
								<p class="price fl">
									<b>&yen;</b>
									<strong>${service.aac206}</strong>
								</p>
								<p class="number fl">
									累积订单<span>10</span>
								</p>
							</div>
						</li>
						<script>
							var service${i.count }='${service.aac210}';
							$("#service${i.count }").attr("src","<%=path%>"+service${i.count }.split(";")[0]);
						</script>
						</c:forEach>
					 </ul>
				</div>
				
				
<%--				<div class="search-side">--%>
<%--					<div class="side-title">--%>
<%--						经典搭配--%>
<%--					</div>--%>
<%--					<li>--%>
<%--						<div class="i-pic check">--%>
<%--							<img src="<%=path%>/images/cp.jpg" />--%>
<%--							<p class="check-title">萨拉米 1+1小鸡腿</p>--%>
<%--							<p class="price fl">--%>
<%--								<b>&yen;</b>--%>
<%--								<strong>29.90</strong>--%>
<%--							</p>--%>
<%--							<p class="number fl">--%>
<%--								销量<span>1110</span>--%>
<%--							</p>--%>
<%--						</div>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<div class="i-pic check">--%>
<%--							<img src="<%=path%>/images/cp2.jpg" />--%>
<%--							<p class="check-title">ZEK 原味海苔</p>--%>
<%--							<p class="price fl">--%>
<%--								<b>&yen;</b>--%>
<%--								<strong>8.90</strong>--%>
<%--							</p>--%>
<%--							<p class="number fl">--%>
<%--								销量<span>1110</span>--%>
<%--							</p>--%>
<%--						</div>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<div class="i-pic check">--%>
<%--							<img src="<%=path%>/images/cp.jpg" />--%>
<%--							<p class="check-title">萨拉米 1+1小鸡腿</p>--%>
<%--							<p class="price fl">--%>
<%--								<b>&yen;</b>--%>
<%--								<strong>29.90</strong>--%>
<%--							</p>--%>
<%--							<p class="number fl">--%>
<%--								销量<span>1110</span>--%>
<%--							</p>--%>
<%--						</div>--%>
<%--					</li> --%>
<%--				</div>--%>
				<div class="clear"></div>
				<!--分页 -->
				<form action="<%=path%>/search" id="advanceForm" method="post">
					<input type="hidden" name="currentPage" id="currentPageInput">
				</form>
				<%-- 
				<ul class="am-pagination am-pagination-right">
					 <li><a href="javascript:goPage(${result.prePage})">&laquo;</a></li>
					<c:forEach begin="${result.index.beginIndex}" end="${result.index.endIndex}" var="index" varStatus="vs">
					<li class="${vs.count==1?'am-active':''}"><a href="javascript:goPage(${index})">${index}</a></li>
					</c:forEach>
					<li><a href="javascript:goPage(${result.nextPage})">&raquo;</a></li>
				</ul>--%>
			</div>
		</div>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	<!--引导 -->
	<%@include file="/bottomGuide.jsp" %>
	<!--菜单 -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>
<div class="theme-popover-mask"></div>
</body>
</html>