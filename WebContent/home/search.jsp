<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>����ҳ��</title>

	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/seastyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/search.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>
	<%-- <script type="text/javascript" src="<%=path%>/js/jquery-3.2.0.min.js"></script> --%>
	<script type="text/javascript" src="<%=path%>/js/script.js"></script>
	<script type="text/javascript" src="<%=path%>/js/search.js"></script>
</head>
<body>
	<!--���������� -->
	<%@include file="/navigate.jsp" %>
	<!--����������-->
	<div class="nav white">
		<div class="logo"><img src="<%=path%>/images/logo.png" /></div>
		<div class="logoBig">
			<li><img src="<%=path%>/images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="<%=path%>/search.html" method="post"><!-- -------�ύ��sevlet�������� -->
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="����" 
				 autocomplete="off" value="${gbrank}">
				<input id="ai-topsearch" class="submit am-btn"  value="����" index="1" type="submit">
			</form>
		</div>
	</div>
	<div class="clear"></div>
	<b class="line"></b>
         <div class="search">
	<div class="search-list">
		<div class="nav-table">
		   <div class="long-title"><span class="all-goods">ȫ������</span></div>
		   <div class="nav-cont">
			<ul>
				<li class="index"><a href="home/home.jsp">��ҳ</a></li>
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
		<div class="am-g am-g-fixed">
			<div class="am-u-sm-12 am-u-md-12">
                <div class="theme-popover">														
				<div class="searchAbout">
					<span class="font-pale">���������</span>
					<a title="���" href="#">���</a>
					<a title="����" href="#">����</a>
					<a title="����" href="#">����</a>
				</div>
				<ul class="select">
					<p class="title font-normal">
						<span class="fl">����</span>
						<span class="total fl">������<strong class="num">997</strong>�������Ʒ</span>
					</p>
					<div class="clear"></div>
					<form id="gnameForm" method="post">
						<input type="hidden" name="gFrom" id="gFromNameInput">
					</form>
					<div class="clear"></div>
					<li class="select-list">
						<dl id="select1">
							<dt class="am-badge am-round">Ʒ��</dt>	
							 <div class="dd-conent">										
								<dd class="select-all selected"><a href="#">ȫ��</a></dd>
								<c:forEach items="${GoodsFrom}" var="gFrom">
									<dd><a href="javascript:changGoodsFrom('${gFrom}')" id="brand">${gFrom}</a></dd>
								</c:forEach>
							 </div>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select2">
							<dt class="am-badge am-round">����</dt>
							<div class="dd-conent">
								<dd class="select-all selected"><a href="#">ȫ��</a></dd>
								<c:forEach items="${goodsInfo}" var="goodsInfo">
								<dd><a href="#" id="brandName" onclick="document.getElementById('searchInput').value=this.innerHTML">${goodsInfo.name}</a></dd>
								</c:forEach> 
							</div>
						</dl>
					</li>
				</ul>
				<div class="clear"></div>
                </div>
				<div class="search-content">
					<div class="sort">
						<li class="first"><a title="�ۺ�">�ۺ�����</a></li>
						<li><a title="����">��������</a></li>
						<!-- <form id="priceFrom" method="post">
							<input type="hidden" id="priceId" name="price">
						</form> -->
						<li><a title="�۸�" href="<%=path%>/search?cmd=sortPrice">�۸�����</a></li>
						<li class="big"><a title="����" href="#">����Ϊ��</a></li>
					</div>
					<div class="clear"></div>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
					<!-- һ����Ʒ��Ϣģ�� -->
						<c:forEach items="${result.listData}" var="goods">
						<li>
							<div class="i-pic limit">
								<div id="imgsize">
								<!-- ��ʾͼƬ��ϸ��Ϣ -->
							<a href="<%=path%>/intrServlet?goodId=${goods.id}"><img src="${goods.path}"/></a>
							<%-- <a href="<%=path%>/intrServlet?goodId=${goods.id}"><img src="E:/tomcat/apache-tomcat-7.0.57-windows-x64/apache-tomcat-7.0.57/webapps/shoppingPro/images/01.jpg"/></a> --%> 
								</div>										
								<p class="title fl">��${goods.goodsFrom}�콢�꡿${goods.name}${goods.introduce}</p>
								<p class="price fl">
									<b>&yen;</b>
									<strong>${goods.costprice}</strong>
								</p>
								<p class="number fl">
									����<span>1110</span>
								</p>
							</div>
						</li>
						</c:forEach>
					 </ul>
				</div>
				<div class="search-side">
					<div class="side-title">
						�������
					</div>
					<li>
						<div class="i-pic check">
							<img src="<%=path%>/images/cp.jpg" />
							<p class="check-title">������ 1+1С����</p>
							<p class="price fl">
								<b>&yen;</b>
								<strong>29.90</strong>
							</p>
							<p class="number fl">
								����<span>1110</span>
							</p>
						</div>
					</li>
					<li>
						<div class="i-pic check">
							<img src="<%=path%>/images/cp2.jpg" />
							<p class="check-title">ZEK ԭζ��̦</p>
							<p class="price fl">
								<b>&yen;</b>
								<strong>8.90</strong>
							</p>
							<p class="number fl">
								����<span>1110</span>
							</p>
						</div>
					</li>
					<li>
						<div class="i-pic check">
							<img src="<%=path%>/images/cp.jpg" />
							<p class="check-title">������ 1+1С����</p>
							<p class="price fl">
								<b>&yen;</b>
								<strong>29.90</strong>
							</p>
							<p class="number fl">
								����<span>1110</span>
							</p>
						</div>
					</li> 
				</div>
				<div class="clear"></div>
				<!--��ҳ -->
				<form action="<%=path%>/search" id="advanceForm" method="post">
					<input type="hidden" name="currentPage" id="currentPageInput">
				</form>
				<ul class="am-pagination am-pagination-right">
					 <%-- <li class="am-disabled">
					 <a href="javascript:goPage(${result.prePage})">&laquo;</a></li> --%>
					 <li><a href="javascript:goPage(${result.prePage})">&laquo;</a></li>
					<!--  <li class="am-active"><a href="#">1</a></li> -->
					<c:forEach begin="${result.index.beginIndex}" end="${result.index.endIndex}" var="index" varStatus="vs">
					<li class="${vs.count==1?'am-active':''}"><a href="javascript:goPage(${index})">${index}</a></li>
					</c:forEach>
					<li><a href="javascript:goPage(${result.nextPage})">&raquo;</a></li>
				</ul>
				</form>
			</div>
		</div>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	<!--���� -->
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>��ҳ</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>����</a></li>
		<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>���ﳵ</a></li>	
		<li><a href="../person/index.html"><i class="am-icon-user"></i>�ҵ�</a></li>					
	</div>
	<!--�˵� -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>
<div class="theme-popover-mask"></div>
</body>
</html>