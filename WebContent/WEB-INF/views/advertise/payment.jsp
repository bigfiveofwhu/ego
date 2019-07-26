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

<form id="form" class="col-6" action="/ego/payment.html">
  
  <div class="form-group" >
    <label for="discount">充值金额</label>
    <input class="form-control" placeholder="输入充值的金额" id="discount" name="WIDtotal_amount">
  </div>
  
  <button id="submit" class="btn btn-primary ml-3">支付宝支付</button>
  
</form>


<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>

<script>

</script>
</body>
</html>