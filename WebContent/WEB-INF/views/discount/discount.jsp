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
�����Ż�ȯ
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
<hr>
<ul>
�̼��Ż�ȯ
<c:forEach  items="${shopCoupons}" var="item">
<li>
��ˮ�ţ�${item.aab501}<br>
��ȯ����:${item.aab502 }<br>
�Ż�ֵ:${item.aab503 }<br>
����:${item.aab504 }<br>
����ʱ��:${item.aab505 }<br>
����:${item.aab506 }<br>
</li>
</c:forEach>
</ul>

<form class="col-6" action="addUserCoupon.html" method="post">

  <div class="form-group">
    <label for="sequenceId">��ȯ��ˮ</label>
    <input class="form-control" id="sequenceId" name="aab501">
  </div>

  <div class="form-group">
    <label for="userId">�û�id</label>
    <input class="form-control" id="userId" name="aaa102">
  </div>

  <div class="form-group">
    <label for="shopId">����id</label>
    <input t class="form-control" id="shopId" name="aab102">
  </div>
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input" id="type1" name="aaa502" value="1">
    <label class="form-check-label" for="type1">������</label>
  </div>
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input ml-" id="type2" name="aaa502" value="2">
    <label class="form-check-label " for="type2">����</label>
  </div>
  
  <div class="form-group">
    <label for="conditiion">�Ż�����</label>
    <input t class="form-control" id="conditiion" name="aaa503">
  </div>
  
  <div class="form-group">
    <label for="amount">�Ż�ֵ</label>
    <input t class="form-control" id="amount" name="aaa504">
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>

</form>

<form class="col-6" action="useCoupon.html" method="post">
  <div class="form-group">
    <label for="sequence">�Ż�ȯ��ˮ��</label>
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