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
	����δӵ�й���˻�������ֱ������<br>
	���������Ϣ�ᾭ��ƽ̨��ˣ���������д
	</div>
  <div class="form-group">
    <label for="realName">��ʵ����</label>
    <input  name="realName" class="form-control" id="realName" aria-describedby="emailHelp" 
    placeholder="�����������ʵ����">
    <small id="emailHelp" class="form-text text-muted"></small>
  </div>
  
  <div class="form-group">
    <label for="identity">���֤</label>
    <input name="identity" class="form-control" id="identity" placeholder="�����������֤��">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">���п���</label>
    <input  name="bankAccount"  class="form-control" id="bankAccount" placeholder="�������ÿ����ǿ���">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">Ԥ���ֻ���</label>
    <input  name="phoneNumber" class="form-control" id="bankAccount" placeholder="���е�Ԥ���ֻ���">
  </div>
  
  <div class="form-group">
    <label for="bankAccount">��ϣ���ƹ����Ʒ����</label>
    <input  name="targetType" class="form-control" id="bankAccount" placeholder="������װ����Ь�ȣ������涨��ƥ��">
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