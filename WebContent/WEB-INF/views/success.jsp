<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>付款成功页面</title>
	<link rel="stylesheet"  type="text/css" href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css"/>
	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	
	<link href="<%=path%>/css/sustyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>

</head>


<body>

<div class="take-delivery">
 <div class="status">
   <h2>${msg }</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>&yen;${ins.aab316 }</em></li>
       <div class="user-info">
       	 <p>订单号:${ins.aab302 }</p>
         <p>收货人:${ins.aab317 }</p>
         <p>联系电话:${ins.aab318 }</p>
         <p>收货地址:${ins.aab311 }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="<%=path%>/showOrder.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="<%=path%>/goOrderDetail.html?aab302=${ins.aab302 }" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>

</body>
</html>