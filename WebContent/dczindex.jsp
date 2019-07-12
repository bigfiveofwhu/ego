<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
<title>IndexPage</title>
</head>
<body>
	<%session.setAttribute("aaa102", "1"); %><!-- 当前用户id -->
    <a id="jumptest" href="#" onclick="">订单页</a>
    <a id="jumptest" href="#" onclick="window.location.href='payOrder.jsp'">支付页</a>
    
    <form action="<%=path%>/showOrder.html" method="post">
    <input type="submit" value ="去管理订单" >
    </form>
    
    <form action="<%=path%>/goAddOrder.html" method="post">
    <input type="submit" value ="去下单" >
    </form>
    
</body>
</html>