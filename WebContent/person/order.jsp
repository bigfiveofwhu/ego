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
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
		

					<div class="user-order">

						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">���ж���</a></li>
								<li><a href="#tab2">������</a></li>
								<li><a href="#tab3">������</a></li>
								<li><a href="#tab4">���ջ�</a></li>
								<li><a href="#tab5">������</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">��Ʒ����</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">�ϼ�</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											
											<!--���׳ɹ�-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">���׳ɹ�</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	ɾ������</div>
															</li>
														</div>
													</div>
												</div>
											</div>
											
											
											
											<!--����ʧ��-->
											<div class="order-status0">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">���׹ر�</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	ɾ������</div>
															</li>
														</div>
													</div>
												</div>
											</div>											
											
											<!--������-->
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">����Ѹ���</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	���ѷ���</div>
															</li>
														</div>
													</div>
												</div>
											</div>

											<!--��ͬ״̬����-->
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">�����ѷ���</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																	<p class="order-info"><a href="#">�ӳ��ջ�</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	ȷ���ջ�</div>
															</li>
														</div>
													</div>
												</div>

											</div>

										</div>

									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">��Ʒ����</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">�ϼ�</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">�ȴ���Ҹ���</p>
																	<p class="order-info"><a href="#">ȡ������</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	һ��֧��</div></a>
															</li>
														</div>
													</div>

												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">��Ʒ����</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">�ϼ�</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�</a>
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">����Ѹ���</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	���ѷ���</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">��Ʒ����</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">�ϼ�</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">�����ѷ���</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																	<p class="order-info"><a href="#">�ӳ��ջ�</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	ȷ���ջ�</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">��Ʒ</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">����</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">��Ʒ����</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">�ϼ�</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">����״̬</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">���ײ���</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!--��ͬ״̬�Ķ���	-->
										<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>

												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">���׳ɹ�</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="commentlist.html">
																	<div class="am-btn am-btn-danger anniu">
																		������Ʒ</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</div>
											
											
											<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">������ţ�<a href="javascript:;">1601430</a></div>
													<span>�ɽ�ʱ�䣺2015-12-20</span>
													<!--    <em>���̣�С�۵�</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>

														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/62988.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>�������Ů�ﶬ ������Ӻ� �����ɰ� </p>
																			<p class="info-little">��ɫ���ࣺ������
																				<br/>���룺����</p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>
														
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>���������������� �־ñ�ʪ�����ˮ����ɫ</p>
																			<p class="info-little">��ɫ��12#�������
																				<br/>��װ����װ </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	333.00
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>��</span>2
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">�˿�/�˻�</a>
																</div>
															</li>
														</ul>
														

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																�ϼƣ�676.00
																<p>���˷ѣ�<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">���׳ɹ�</p>
																	<p class="order-info"><a href="orderinfo.html">��������</a></p>
																	<p class="order-info"><a href="logistics.html">�鿴����</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="commentlist.html">
																	<div class="am-btn am-btn-danger anniu">
																		������Ʒ</div>
																</a>
															</li>
														</div>
													</div>
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