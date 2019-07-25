<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>��������</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/vipstyle.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/hmstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="<%=path%>/js/iframe.js"></script>
		
	</head>
	<body>
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--���������� -->
					<%@ include file="/navigate.jsp" %>
					<!--����������-->
					<%@include file="/navSearch.jsp" %>
					<div class="clear"></div>
				</div>
			</article>
		</header>
		<div class="nav-table">
			<%@include file="/navClassify.jsp" %>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
				<!--���� -->
				<div class="am-cf am-padding">
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src=""></iframe>
			    </div>								
				</div>
				<!--�ײ�-->
				<%@ include file="/footer.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="<%=path %>/person/home.jsp" target="iframe"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person" >
						<p><i class="am-icon-newspaper-o"></i>��������</p>

					<ul>
						    <li> <a href="<%=path %>/person/showUserInfo.html" target="iframe">������Ϣ</a></li>
							<li> <a href="<%=path%>/person/safety.jsp" target="iframe">��ȫ����</a></li>
							<li> <a href="<%=path%>/person/showAddress.html" target="iframe">��ַ����</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵĽ���</p>
						<ul>
							<li><a href="<%=path %>/showOrder.html" target="iframe">��������</a></li>
							<li> <a href="<%=path %>/showRefund.html" target="iframe">�˿��ۺ�</a></li>
							<li> <a href="<%=path %>/showComment.html" target="iframe">�ҵ�����</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵķ���</p>
						<ul>
							<li><a href="<%=path %>/goPostNeed.html" target="iframe">��������</a></li>
							<li> <a href="<%=path %>/showNeed.html" target="iframe">��ʷ����</a></li>
							<li> <a href="<%=path %>/showServiceOrder.html" target="iframe">���񶩵�</a></li>
							<li> <a href="<%=path %>/showServiceComment.html" target="iframe">��������</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>�ҵ��ʲ�</p>
						<ul>
							<li> <a href="<%=path %>/showPoint.html" target="iframe">�ҵĻ���</a></li>
							<li> <a href="<%=path %>/discount/getCustomerCoupons.html" target="iframe">�Ż�ȯ </a></li>
							<li> <a href="<%=path %>/report/userReport.html?type=1" target="iframe">��ˮ����</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>�ҵ��ղ�</p>
						<ul>
							<li> <a href="<%=path %>/person/showCollection.html" target="iframe">�ղ�</a></li>
							<li> <a href="<%=path %>/showHistory.html" target="iframe">�㼣</a></li>														
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>���߿ͷ�</p>
						<ul>
						<!--  
							<li> <a href="<%=path %>/person/consultation.jsp" target="iframe">��Ʒ��ѯ</a></li>
							<li> <a href="<%=path %>/person/suggest.jsp" target="iframe">�������</a></li>							
						-->
							<li> <a href="<%=path %>/message/readMessage.html" target="iframe">�ҵ���Ϣ</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>
		<!--���� -->
		<%@include file="/bottomGuide.jsp" %>
	</body>
	<script type="text/javascript">
	window.onload=function(){
		var ors = window.location.search.match(/(?:\?|&)iframe=([^&]+)/);
		if (ors) {
		    document.getElementById("iframe").src = ors[1];
		}
		else
			 document.getElementById("iframe").src = "<%=path %>/person/home.jsp";
		}
	

	</script>

</html>