<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>����ҳ��</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="<%=path%>/css/jsstyle.css" rel="stylesheet" type="text/css" />	

		<script type="text/javascript" src="<%=path%>/js/address.js"></script>

	</head>

	<body>

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
				<div class="logo"><img src="<%=path%>/images/logo.png" /></div>
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
			<div class="concent">
				
				<div class="paycont">
					<!--��ַ -->
					<div class="address">
						<h3>ȷ���ջ���ַ </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">ʹ���µ�ַ</div>
						</div>
						<div class="clear"></div>
						<ul>
							<div class="per-border"></div>
							<li class="user-addresslist defaultAddr">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   
                   						<span class="buy-user">���� </span>
										<span class="buy-phone">15888888888</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">�ջ���ַ��</span>
										<span class="buy--address-detail">
								   		<span class="province">����</span>ʡ
										<span class="city">�人</span>��
										<span class="dist">��ɽ</span>��
										<span class="street">�۳����666��(���ϲƾ�������ѧ)</span>
										</span>

									</div>
									<ins class="deftip">Ĭ�ϵ�ַ</ins>
								</div>
								<div class="address-right">
									<a href="<%=path%>/person/address.html">
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#" class="hidden">��ΪĬ��</a>
									<span class="new-addr-bar hidden">|</span>
									<a href="#">�༭</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);">ɾ��</a>
								</div>

							</li>
							<div class="per-border"></div>
							<li class="user-addresslist">
								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   
                   						<span class="buy-user">���� </span>
										<span class="buy-phone">15877777777</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">�ջ���ַ��</span>
										<span class="buy--address-detail">
								   		<span class="province">����</span>ʡ
										<span class="city">�人</span>��
										<span class="dist">���</span>��
										<span class="street">����·75���ڻ�����9��9��999</span>
										</span>

										</span>
									</div>
									<ins class="deftip hidden">Ĭ�ϵ�ַ</ins>
								</div>
								<div class="address-right">
									<span class="am-icon-angle-right am-icon-lg"></span>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#">��ΪĬ��</a>
									<span class="new-addr-bar">|</span>
									<a href="#">�༭</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);"  onclick="delClick(this);">ɾ��</a>
								</div>

							</li>

						</ul>
						<div class="clear"></div>
					</div>
					
					<!--���� -->
					<div class="logistics">
						<h3>ѡ��������ʽ</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>Բͨ<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>��ͨ<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>�ϴ�<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>��ͨ<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>˳��<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--֧����ʽ-->
					<div class="logistics">
						<h3>ѡ��֧����ʽ</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="<%=path%>/images/wangyin.jpg" />����<span></span></li>
							<li class="pay qq"><img src="<%=path%>/images/weizhifu.jpg" />΢��<span></span></li>
							<li class="pay taobao"><img src="<%=path%>/images/zhifubao.jpg" />֧����<span></span></li>
						</ul>
					</div>
					
					<div class="clear"></div>

					<!--���� -->
					<div class="concent">
						<div id="payTable">
							<h3>ȷ�϶�����Ϣ</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">��Ʒ��Ϣ</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">����</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">����</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">���</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">�˷�</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
							<c:choose>
							<c:when test="1==1">
							<c:forEach items="">
							</c:forEach>
							
							</c:when>
							</c:choose>

							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">���������������� �־ñ�ʪ�����ˮ����ɫ</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">��ɫ��12#�������</span>
														<span class="sku-line">��װ����װ</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">39.00</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">��������</span>
														<div class="sl">
															
															<input class="text_box" readonly="readonly" type="text" value="3" style="width:30px;" />
															
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">117.00</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">���ͷ�ʽ</span>
													<div class="pay-logis">
														���<b class="sys_item_freprice">10</b>Ԫ
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
								</div>	
							</tr>
							
							<div class="clear"></div>

							<tr class="item-list">
								<div class="bundle  bundle-last">
									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" target="_blank" title="���������������� �־ñ�ʪ�����ˮ����ɫ" class="item-title J_MakePoint" data-point="tbcart.8.11">���������������� �־ñ�ʪ�����ˮ����ɫ</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">��ɫ��10#����ɫ+17#ӣ����</span>
														<span class="sku-line">��װ����֧�ִ�װ���Ͳʴ���</span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">39.00</em>
														</div>
													</div>
												</li>
											</div>

											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">��������</span>
														<div class="sl">
															<input class="min am-btn" name="" type="button" value="-" />
															<input class="text_box" name="" type="text" value="3" style="width:30px;" />
															<input class="add am-btn" name="" type="button" value="+" />
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">117.00</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">���ͷ�ʽ</span>
													<div class="pay-logis">
														����
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
								</div>
							</tr>
							
							<div class="clear"></div>
							
							<div class="pay-total">
								<!--����-->
								<div class="order-extra">
									<div class="order-user-info">
										<div id="holyshit257" class="memo">
											<label>������ԣ�</label>
											<input type="text" title="ѡ��,�Ա��ν��׵�˵����������д�Ѿ������Ҵ��һ�µ�˵����" placeholder="ѡ��,������д�����Ҵ��һ�µ�˵��" class="memo-input J_MakePoint c2c-text-default memo-close">
											<div class="msg hidden J-msg">
												<p class="error">�������500���ַ�</p>
											</div>
										</div>
									</div>
	
								</div>
								<!--�Ż�ȯ -->
								<div class="buy-agio">
									<li class="td td-coupon">
	
										<span class="coupon-title">�Ż�ȯ</span>
										<select data-am-selected>
											<option value="a">
												<div class="c-price">
													<strong>��8</strong>
												</div>
												<div class="c-limit">
													��������95Ԫ���á�
												</div>
											</option>
											<option value="b" selected>
												<div class="c-price">
													<strong>��3</strong>
												</div>
												<div class="c-limit">
													����ʹ���ż���
												</div>
											</option>
										</select>
									</li>
	
									<li class="td td-bonus">
	
										<span class="bonus-title">���</span>
										<select data-am-selected>
											<option value="a">
												<div class="item-info">
													&yen;50.00<span>Ԫ</span>
												</div>
												<div class="item-remainderprice">
													<span>��ʣ</span>10.40<span>Ԫ</span>
												</div>
											</option>
											<option value="b" selected>
												<div class="item-info">
													&yen;50.00<span>Ԫ</span>
												</div>
												<div class="item-remainderprice">
													<span>��ʣ</span>50.00<span>Ԫ</span>
												</div>
											</option>
										</select>
									</li>
								</div>
							</div>
							
							<div class="clear"></div>
							
							<!--���˷�С�� -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									�ϼƣ����˷ѣ� <span>&yen;</span><em class="pay-sum">244.00</em>
								</p>
							</div>

							<!--��Ϣ -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">ʵ���</em>
											<span class="price g_price ">
                                    <span>&yen;</span> <em class="style-large-bold-red " id="J_ActualFee">244.00</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">��������</span>
												<span class="buy--address-detail">
								   <span class="province">����</span>ʡ
												<span class="city">�人</span>��
												<span class="dist">��ɽ</span>��
												<span class="street">�۳����666��(���ϲƾ�������ѧ)</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">�ջ��ˣ�</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user">���� </span>
												<span class="buy-phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="success.html" class="btn-go" tabindex="0" title="����˰�ť���ύ����">�ύ����</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
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
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--���� -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">������ַ</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">�ջ���</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="�ջ���">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">�ֻ�����</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="�ֻ��ű���" type="email">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">���ڵ�</label>
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">�㽭ʡ</option>
									<option value="b">����ʡ</option>
								</select>
								<select data-am-selected>
									<option value="a">������</option>
									<option value="b">�人��</option>
								</select>
								<select data-am-selected>
									<option value="a">����</option>
									<option value="b">��ɽ��</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">��ϸ��ַ</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="������ϸ��ַ"></textarea>
								<small>100������д�������ϸ��ַ...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger">����</div>
								<div class="am-btn am-btn-danger close">ȡ��</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>

</html>