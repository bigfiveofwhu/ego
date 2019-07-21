<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>支付</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/jsstyle.css" rel="stylesheet" type="text/css" />	
		<script type="text/javascript" src="<%=path%>/js/address.js"></script>
		<script type="text/javascript">
		
		</script>

	</head>
<body>
	<br/><br/><br/><br/>
	<div align="center">
		<img alt="" src="<%=path%>/images/payCode.jpg" >
		<br/><br/>
	</div>
		
	<div class="clear">
	<div style="text-align:center;">
		
		<div style="display:inline-block; *display:inline; zoom:1;">
			
          	<div class="box" style="float:left;">
				<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
					<span class="price g_price ">
		                            <span>&yen;</span> <em class="style-large-bold-red " id="J_ActualFee">${ins.aab316 }</em>
					</span>
				</div>
		
				<div id="holyshit268" class="pay-address">
		
					<p class="buy-footer-address">
						<span class="buy-line-title buy-line-title-type">寄送至：</span>
						<span class="buy--address-detail">
		  				<span class="province">${ins.aab311 }</span>
						</span>
						</span>
					</p>
					<p class="buy-footer-address">
						<span class="buy-line-title">收货人：</span>
						<span class="buy-address-detail">   
		                <span class="buy-user">${ins.aab317 } </span>
						</span>
						<br/>
						<span class="buy-line-title">联系方式：</span>
						<span class="buy-address-detail">  
						<span class="buy-phone">${ins.aab318 }</span>
						</span>
					</p>
				</div>
				
			</div>
			
			<div class="clear">
			
			<div class="info-btn">
				<a href="payOrder.html?aab302=${ins.aab302 }"><div class="am-btn am-btn-danger"">支付完成</div></a>
			</div>
        </div>
			
	</div>
		
							
		


</body>
</html>