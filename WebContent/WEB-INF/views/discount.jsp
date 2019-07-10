<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
<meta charset="GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="/ego/css/bootstrap.css">
</head>
<body>

<ul>
<c:forEach  items="${coupons}" var="item">
<li>
流水号：${item.aaa501}<br>
店铺id: ${item.aab102 }<br>
卡券类型:${item.aaa502 }<br>
优惠值:${item.aaa503 }<br>
条件:${item.aaa504 }<br>
领取日期:${item.aaa505 }<br>
有效期:${item.aaa506 }<br>
</li>
</c:forEach>
</ul>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
</body>
</html>