<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
<title>IndexPage</title>
</head>
<body>
    <a id="jumptest" href="#" onclick="">����ҳ</a>
    <a id="jumptest" href="#" onclick="window.location.href='payOrder.jsp'">֧��ҳ</a>
    
    <form action="<%=path%>/showOrder.html" method="post">
    
    <input type="submit" value ="ȥ������" >
    </form>
    
    <form action="<%=path%>/goAddOrder.html" method="post">
    <input type="submit" value ="ȥ�µ�" >
    </form>
    
    <form action="<%=path%>/showComment.html" method="post">
    <input type="submit" value ="ȥ��������" >
    </form>
    
    <form action="<%=path%>/showHistory.html?aaa102=1" method="post">
    <input type="submit" value ="ȥ��ʷ��¼" >
    </form>
    
    <form action="<%=path%>/showPoint.html" method="post">
    <input type="submit" value ="ȥ������ʷ" >
    </form>
    
    <form action="<%=path%>/showRefund.html" method="post">
    <input type="submit" value ="ȥ�����ۺ�" >
    </form>
    
    <form action="<%=path%>/makeRefund.html" method="post">
    <input type="submit" value ="ȥ�ύ�ۺ�" >
    </form>
    
    <form action="<%=path%>/createOrder.html" method="post">
    <input type="submit" value ="ȥ�ύ����2" >
    </form>
    
    <form action="<%=path%>/goPostNeed.html" method="post">
    <input type="submit" value ="ȥ�ύ��������" >
    </form>
    
    <form action="<%=path%>/showNeed.html" method="post">
    <input type="submit" value ="�ҵ�����" >
    </form>
    
    <form action="<%=path%>/showServiceOrder.html" method="post">
    <input type="submit" value ="�ҵķ��񶩵�" >
    </form>
    
    <form action="<%=path%>/showServiceComment.html" method="post">
    <input type="submit" value ="�ҵķ�������" >
    </form>
    
    <form action="<%=path%>/goConfirmOrder.html" method="post">
    <input type="submit" value ="�����ύ����" >
    </form>
    
     <form action="<%=path%>/goPrepay.html" method="post">
    <input type="submit" value ="Ԥ��ҳ����" >
    </form>
    
     <form action="<%=path%>/goPostAimedNeed.html" method="post">
     <input type="text" name="aac202" value="10">
     <input type="text" name="aaa102" value="23">
    <input type="submit" value ="������������ύ����" >
    </form>
    
</body>
</html>