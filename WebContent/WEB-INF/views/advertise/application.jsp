<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<meta charset="GBK">
<title></title>
</head>

<body>
<!-- insert your code-->
<form class="mx-auto w-50 bg-light border p-3" method="post" action="applyAccount.html?aaa102=${aaa102}">
	<div class="alert alert-warning" role="alert">
	您还未拥有广告账户，可以直接申请<br>
	您输入的信息会经过平台审核，请认真填写
	</div>
  <div class="form-group">
    <label for="realName">真实姓名</label>
    <input  name="realName" class="form-control" id="realName" aria-describedby="emailHelp" 
    placeholder="请输入你的真实姓名">
    <small id="emailHelp" class="form-text text-muted"></small>
  </div>
  
  <div class="form-group">
    <label for="identity">身份证</label>
    <input name="identity" class="form-control" id="identity" placeholder="输入完整身份证号">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">银行卡号</label>
    <input  name="bankAccount"  class="form-control" id="bankAccount" placeholder="您的信用卡或借记卡号">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">预留手机号</label>
    <input  name="phoneNumber" class="form-control" id="bankAccount" placeholder="银行的预留手机号">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">您希望推广的商品类型</label>
    <input  name="targetType" class="form-control" id="bankAccount" placeholder="例：男装，球鞋等，方便广告定向匹配">
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<!-- insert your javascripte here-->
<script>

</script>
</body>
</html>