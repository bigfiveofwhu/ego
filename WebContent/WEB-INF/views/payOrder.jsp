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
	       ֧������
	    </caption>
	    
	    <tr>
	    	<td>������:${ins.aab302 }</td>
	    </tr>
	    <tr>
	    	<td>����ʱ��:${ins.aab304 }</td>
	    </tr>
	    <tr>
	    	<td>����:${ins.aab310 }</td>
	    </tr>
	    <tr>
	    	<td>����:${ins.aab314 }</td>
	    </tr>
	     <tr>
	    	<td>�˷�:${ins.aab313 }</td>
	    </tr>
	    <c:set var="number" value="${ins.aab310}" scope="request"></c:set>
	    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
	    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
	    <% double total=Double.valueOf((String)request.getAttribute("number"))
	    				*Double.valueOf((String)request.getAttribute("price"))
	    				+Double.valueOf((String)request.getAttribute("transFee")); %>
	    <tr>
	    	<td>�ܷ���:<%=total %></td>
	    </tr>
	    <tr>
	    	<td>�ջ���ַ(�˴�Ӧ����aaa401)</td>
	    	<td><e:text name="aab311"/></td>
	    </tr>
	     <tr>
	    	<td>�������</td>
	    	<td><e:text name="aab312"/></td>
	    </tr>
	    
	</table>
<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="֧��">
	    </td>
	  </tr>
	</table>
<input type="hidden" name="aab302" value="${ins.aab302 }">
</form>
</body>
</html>