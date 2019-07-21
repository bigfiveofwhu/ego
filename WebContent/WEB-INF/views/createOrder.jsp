<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>结算页面</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/jsstyle.css" rel="stylesheet" type="text/css" />	
		<script type="text/javascript" src="<%=path%>/js/address.js"></script>
		<script type="text/javascript">
		function checkAddress(){
			var province=$(".defaultAddr").children(".new-p-re").children(".new-mu_l2cw") .children(".province").text();
			var street=$(".defaultAddr").children(".new-p-re").children(".new-mu_l2cw") .children(".street").text();
			var man=$(".defaultAddr").children(".new-p-re").children(".new-txt").text();
			var phone=$(".defaultAddr").children(".new-p-re").children(".new-txt-rd2").text();
			$("#xx").text(province+street+man+phone);
			$('input[name="aab311"]').val(province+street);
			$('input[name="aab317"]').val(man);
			$('input[name="aab318"]').val(phone);
		}
		</script>

	</head>

	<body>
		<p id="xx"></p>
		<p>${product.aab203 }</p>
		<p>${product.count }</p>
		<p>${product.aab205 }</p>
		<form id="myform" action="###.html" method="post" > 
			<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102")%>"/>
			<input name="aab203" type="hidden" value="${product.aab203 }"/>
			<input name="aab310" type="hidden" value="${product.count }"/>	
			<input name="aab311" type="hidden" value=""/>
			<input name="aab312" type="hidden"/>
			<input name="aab313" type="hidden"/>
			<input name="aab314" type="hidden" value="${product.aab205 }"/>
			<input name="aab316" type="hidden"/>
			<input name="aab317" type="hidden" value=""/>
			<input name="aab318" type="hidden" value=""/>
		</form>



			<div class="clear"></div>
			<div class="concent">
				
				<div class="paycont">
					<!--地址 -->
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul>
							<div class="per-border"></div>
								<c:forEach items="${addrlist }" var="ins" varStatus="vs">
							 	<c:choose>
								   <c:when test="${ins.aaa407 > 0 }">
								   <li id="myAddress" class="user-addresslist defaultAddr">
								   </c:when>
								   <c:otherwise>
								   <li id="myAddress" class="user-addresslist">
								   </c:otherwise>
							    </c:choose>
								<span class="new-option-r" value="${ins.aaa401 }"><i class="am-icon-check-circle"></i>默认地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${ins.aaa405 }</span>
									<span class="new-txt-rd2">${ins.aaa406}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址:</span>
										<span class="province">${ins.aaa402 }</span>
										<span class="street">${ins.aaa403 }</span>
									</p>
								</div>
								<div class="new-addr-btn">
									<a onclick="window.location.href='<%=path %>/person/editAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a onclick="window.location.href='<%=path%>/person/deleteAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);" ><i class="am-icon-trash"></i>删除</a>
								</div>
									</li>
							</c:forEach>

						</ul>
						<div class="clear"></div>
					</div>
					
					
					<div class="clear"></div>
					<a href="javascript:;" onclick="checkAddress()">确认233333333333333333333333</a>
					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">金额</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">运费</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
							
							<tr class="item-list">
								<div class="bundle  bundle-last">
									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${product.aab202 }</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">颜色：12#川南玛瑙</span>
														<span class="sku-line">包装：裸装</span>
													</div>
													<script type="text/javascript">
														$(function(){
															var proArgs='${product.args}';
															proArgs=proArgs.split(";");
															var n=proArgs.length;
															var html="";
															for(var i=0;i<n;i++){
																html+="<span class='sku-line'>"+proArgs[i].replace(",",": ")+"&emsp;</span>"
															}
															$(".item-props").html(html);
														});
													</script>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${product.aab205 }</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<input class="text_box" readonly="readonly" type="text" value="${product.count}" style="width:30px;" />
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${product.aab205*product.count}</em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														快递<b class="sys_item_freprice">${product.fee}</b>元
													</div>
												</div>
											</li>
										</ul>
										<div class="clear"></div>
									</div>
								</div>	
							</tr>
							<div class="clear"></div>
							
							<%--
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
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">颜色：12#川南玛瑙</span>
														<span class="sku-line">包装：裸装</span>
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
														<span class="phone-title">购买数量</span>
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
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														快递<b class="sys_item_freprice">10</b>元
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
															<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line">颜色：10#蜜橘色+17#樱花粉</span>
														<span class="sku-line">包装：两支手袋装（送彩带）</span>
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
														<span class="phone-title">购买数量</span>
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
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														包邮
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
								</div>
							</tr>
							
							<div class="clear"></div> --%>
							
							<div class="pay-total">
								<!--留言-->
								<div class="order-extra">
									<div class="order-user-info">
										<div id="holyshit257" class="memo">
											<label>买家留言：</label>
											<input type="text" 
												   title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" 
												   placeholder="选填,建议填写和卖家达成一致的说明" 
												   class="memo-input J_MakePoint c2c-text-default memo-close">
											<div class="msg hidden J-msg">
												<p class="error">最多输入500个字符</p>
											</div>
										</div>
									</div>
	
								</div>
								<!--优惠券 -->
								<div class="buy-agio">
									<li class="td td-coupon">
	
										<span class="coupon-title">优惠券</span>
										<select data-am-selected>
											<option value="a">
												<div class="c-price">
													<strong>￥8</strong>
												</div>
												<div class="c-limit">
													【消费满195元可用】
												</div>
											</option>
											<option value="b" selected>
												<div class="c-price">
													<strong>￥3</strong>
												</div>
												<div class="c-limit">
													【无使用门槛】
												</div>
											</option>
										</select>
									</li>
	
								</div>
							</div>
							
							<div class="clear"></div>
							
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>&yen;</span><em class="pay-sum">244.00</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>&yen;</span> <em class="style-large-bold-red " id="J_ActualFee">244.00</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
								   <span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user">艾迪 </span>
												<span class="buy-phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="success.html" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				<%@include file="/footer.jsp" %>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">浙江省</option>
									<option value="b">湖北省</option>
								</select>
								<select data-am-selected>
									<option value="a">温州市</option>
									<option value="b">武汉市</option>
								</select>
								<select data-am-selected>
									<option value="a">瑞安区</option>
									<option value="b">洪山区</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>

</html>