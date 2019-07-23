<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>购物车页面</title>
<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/basic/css/demo.css" rel="stylesheet"  type="text/css" />
<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/optstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/hmstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/ajax.js"></script>
</head>
<body>
	<!--顶部导航条 -->
	<%@include file="/navigate.jsp" %>
	<!--悬浮搜索框-->
	<%@include file="/navSearch.jsp" %>
	<div class="clear"></div>
	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
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
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>

			<c:forEach items="${shopCart}" var="cart" varStatus="vs">
				<div class="clear"></div>
				<tr class="item-list">
					<div class="bundle  bundle-last " id="rows-${vs.count }">
						<div class="clear"></div>
						<div class="bundle-main">
							<ul class="item-content clearfix">
								<li class="td td-chk">
									<div class="cart-checkbox ">
										<input class="check" id="J_CheckBox_${cart.aab203}" name="items[]" value="${cart.aab203}" type="checkbox"
											onchange="selectCart(true)">
										<label for="J_CheckBox_170037950254"></label>
									</div>
								</li>
								<li class="td td-item">
									<div class="item-pic">
										<a href="#" target="_blank"
											data-title="${cart.aab202}"
											class="J_MakePoint" data-point="tbcart.8.12"> 
											<img id="p9826_${vs.count }" src="" class="itempic J_ItemImg"
											style="height: 80px;width: 80px;">
										</a>
										<script type="text/javascript">
											var p9826_${vs.count }='${cart.aab208}';
											$("#p9826_${vs.count }").attr("src","/ego"+p9826_${vs.count }.split(";")[0]);
										</script>
									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<a href="#" target="_blank"
												title="${cart.aab202}"
												class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.aab202}</a>
										</div>
									</div>
								</li>
								<li class="td td-info">
									<div class="item-props item-props-can" id="describe${vs.count }"> 
									<%-- 
										<span class="sku-line">口味：${cart.property}</span> 
										<span class="sku-line">包装：${cart.packing}</span>--%>
										<!-- <span tabindex="0" class="btn-edit-sku theme-login">修改</span> -->
										<i class="theme-login am-icon-sort-desc"></i>
									</div>
									<script type="text/javascript">
										$(function(){
											(function(){
												var des='${cart.aaa205 }';
												var ts=des.split(";");
												var n=ts.length;
												var html="";
												for(var i=0;i<n;i++){
													html+="<span class='sku-line'>"+ts[i].replace(',',':')+"</span> ";
												}
												$("#describe${vs.count }").html(html);
											})();
										});
									</script>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content">
											<!-- <div class="price-line">
													<em class="price-original">78.00</em>
												</div> -->
											<div class="price-line">
												<em class="J_Price price-now" tabindex="0" id="price${vs.index }">${cart.aab205}</em>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-amount">
									<div class="amount-wrapper ">
										<div class="item-amount ">
											<div class="sl">
												<input class="min am-btn" name="" type="button" value="-" onclick="changeNum(true,${vs.index },${cart.aab203})" /> 
												<input id="count${vs.index }" name="" type="text" value="${cart.aaa202}" style="width:30px;" readonly="readonly" /> 
												<input class="add am-btn" name="" type="button" value="+" onclick="changeNum(false,${vs.index },${cart.aab203})" />
											</div>
										</div>
									</div>
								</li>
								<li class="td td-sum">
									<div class="td-inner">
										<em tabindex="0" class="J_ItemSum number">
										<div class="singleTotalPrice${cart.aab203}">${cart.aab205*cart.aaa202}</div>
										</em>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<!-- <a title="移入收藏夹" class="btn-fav" href="#">
                 							 移入收藏夹</a> -->
										<a onclick="deletePro('${vs.count }','${cart.aab203}')"
											data-point-url="" class="delete"> 删除</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</tr>
			</c:forEach>
			<script type="text/javascript">
				function deletePro(count,id){
					var name="#rows-"+count;
					$.ajax({
						url:"<%=path%>/updateShopCart.ajax",
						type:"post",
						dataType:"json",
						timeout:20000,
						data:{
							"aab203":id,
							"className":name,
							"type":"0"            <%-- 0 --删除    1 -- 更新数量    --%>
						},
						success:function(res,status){
							if(res.status=='200'){   //成功
								$(res.className).remove();
								console.log("删除成功!");
							}else if(res.status=='201'){  //失败
								alert("删除失败!");
							}else if(res.status=='202'){  //登录
								alert("请登录!");
								location.href="/ego/home/login.jsp";
							}
						},
						error:function(res,status){
							alert("网络故障!");
						}
					});
				}
			</script>
			<c:choose>
				<c:when test="${empty shopCart}">
					<div style="text-align: center;font-size: 20px;height: 100%;">购物车空空，赶紧去购物吧。。。。</div>
				</c:when>

			</c:choose>

		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all" id="J_SelectAllCbx2"
						name="select-all" value="true" type="checkbox"
						onchange="checkChange(this)"> <label for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a>
				<!-- <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a> -->
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> 
					<em id="J_SelectedItemsCount">0</em>
					<span class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="price">&yen;
					<em id="J_Total">${totalPrice}0</em> </strong>
				</div>
				<div class="btn-area">
					<a href="${pageContext.request.contextPath}/orderServlet" id="J_Go"
						class="submit-btn submit-btn-disabled"
						aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span> </a>
				</div>
			</div>

		</div>

		<%@ include file="/footer.jsp" %>

	</div>

	<%--<!--操作页面-->

			<div class="theme-popover-mask"></div>

			 <div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">

						<div class="theme-signin-left">

							<li class="theme-options">
								<div class="cart-title">颜色：</div>
								<ul>
									<li class="sku-line selected">12#川南玛瑙<i></i></li>
									<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">包装：</div>
								<ul>
									<li class="sku-line selected">包装：裸装<i></i></li>
									<li class="sku-line">两支手袋装（送彩带）<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">数量</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px;" />
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
								</dd>

							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">确认</div>
								<div class="btn close am-btn am-btn-warning">取消</div>
							</div>

						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="${cart.picture}" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">&yen;39.00</span>
								<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
							</div>
						</div>

					</form>
				</div>
			</div> 
		<!--引导 -->
		 <div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div> --%>
</body>
</html>