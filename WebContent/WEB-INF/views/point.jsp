<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>������ϸ</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/point.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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
					<div class="points">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�ҵĻ���</strong> / <small>My&nbsp;Point</small></div>
						</div>
						<hr/>
						<div class="pointsTitle">
						   <div class="usable">���û���<span>120</span></div>
						   <div class="pointshop"><a href="#"><i><img src="<%=path%>/images/u5.png" /></i>�����̳�</a></div>
						   <div class="signIn"><a href="#"><i class="am-icon-calendar"></i><em>+5</em>ÿ��ǩ��</a></div>
						</div>
						<div class="pointlist am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">ȫ��</a></li>
								<li><a href="#tab2">���</a></li>
								<li><a href="#tab3">֧��</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">��������</th>
												<th class="th2">���ֱ䶯</th>
												<th class="th3">����</th>
											</tr>
										</thead>										
										<tbody>
											<tr>
												<td class="pointType">���ֶһ�</td>
												<td class="pointNum">-80</td>
												<td class="pointTime">2016-03-10&nbsp15:27</td>
											</tr>
											<tr>
												<td class="pointType">������7745926347132��Ʒ����</td>
												<td class="pointNum">+2</td>
												<td class="pointTime">2016-03-12&nbsp09:32</td>
											</tr>
											<tr>
												<td class="pointType">ÿ��ǩ��</td>
												<td class="pointNum">+5</td>
												<td class="pointTime">2016-03-12&nbsp07:32</td>
											</tr>
											<tr>
												<td class="pointType">ÿ��ǩ��</td>
												<td class="pointNum">+5</td>
												<td class="pointTime">2016-03-11&nbsp12:24</td>
											</tr>
											<tr>
												<td class="pointType">������֤</td>
												<td class="pointNum">+50</td>
												<td class="pointTime">2016-03-10&nbsp16:18</td>
											</tr>
											<tr>
												<td class="pointType">�ֻ���</td>
												<td class="pointNum">+100</td>
												<td class="pointTime">2016-03-10&nbsp15:27</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">��������</th>
												<th class="th2">��ȡ����</th>
												<th class="th3">����</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="pointType">������7745926347132��Ʒ����</td>
												<td class="pointNum">+2</td>
												<td class="pointTime">2016-03-12&nbsp09:32</td>
											</tr>
											<tr>
												<td class="pointType">ÿ��ǩ��</td>
												<td class="pointNum">+5</td>
												<td class="pointTime">2016-03-12&nbsp07:32</td>
											</tr>
											<tr>
												<td class="pointType">ÿ��ǩ��</td>
												<td class="pointNum">+5</td>
												<td class="pointTime">2016-03-11&nbsp12:24</td>
											</tr>
											<tr>
												<td class="pointType">������֤</td>
												<td class="pointNum">+50</td>
												<td class="pointTime">2016-03-10&nbsp16:18</td>
											</tr>
											<tr>
												<td class="pointType">�ֻ���</td>
												<td class="pointNum">+100</td>
												<td class="pointTime">2016-03-10&nbsp15:27</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<table>
										<b></b>
										<thead>
											<tr>												
												<th class="th1">��������</th>
												<th class="th2">���Ļ���</th>
												<th class="th3">����</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="pointType">���ֶһ�</td>
												<td class="pointNum">-300</td>
												<td class="pointTime">2016-03-10&nbsp15:27</td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>

						</div>
					</div>
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
							<em>&copy; 2015-2025 Hengwang.com ��Ȩ����. ����ģ�� <a href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��">ģ��֮��</a> - Collect from <a href="http://www.cssmoban.com/" title="��ҳģ��" target="_blank">��ҳģ��</a></em>
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