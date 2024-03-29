<%@page import="java.text.DecimalFormat"%>
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>退换货</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/refstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#type").change(function() {	
				var p = $(this).val();
				$('input[name="aaa804"]').val(p);
				$("#showtype").text(p);
			});
			
			$("#reason").change(function() {	
				var p = $(this).val();
				$('input[name="aaa806"]').val(p);
				$("#showreason").text(p);
			});
		})
		
		function sendRefund(vaab302)
		{
			var vform = document.getElementById("myform");
			$('input[name="aaa805"]').val($("#description").val());
			vform.action="<%=path%>/makeRefund.html?aab302="+vaab302;
			vform.submit();
		}
		
		</script>
	</head>

	<body>
		<form id="myform" action="###.html" method="post">
			<input name="aaa804" type="hidden" value="01" />
			<input name="aaa806" type="hidden" value="01" />
			<input name="aaa805" type="hidden" value="" />
			<input name="aab102" type="hidden" value="${ins.aab102 }" />
			<input name="aab203" type="hidden" value="${ins.aab203 }" />
		</form>
		
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">退换货申请</strong> / <small>Apply&nbsp;for&nbsp;returns</small></div>
					</div>
					<hr/>
					<div class="comment-list">
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">买家申请退款</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">商家处理退款申请</p>
                            </span>
							<span class="step-3 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                <p class="stage-name">款项成功退回</p>
                            </span>                            
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					
					
						<div class="refund-aside">
						<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
						<% String url=(request.getAttribute("url")).toString();
					  		String[] arr=url.split(";");
						%>
							<div class="item-pic">
								<a href="#" class="J_MakePoint">
									<img src="<%=path%><%=arr[0]%>" class="itempic">
								</a>
							</div>

							<div class="item-title">

								<div class="item-name">
									<a href="#">
										<p class="item-basic-info">${ins.aab202 }</p>
									</a>
								</div>
								<div class="info-little">
									<span>商品ID:${ins.aab203 }</span>
								</div>
							</div>
							<div class="item-info">
								<div class="item-ordernumber">
									<span class="info-title">订单编号：</span><a>${ins.aab302 }</a>
								</div>
								<div class="item-price">
									<span class="info-title">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</span><span class="price">${ins.aab314 }元</span>
									<span class="number">×${ins.aab310 }</span><span class="item-title">(数量)</span>
								</div>
								
								<%double total=0; double spend=0;%>
								<%DecimalFormat df=new DecimalFormat("0.00"); %>
								<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
							    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
							    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
							    <%  spend=Double.valueOf((String)request.getAttribute("number"))
							    				*Double.valueOf((String)request.getAttribute("price")); 			
							   		total=spend+Double.valueOf((String)request.getAttribute("transFee")); 			
							    %>
								<div class="item-amount">
									<span class="info-title">小&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</span><span class="amount"><%=df.format(spend) %>元</span>
								</div>
								<div class="item-pay-logis">
									<span class="info-title">运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：</span><span class="price">${ins.aab313 }元</span>
								</div>
								<div class="item-amountall">
									<span class="info-title">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</span><span class="amountall"><%=df.format(total) %>元</span>
								</div>
								<div class="item-time">
									<span class="info-title">成交时间：</span><br/><span class="time">${ins.aab305 }</span>
								</div>

							</div>
							<div class="clear"></div>
						</div>

						<div class="refund-main">
							<div class="item-comment">
								<div class="am-form-group">
									<label for="refund-type" class="am-form-label">退款类型</label>
									<div class="am-form-content">
										<select id="type" data-am-selected="">
											<option value="01" selected>仅退款</option>
											<option value="02">退款/退货</option>
										</select>
									</div>
								</div>
								
								
								<div class="am-form-group">
									<label for="refund-reason" class="am-form-label">退款原因</label>
									<div class="am-form-content">
										<select id="reason" data-am-selected="">
											<option value="01" selected>不想要了</option>
											<option value="02">买错了</option>
											<option value="03">没收到货</option>											
											<option value="04">与说明不符</option>
										</select>
									</div>
								</div>
								
								
								

								<div class="am-form-group">
									<label for="refund-money" class="am-form-label">退款金额<span>（不可修改）</span></label>
									<div class="am-form-content">
										<input type="text" id="refund-money" readonly="readonly" placeholder="<%=df.format(spend)%>">
									</div>
								</div>
								<div class="am-form-group">
									<label for="refund-info" class="am-form-label">退款说明<span>（可不填）</span></label>
									<div class="am-form-content">
										<textarea id="description" placeholder="请输入退款说明"></textarea>
									</div>
								</div>

							</div>
							<!--div class="refund-tip">
								<div class="filePic">
									<input type="file" class="inputPic" value="选择凭证图片" name="file" max="5" maxsize="5120" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
									<img src="<%=path%>/images/image.jpg" alt="">
								</div>
								<span class="desc">上传凭证&nbsp;最多三张</span>
							</div-->
							
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" onclick="sendRefund(${ins.aab302})">提交申请</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

				
			</div>

			
		</div>

	</body>

</html>