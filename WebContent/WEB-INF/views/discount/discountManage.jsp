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
	  <td>
	  	<c:if test="${item.aab505<0}">
		  无限量
		</c:if>
		<c:if test="${item.aab505>0}">
		  ${item.aab505}天
		</c:if>
	  </td>
	  <td class="p-1">
	  	<button type="button" value="${item.aab501 }" class="btn btn-info btn-sm" tag="modify">修改</button>
		<button type="button" value="${item.aab501 }" class="btn btn-light btn-sm" tag="delete">删除</button>
	  </td>
	</tr>
  </c:forEach>

  </tbody>
</table>


<script src="/ego/js/jquery-3.2.0.min.js" ></script>
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

$("[tag='modify']").click(function(){
	var a=$(this);
	layer.open({
		  type: 2,
		  skin: 'layui-layer-rim', //加上边框
		  title:'编辑优惠券 ',
		  area: ['600px', '400px'], //宽高
		  content: '/ego/discount/modifyCoupon.html?aab501='+a.val()
	});
})

$("[tag='delete']").click(function(){
	var a=$(this);
	$.getJSON("DeleteCoupon.ajax",{aab501:$(this).val()},function(json){
		if(json.result==true){
			a.parent().parent().remove();
		}else{
			alert("删除失败，原因："+result.reason);
		}
	})
})


</script>

</body>
</html>