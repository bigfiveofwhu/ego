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
��ˮ�ţ�${item.aaa501}<br>
����id: ${item.aab102 }<br>
��ȯ����:${item.aaa502 }<br>
�Ż�ֵ:${item.aaa503 }<br>
����:${item.aaa504 }<br>
��ȡ����:${item.aaa505 }<br>
��Ч��:${item.aaa506 }<br>
</li>
</c:forEach>
</ul>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
</body>
</html>