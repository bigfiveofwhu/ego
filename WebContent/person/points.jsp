<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
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
	</body>

</html>