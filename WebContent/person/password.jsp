<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�޸�����</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�޸�����</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--������-->
				
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">ԭ����</label>
							<div class="am-form-content">
								<input type="password" id="user-origin-password" placeholder="������ԭ��¼����">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">������</label>
							<div class="am-form-content">
								<input type="password" id="user-now1-password" placeholder="�����֡���ĸ���">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">ȷ������</label>
							<div class="am-form-content" style="display: flex;">
								<input type="password" id="user-confirm-password"  placeholder="���ٴ��������������">
							</div>
						</div>
						<div class="info-btn">
							<button onclick="checkPwd();" type="button" class="am-btn am-btn-danger">�����޸�</button><span id="success_icon" style="color:red;display:none">�޸ĳɹ�!</span>
						</div>	
				</form>
				</body>	
					<script>
 function checkPwd()
 {
	 console.log($("#user-origin-password").val());
	 console.log($("#user-now1-password").val());
	 console.log($("#user-confirm-password").val());
	 if($("#user-now1-password").val().length == 0 || $("#user-origin-password").length == 0 || $("#user-confirm-password" ).length == 0)
	 {
		 alert("���벻��Ϊ��");
		 return;
	 }
	 
	 if($("#user-now1-password").attr("value") != $("#user-confirm-password").attr("value") )
	 {
		 alert("���벻һ��");
		 return;
	 }
	 
	
	 
	 var oaaa107 = $("#user-origin-password").val();
	 var naaa107 = $("#user-now1-password").val();
	 $.ajax({
			url:"${path}/modifyPwd.ajax",
			type:"post",
			dataType:"json",
			timeout:20000,
			data:{
				"oaaa107":oaaa107,
				"naaa107":naaa107
			},
			success:function(res,status){
				if(res.bigtag == 0)
				{
					 alert("ԭ�������,�޸�ʧ��!");
					 location.reload();			
				}
				else
				{
	                 $("#success_icon").css("display","inline");
	               	 $("#user-origin-password").val("");
	            	 $("#user-now1-password").val("");
	            	 $("#user-confirm-password").val("");
				}
			},
			error:function(res,status){
				alert("�������");
			}
		});
	 	 
 }
</script>
</html>
	