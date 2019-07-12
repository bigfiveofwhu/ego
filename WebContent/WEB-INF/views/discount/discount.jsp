<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="GBK">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<title></title>
</head>
<body>

<ul>
个人优惠券
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
<hr>
<ul>
商家优惠券
<c:forEach  items="${shopCoupons}" var="item">
<li>
流水号：${item.aab501}<br>
卡券类型:${item.aab502 }<br>
优惠值:${item.aab503 }<br>
条件:${item.aab504 }<br>
持续时间:${item.aab505 }<br>
数量:${item.aab506 }<br>
</li>
</c:forEach>
</ul>

<form class="col-6" action="addUserCoupon.html" method="post">

  <div class="form-group">
    <label for="sequenceId">卡券流水</label>
    <input class="form-control" id="sequenceId" name="aab501">
  </div>

  <div class="form-group">
    <label for="userId">用户id</label>
    <input class="form-control" id="userId" name="aaa102">
  </div>

  <div class="form-group">
    <label for="shopId">店铺id</label>
    <input t class="form-control" id="shopId" name="aab102">
  </div>
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input" id="type1" name="aaa502" value="1">
    <label class="form-check-label" for="type1">无条件</label>
  </div>
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input ml-" id="type2" name="aaa502" value="2">
    <label class="form-check-label " for="type2">满减</label>
  </div>
  
  <div class="form-group">
    <label for="conditiion">优惠条件</label>
    <input t class="form-control" id="conditiion" name="aaa503">
  </div>
  
  <div class="form-group">
    <label for="amount">优惠值</label>
    <input t class="form-control" id="amount" name="aaa504">
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>

</form>

<form class="col-6" action="useCoupon.html" method="post">
  <div class="form-group">
    <label for="sequence">优惠券流水号</label>
    <input t class="form-control" id="sequence" name="aaa501">
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
</body>
</html>