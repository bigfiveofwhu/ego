<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�ۺ�����</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/refstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--���������� -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">�ף����¼</a>
									<a href="#" target="_top">���ע��</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">�̳���ҳ</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>��������</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>���ﳵ</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>�ղؼ�</span></a></div>
						</ul>
						</div>

						<!--����������-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=path%>/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="����" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="����" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">ȫ������</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">��ҳ</a></li>
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
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<!--���� -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�ۺ�����</strong> / <small>Refund&nbsp;Detail</small></div>
					</div>
					<hr/>
					<div class="comment-list">

						<div class="record-aside">
							<div class="item-pic">
								<a href="#" class="J_MakePoint">
									<img src="<%=path%>/images/comment.jpg_400x400.jpg" class="itempic">
								</a>
							</div>

							<div class="item-title">

								<div class="item-name">
									<a href="#">
										<p class="item-basic-info">${ins.aab202 }</p>
									</a>
								</div>
								<div class="info-little">
									<span>��Ʒid:${ins.aab203 }</span>
									<span>����2:����</span>
								</div>
							</div>
							<div class="clear"></div>
							<div class="item-info">
								<div class="item-ordernumber">
									<span class="info-title">�˿��ţ�</span><a>${ins.aaa802 }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">�˿����ͣ�</span><a>${ins.aaa804 }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">�˿�ԭ��</span><a>${ins.aaa806 }</a>
								</div>
								<div class="item-ordernumber">
									<span class="info-title">ԭ��������</span><a>${ins.aaa805 }</a>
								</div>

								<div class="item-time">
									<span class="info-title">����ʱ�䣺</span><span class="time">${ins.aaa807 }</span>
								</div>

							</div>
							<div class="clear"></div>
						</div>
						
						<%double spend=0; %>
						<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
					    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
					    <%  spend=Double.valueOf((String)request.getAttribute("number"))
					    				*Double.valueOf((String)request.getAttribute("price")); 
					    %>
						<div class="record-main">
							<div class="detail-list refund-process">
							    <div class="fund-tool">�˿���</div>
								<div class="money"><%=spend %></div>
							</div>
							<div class="clear"></div>
							<!--������-->
							<div class="m-progress" style="height: 100px;">
								<div class="m-progress-list">
									<span class="step-1 step">
		                                <em class="u-progress-stage-bg"></em>
		                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
		                                <p class="stage-name">�����ύ </p>
		                                <p class="stage-name">${ins.aaa807 }</p>
		                            </span>
		                            
		                            <c:choose>
			                            <c:when test="${ins.aaa803 eq '01' }">
			                            	<span class="step-2 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
				                                <p class="stage-name">�̼Ҵ���</p>
				                                <p class="stage-name"><br/><br/></p>
			                            	</span>
			                            </c:when>
			                            <c:otherwise>
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
				                                <p class="stage-name">�̼Ҵ���</p>
				                                <p class="stage-name">${ins.aaa808 }</p>
			                            	</span>
			                            </c:otherwise>
		                            </c:choose>
									
									<c:choose>
			                            <c:when test="${ins.aaa803 eq '03' }">
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">�˿�ɹ�</p>
				                                <p class="stage-name">${ins.aaa809 }</p>
				                            </span>
			                            </c:when>
			                            <c:when test="${ins.aaa803 eq '04' }">
			                            	<span class="step-1 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">�˿�ܾ�</p>
				                                <p class="stage-name">${ins.aaa809 }</p>
				                            </span>
			                            </c:when>
			                            <c:otherwise>
			                            	<span class="step-3 step">
				                                <em class="u-progress-stage-bg"></em>
				                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
				                                <p class="stage-name">�˿�ɹ�</p>
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

				<!--�ײ�-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">�����Ƽ�</a>
							<b>|</b>
							<a href="#">�̳���ҳ</a>
							<b>|</b>
							<a href="#">֧����</a>
							<b>|</b>
							<a href="#">����</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">���ں���</a>
							<a href="#">�������</a>
							<a href="#">��ϵ����</a>
							<a href="#">��վ��ͼ</a>
							<em>&copu;2015-2025 Hengwang.com ��Ȩ����. ����ģ�� <a href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��">ģ��֮��</a> - Collect from <a href="http://www.cssmoban.com/" title="��ҳģ��" target="_blank">��ҳģ��</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
						<ul>
							<li> <a href="information.html">������Ϣ</a></li>
							<li> <a href="safety.html">��ȫ����</a></li>
							<li> <a href="address.html">��ַ����</a></li>
							<li> <a href="cardlist.html">���֧��</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵĽ���</p>
						<ul>
							<li><a href="order.html">��������</a></li>
							<li> <a href="change.html">�˿��ۺ�</a></li>
							<li> <a href="comment.html">������Ʒ</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>�ҵ��ʲ�</p>
						<ul>
							<li> <a href="points.html">�ҵĻ���</a></li>
							<li> <a href="coupon.html">�Ż�ȯ </a></li>
							<li> <a href="bonus.html">���</a></li>
							<li> <a href="walletlist.html">�˻����</a></li>
							<li> <a href="bill.html">�˵���ϸ</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>�ҵ��ղ�</p>
						<ul>
							<li> <a href="collection.html">�ղ�</a></li>
							<li> <a href="foot.html">�㼣</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>���߿ͷ�</p>
						<ul>
							<li> <a href="consultation.html">��Ʒ��ѯ</a></li>
							<li> <a href="suggest.html">�������</a></li>							
							
							<li> <a href="news.html">�ҵ���Ϣ</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>