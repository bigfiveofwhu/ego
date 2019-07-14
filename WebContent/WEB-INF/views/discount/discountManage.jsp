<%@page import="java.util.Map"%>
<%@page import="java.util.List" %>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<link rel="stylesheet" href="/ego/layui/css/layui.css">
<meta charset="GBK">
<title></title>
</head>
<body>

<nav class="navbar navbar-light bg-light">
	<button class="btn btn-outline-success" id="newCoupon" type="button">添加优惠券</button>
</nav>

<table class="table">
  <thead>
    <tr>
      <th scope="col">卡券类型</th>
      <th scope="col">优惠值</th>
      <th scope="col">条件</th>
      <th scope="col">有效期</th>
      <th scope="col">剩余数量</th>
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach  items="${shopCoupons}" var="item">
	<tr>
	  <td>
		<c:if test="${item.aab502=='1'}">
		  无条件红包
		</c:if>
		<c:if test="${item.aab502=='2'}">
		  满减红包
		</c:if>
	  </td>
	  <td>${item.aab503 }</td>
	  <td>
	  	<c:if test="${item.aab502=='1'}">
		  无
		</c:if>
		<c:if test="${item.aab502=='2'}">
		  满 ${item.aab504}
		</c:if>
	  </td>
	  <td>${item.aab505}</td>
	  <%--
	  <jsp:useBean id="dValue" class="com.ego.beans.DoubleConverter">
	  	<jsp:setProperty name="dValue" property="value" value="${item.aab505}"/>
	  </jsp:useBean>
	   --%>
	  <td>
	  	<c:if test="${item.aab505<0}">
		  无限量
		</c:if>
		<c:if test="${item.aab505>0}">
		  ${item.aab505}
		</c:if>
	  </td>
	  <td>删除，修改</td>
	</tr>
  </c:forEach>

  </tbody>
</table>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>

<script>

layui.use('layer', function(){
	layer = layui.layer;
});
$('#newCoupon').on('click',function(){
	layer.open({
		  type: 2,
		  skin: 'layui-layer-rim', //加上边框
		  title:'添加优惠券 ',
		  area: ['600px', '400px'], //宽高
		  content: '/ego/discount/addCoupon.html'
	});
})
</script>

</body>
</html>