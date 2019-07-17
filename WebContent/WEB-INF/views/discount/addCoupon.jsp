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

<form id="form" class="col-6">
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input"  id="type1" name="aab502" value="1" >
    <label class="form-check-label" for="type1">������</label>
  </div>
  
  <div class="form-group form-check-inline">
    <input type="radio" class="form-check-input ml-" id="type2" name="aab502" value="2" checked>
    <label class="form-check-label " for="type2">����</label>
  </div>
  
  <div class="form-group" >
    <label for="discount">�Ż�ֵ</label>
    <input class="form-control" placeholder="�����ŻݵĽ��" id="discount" name="aab503">
  </div>
  
  <div class="form-group" id="condition">
    <label for="condition">�Ż�����</label>
    <input placeholder="���������Ѷ���Ԫ����ʹ��" class="form-control" id="condition" name="aab504">
  </div>
  
  <div class="form-group">
    <label for="validTime">��Ч��</label>
    <input placeholder="��Ч�ڵ�����"  class="form-control" id="validTime" name="aab505">
  </div>
  
  <div class="form-group">
    <label for="amount">����</label>
    <input t class="form-control" id="amount" name="aab506">
  </div>
  
</form>

<button id="submit" class="btn btn-primary mx-auto">���</button>
<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>

<script>
$("input[type='radio']").on("click",function(){
	if($(this).val()==1)
	$("#condition").hide()
	else 
	$("#condition").show()
});

$("#submit").click(function(){
	var formData = $('#form').serializeArray();
	console.log(formData);
	var data=new Object();
	$.each(formData,function(index,field){
		data[field.name]=field.value;
	})
	console.log(data);
	$.getJSON("/ego/discount/addCoupon.ajax",formData,function(result){
		if(result.result==true){
			$('body').empty();
			$('body').append('��ӳɹ�<br>');
			$('body').append("<button id='return' class='btn btn-primary'>�ر�</button>");
			$("#return").click(function(){
				parent.location.reload();
			})
		}else if(result.result==false){
			$('body').empty();
			$('body').append('���ʧ��')
		}else{
			alert("�������")
		}
	});
})

</script>
</body>
</html>