<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>���ﳵҳ��</title>
<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/basic/css/demo.css" rel="stylesheet"  type="text/css" />
<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/optstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/hmstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/ajax.js"></script>
</head>
<body>
	<!--���������� -->
	<%@include file="/navigate.jsp" %>
	<!--����������-->
	<%@include file="/navSearch.jsp" %>
	<div class="clear"></div>
	<!--���ﳵ -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
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
					<div class="th th-op">
						<div class="td-inner">����</div>
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
										<span class="sku-line">��ζ��${cart.property}</span> 
										<span class="sku-line">��װ��${cart.packing}</span>--%>
										<!-- <span tabindex="0" class="btn-edit-sku theme-login">�޸�</span> -->
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
										<!-- <a title="�����ղؼ�" class="btn-fav" href="#">
                 							 �����ղؼ�</a> -->
										<a onclick="deletePro('${vs.count }','${cart.aab203}')"
											data-point-url="" class="delete"> ɾ��</a>
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
							"type":"0"            <%-- 0 --ɾ��    1 -- ��������    --%>
						},
						success:function(res,status){
							if(res.status=='200'){   //�ɹ�
								$(res.className).remove();
								console.log("ɾ���ɹ�!");
							}else if(res.status=='201'){  //ʧ��
								alert("ɾ��ʧ��!");
							}else if(res.status=='202'){  //��¼
								alert("���¼!");
								location.href="/ego/home/login.jsp";
							}
						},
						error:function(res,status){
							alert("�������!");
						}
					});
				}
			</script>
			<c:choose>
				<c:when test="${empty shopCart}">
					<div style="text-align: center;font-size: 20px;height: 100%;">���ﳵ�տգ��Ͻ�ȥ����ɡ�������</div>
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
				<span>ȫѡ</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">ɾ��</a>
				<!-- <a href="#" hidefocus="true" class="J_BatchFav">�����ղؼ�</a> -->
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">��ѡ��Ʒ</span> 
					<em id="J_SelectedItemsCount">0</em>
					<span class="txt">��</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">�ϼ�:</span> <strong class="price">&yen;
					<em id="J_Total">${totalPrice}0</em> </strong>
				</div>
				<div class="btn-area">
					<a href="${pageContext.request.contextPath}/orderServlet" id="J_Go"
						class="submit-btn submit-btn-disabled"
						aria-label="��ע�����û��ѡ�񱦱������޷�����"> <span>��&nbsp;��</span> </a>
				</div>
			</div>

		</div>

		<%@ include file="/footer.jsp" %>

	</div>

	<%--<!--����ҳ��-->

			<div class="theme-popover-mask"></div>

			 <div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="�ر�" class="close">��</a>
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">

						<div class="theme-signin-left">

							<li class="theme-options">
								<div class="cart-title">��ɫ��</div>
								<ul>
									<li class="sku-line selected">12#�������<i></i></li>
									<li class="sku-line">10#����ɫ+17#ӣ����<i></i></li>
								</ul>
							</li>
							<li class="theme-options">
								<div class="cart-title">��װ��</div>
								<ul>
									<li class="sku-line selected">��װ����װ<i></i></li>
									<li class="sku-line">��֧�ִ�װ���Ͳʴ���<i></i></li>
								</ul>
							</li>
							<div class="theme-options">
								<div class="cart-title number">����</div>
								<dd>
									<input class="min am-btn am-btn-default" name="" type="button" value="-" />
									<input class="text_box" name="" type="text" value="1" style="width:30px;" />
									<input class="add am-btn am-btn-default" name="" type="button" value="+" />
									<span  class="tb-hidden">���<span class="stock">1000</span>��</span>
								</dd>

							</div>
							<div class="clear"></div>
							<div class="btn-op">
								<div class="btn am-btn am-btn-warning">ȷ��</div>
								<div class="btn close am-btn am-btn-warning">ȡ��</div>
							</div>

						</div>
						<div class="theme-signin-right">
							<div class="img-info">
								<img src="${cart.picture}" />
							</div>
							<div class="text-info">
								<span class="J_Price price-now">&yen;39.00</span>
								<span id="Stock" class="tb-hidden">���<span class="stock">1000</span>��</span>
							</div>
						</div>

					</form>
				</div>
			</div> 
		<!--���� -->
		 <div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>��ҳ</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>����</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>���ﳵ</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>�ҵ�</a></li>					
		</div> --%>
</body>
</html>