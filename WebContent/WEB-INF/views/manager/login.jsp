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
<!-- insert your code-->
<form class="mx-auto w-50 bg-light border p-3 mt-5" id="form" method="post" enctype="multipart/form-data">
	  
	  
	  
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">管理员账户</label>
	    <div class="col-sm-10">
	      <input  class="form-control" id="money" name="aad102" placeholder="请输入您的账号">
	    </div>
	  </div>
	  
	  <div class="form-group row">
	    <label for="passwrod" class="col-sm-2 col-form-label">管理员密码</label>
	    <div class="col-sm-10">
	      <input  class="form-control password"  type="password" id="passwrod" name="aad103" placeholder="请输入您的密码">
	    </div>
	  </div>
	   <button type="button" class="btn btn-primary" id="submit">登录</button>
	</form>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
<!-- insert your javascript here-->
<script>

layui.use('layer',function(){});
$("#submit").click(function(){
	$.getJSON("ManagerLogin.ajax",
			{aad102:$("[name='aad102']").val()
			,aad103:$("[name='aad103']").val()},
			function(res){
		if(res.result==true){
			  location.href = "/ego/manager/background.html";
		}else{
			layer.msg("密码错误")
		}
	}).fail(function(){
		layer.msg("网络错误 ")
	})
})
</script>
</body>
</html>