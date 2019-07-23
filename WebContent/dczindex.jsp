<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
<title>IndexPage</title>
</head>
<body>
    <a id="jumptest" href="#" onclick="">订单页</a>
    <a id="jumptest" href="#" onclick="window.location.href='payOrder.jsp'">支付页</a>
    
    <form action="<%=path%>/showOrder.html" method="post">
    
    <input type="submit" value ="去管理订单" >
    </form>
    
    <form action="<%=path%>/goAddOrder.html" method="post">
    <input type="submit" value ="去下单" >
    </form>
    
    <form action="<%=path%>/showComment.html" method="post">
    <input type="submit" value ="去管理评价" >
    </form>
    
    <form action="<%=path%>/showHistory.html?aaa102=1" method="post">
    <input type="submit" value ="去历史记录" >
    </form>
    
    <form action="<%=path%>/showPoint.html" method="post">
    <input type="submit" value ="去积分历史" >
    </form>
    
    <form action="<%=path%>/showRefund.html" method="post">
    <input type="submit" value ="去管理售后" >
    </form>
    
    <form action="<%=path%>/makeRefund.html" method="post">
    <input type="submit" value ="去提交售后" >
    </form>
    
    <form action="<%=path%>/createOrder.html" method="post">
    <input type="submit" value ="去提交订单2" >
    </form>
    
    <form action="<%=path%>/goPostNeed.html" method="post">
    <input type="submit" value ="去提交服务需求" >
    </form>
    
    <form action="<%=path%>/showNeed.html" method="post">
    <input type="submit" value ="我的需求" >
    </form>
    
    <form action="<%=path%>/showServiceOrder.html" method="post">
    <input type="submit" value ="我的服务订单" >
    </form>
    
    <form action="<%=path%>/showServiceComment.html" method="post">
    <input type="submit" value ="我的服务评价" >
    </form>
    
    <form action="<%=path%>/goConfirmOrder.html" method="post">
    <input type="submit" value ="定向提交订单" >
    </form>
    
     <form action="<%=path%>/goPrepay.html" method="post">
    <input type="submit" value ="预付页测试" >
    </form>
    
     <form action="<%=path%>/goPostAimedNeed.html" method="post">
     <input type="text" name="aac202" value="10">
     <input type="text" name="aaa102" value="23">
    <input type="submit" value ="定向服务需求提交测试" >
    </form>
    
</body>
</html>