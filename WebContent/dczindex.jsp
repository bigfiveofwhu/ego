<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
<title>IndexPage</title>
</head>
<body>
	<%session.setAttribute("aaa102", "1"); %><!-- ��ǰ�û�id -->
    <a id="jumptest" href="#" onclick="">����ҳ</a>
    <a id="jumptest" href="#" onclick="window.location.href='payOrder.jsp'">֧��ҳ</a>
    
    <form action="<%=path%>/showOrder.html" method="post">
    <input type="submit" value ="ȥ������" >
    </form>
    
    <form action="<%=path%>/goAddOrder.html" method="post">
    <input type="submit" value ="ȥ�µ�" >
    </form>
    
</body>
</html>