<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>
<head>
<title>Insert title here</title>
</head>
<body>

<form action="<%=path%>/payOrder.html" method="post">
	<table  border="1" align="center" width="45%">
	    <caption>
	       支付界面
	    </caption>
	    
	    <tr>
	    	<td>订单号:${ins.aab302 }</td>
	    </tr>
	    <tr>
	    	<td>创建时间:${ins.aab304 }</td>
	    </tr>
	    <tr>
	    	<td>数量:${ins.aab310 }</td>
	    </tr>
	    <tr>
	    	<td>单价:${ins.aab314 }</td>
	    </tr>
	     <tr>
	    	<td>运费:${ins.aab313 }</td>
	    </tr>
	    <c:set var="number" value="${ins.aab310}" scope="request"></c:set>
	    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
	    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
	    <% double total=Double.valueOf((String)request.getAttribute("number"))
	    				*Double.valueOf((String)request.getAttribute("price"))
	    				+Double.valueOf((String)request.getAttribute("transFee")); %>
	    <tr>
	    	<td>总费用:<%=total %></td>
	    </tr>
	    <tr>
	    	<td>收货地址(此处应调用aaa401)</td>
	    	<td><e:text name="aab311"/></td>
	    </tr>
	     <tr>
	    	<td>买家留言</td>
	    	<td><e:text name="aab312"/></td>
	    </tr>
	    
	</table>
<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="支付">
	    </td>
	  </tr>
	</table>
<input type="hidden" name="aab302" value="${ins.aab302 }">
</form>
</body>
</html>