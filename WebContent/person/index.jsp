<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
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
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--������Ϣ -->

								<div class="m-userinfo">
									<a href="news.html">
										<div class="tipsBox"><i class="am-icon-envelope"></i></div>
									</a>
									<div class="m-baseinfo">
										<a class="m-pic" href="information.html">
											<img src="<%=path%>/images/getAvatar.do.jpg">
										</a>
										<div class="m-info">
											<em class="s-name">С����</em>
											<div class="vip1"><a href="#"><span></span><em>��Աר��</em></a></div>
											<div class="safeText"><a href="safety.html">�˻���ȫ:<em style="margin-left:20px ;">60</em>��</a>
												<div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
											</div>
											<div class="m-address">
												<a href="address.html" class="i-trigger">�ջ���ַ<i class="am-icon-angle-right" style="padding-left:5px ;"></i></a>
											</div>
										</div>
									</div>
									<div class="m-right">
										<div class="m-new">
											<a href="news.html"><i class="am-icon-dropbox  am-icon-md" style="padding-right:5px ;"></i>��Ϣ����</a>
										</div>

									</div>
								</div>

								<!--�����ʲ�-->
								<div class="m-userproperty">
									<div class="s-bar">
										<i class="s-icon"></i>�����ʲ�
									</div>
									<p class="m-coupon">
										<a href="coupon.html">
											<em class="m-num">2</em>
											<span class="m-title">�Ż�ȯ</span>
										</a>
									</p>
									<p class="m-wallet">
										<a href="wallet.html">
											<em class="m-num">0.00</em>
											<span class="m-title">�˻����</span>
										</a>
									</p>
									<p class="m-bill">
										<a href="pointnew.html">
											<em class="m-num">10</em>
											<span class="m-title">�ܻ���</span>
										</a>
									</p>
								</div>

								<!--�ҵ�Ǯ��-->
								<div class="wallet">
									<div class="s-bar">
										<i class="s-icon"></i>�̳�Ǯ��
									</div>
									<p class="m-big squareS">
										<a href="#">
											<i><img src="<%=path%>/images/shopping.png"/></i>
											<span class="m-title">�ܹ���</span>
										</a>
									</p>
									<p class="m-big squareA">
										<a href="#">
											<i><img src="<%=path%>/images/safe.png"/></i>
											<span class="m-title">����ȫ</span>
										</a>
									</p>
									<p class="m-big squareL">
										<a href="#">
											<i><img src="<%=path%>/images/profit.png"/></i>
											<span class="m-title">�����</span>
										</a>
									</p>
								</div>

							</div>
							<div class="box-container-bottom"></div>

							<!--���� -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>�ҵĶ���
									<a class="i-load-more-item-shadow" href="order.html">ȫ������</a>
								</div>
								<ul>
									<li><a href="order.html"><i><img src="<%=path%>/images/pay.png"/></i><span>������</span></a></li>
									<li><a href="order.html"><i><img src="<%=path%>/images/send.png"/></i><span>������<em class="m-num">1</em></span></a></li>
									<li><a href="order.html"><i><img src="<%=path%>/images/receive.png"/></i><span>���ջ�</span></a></li>
									<li><a href="order.html"><i><img src="<%=path%>/images/comment.png"/></i><span>������<em class="m-num">3</em></span></a></li>
									<li><a href="change.html"><i><img src="<%=path%>/images/refund.png"/></i><span>�˻���</span></a></li>

								</ul>
								<div class="orderContentBox">
									<div class="orderContent">
										<div class="orderContentpic">
											<div class="imgBox">
												<a href="orderinfo.html"><img src="<%=path%>/images/youzi.jpg"></a>
											</div>
										</div>
										<div class="detailContent">
											<a href="orderinfo.html" class="delivery">ǩ��</a>
											<div class="orderID">
												<span class="time">2016-03-09</span>
												<span class="splitBorder">|</span>
												<span class="time">21:52:47</span>
											</div>
											<div class="orderID">
												<span class="num">��1����Ʒ</span>
											</div>
										</div>
										<div class="state">������</div>
										<div class="price"><span class="sym">&yen;</span>23.<span class="sym">80</span></div>

									</div>
									<a href="javascript:void(0);" class="btnPay">�ٴι���</a>
								</div>

								<div class="orderContentBox">
									<div class="orderContent">
										<div class="orderContentpic">
											<div class="imgBox">
												<a href="orderinfo.html"><img src="<%=path%>/images/heart.jpg"></a>
											</div>
										</div>
										<div class="detailContent">
											<a href="orderinfo.html" class="delivery">�ɼ�</a>
											<div class="orderID">
												<span class="time">2016-03-09</span>
												<span class="splitBorder">|</span>
												<span class="time">21:52:47</span>
											</div>
											<div class="orderID">
												<span class="num">��2����Ʒ</span>
											</div>
										</div>
										<div class="state">�ѷ���</div>
										<div class="price"><span class="sym">&yen;</span>246.<span class="sym">50</span></div>


									</div>
									<a href="javascript:void(0);" class="btnPay">�ٴι���</a>
								</div>
							</div>
							<!--�Ź���-->
							<div class="user-squaredIcon">
								<div class="s-bar">
									<i class="s-icon"></i>�ҵĳ���
								</div>
								<ul>
									<a href="order.html">
										<li class="am-u-sm-4"><i class="am-icon-truck am-icon-md"></i>
											<p>������ѯ</p>
										</li>
									</a>
									<a href="collection.html">
										<li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i>
											<p>�ҵ��ղ�</p>
										</li>
									</a>
									<a href="foot.html">
										<li class="am-u-sm-4"><i class="am-icon-paw am-icon-md"></i>
											<p>�ҵ��㼣</p>
										</li>
									</a>
									<a href="#">
										<li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i>
											<p>Ϊ���Ƽ�</p>
										</li>
									</a>
									<a href="blog.html">
										<li class="am-u-sm-4"><i class="am-icon-share-alt am-icon-md"></i>
											<p>�ҵķ���</p>
										</li>
									</a>
									<a href="<%=path%>/home/home2.html">
										<li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i>
											<p>��ʱ�</p>
										</li>
									</a>

								</ul>
							</div>

							<div class="user-suggestion">
								<div class="s-bar">
									<i class="s-icon"></i>��Ա����
								</div>
								<div class="s-bar">
									<a href="suggest.html"><i class="s-icon"></i>�������</a>
								</div>
							</div>

							<!--�Ż�ȯ����-->
							<div class="twoTab">
								<div class="twoTabModel Coupon">
									<h5 class="squareTitle"><a href="#"><span class="splitBorder"></span>�Ż�ȯ<i class="am-icon-angle-right"></i></a></h5>
									<div class="Box">
										<div class="CouponList">
											<span class="price">&yen;<strong class="num">50</strong></span>

	                                        <p class="brandName"><a href="#">ABCƷ��499��50</a></p>
	                                        <p class="discount">��<span>499</span>Ԫ�ֿ�</p>
                                            <a  href="#" class="btnReceive">������ȡ</a>
										</div>
									</div>
								</div>
								<div class="twoTabModel credit">
									<h5 class="squareTitle"><a href="#"><span class="splitBorder"></span>�����̳�<i class="am-icon-angle-right"></i></a></h5>
									<div class="Box">
										<p class="countDown">
											<span class="hour">12</span>��<span class="minute">09</span>��<span class="second">02</span><em class="txtStart">������ʼ</em>
										</p>
										<div class="am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:108, itemMargin:3, slideshow: false}">
											<ul class="am-slides">
												<li><a href="#"><img src="<%=path%>/images/333.jpg" /></a></li>
												<li><a href="#"><img src="<%=path%>/images/222.jpg" /></a></li>
												<li><a href="#"><img src="<%=path%>/images/111.jpg" /></a></li>
												<li><a href="#"><img src="<%=path%>/images/333.jpg" /></a></li>
												<li><a href="#"><img src="<%=path%>/images/222.jpg" /></a></li>
												<li><a href="#"><img src="<%=path%>/images/111.jpg" /></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="wrap-right">

						<!-- ����-->
						<div class="day-list">
							<div class="s-title">
								ÿ��������
							</div>
							<div class="s-box">
								<ul>
									<li><a><p>���ͳ���� ��128��18</p></a></li>
									<li><a><p>��ɹ��ô��Ҫ������������</p></a></li>
									<li><a><p>���ջ�����Ĥ�����٣���ѡ������</p></a></li>
									<li><a><p>����ʱ�У�Ħ�ǳ��Σ���������</p></a></li>
									<li><a><p>���ͳ���� ��128��18</p></a></li>
									<li><a><p>���ջ�����Ĥ�����٣���ѡ������</p></a></li>									
								</ul>
							</div>
						</div>
						<!--��Ʒ -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>������Ʒ
								<a class="i-load-more-item-shadow">15����Ʒ</a>
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="#">
									<div class="face-img-panel">
										<img src="<%=path%>/images/imgsearch1.jpg" alt="">
									</div>
									<span class="new-goods-num ">4</span>
									<span class="shop-title">��������</span>
								</a>
								<a class="follow">�ղ�</a>
							</div>
						</div>						

						<!--�����Ƽ� -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>�����Ƽ�
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="#" target="_blank">
									<div >
										<img src="<%=path%>/images/666.jpg" alt="">
									</div>
                                    <span class="one-hot-goods">��189.60</span>
								</a>
							</div>
						</div>						
     				</div>
     				<div class="clear"></div>
     				
     				<!--�ղغ��㼣-->
     				 <div data-am-widget="tabs" class="am-tabs collection">
                         <ul class="am-tabs-nav am-cf">
                         	<li class="am-active"><a href="[data-tab-panel-0]"><i class="am-icon-heart"></i>��Ʒ�ղ�</a></li>
                            <li class=""><a href="[data-tab-panel-1]"><i class="am-icon-paw"></i>�����㼣</a></li>
                        </ul>
                        <div class="am-tabs-bd">

                            <div data-tab-panel-0 class="am-tab-panel am-active">
                        		<div class="am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:155,slideshow: false}">
									<ul class="am-slides">
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/EZA27501.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/BxJk6.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/Hxcag60.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/youzi.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/EZA27501.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/BxJk6.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/Hxcag60.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/youzi.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>

									</ul>
								</div>
                            </div>
                            <div data-tab-panel-1 class="am-tab-panel "> 
                        		<div class="am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:155, slideshow: false}">
									<ul class="am-slides">
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/BxJk6.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/Hxcag60.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/youzi.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/EZA27501.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/BxJk6.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/Hxcag60.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/youzi.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
                                       <li>
                                       	  <a><img class="am-thumbnail" src="<%=path%>/images/EZA27501.jpg" /></a>
                                       	  <strong class="price">&yen;32.9</strong>
                                       </li>
									</ul>
								</div>                            	
                            </div>
                        </div>
                     </div>


				</div>
				<!--�ײ�-->
				<%@ include file="/footer.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="#"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
					<ul>
							<li> <a href="showUserInfo.html">������Ϣ</a></li>
							<li> <a href="<%=path%>/person/safety.jsp">��ȫ����</a></li>
							<li> <a href="showAddress.html">��ַ����</a></li>
							<li> <a href="<%=path%>/person/cardlist.jsp">���֧��</a></li>
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
							<li> <a href="collection.jsp">�ղ�</a></li>
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
		<!--���� -->
		<div class="navCir">
			<li><a href="<%=path%>/home/home2.html"><i class="am-icon-home "></i>��ҳ</a></li>
			<li><a href="<%=path%>/home/sort.html"><i class="am-icon-list"></i>����</a></li>
			<li><a href="<%=path%>/home/shopcart.html"><i class="am-icon-shopping-basket"></i>���ﳵ</a></li>
			<li class="active"><a href="index.html"><i class="am-icon-user"></i>�ҵ�</a></li>
		</div>
	</body>
</html>