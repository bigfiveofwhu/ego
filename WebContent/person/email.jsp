<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>验证邮箱</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
	

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">更换绑定邮箱</strong> / <small>Email</small></div>
					</div>
					<hr/>
					<form class="am-form am-form-horizontal">
						<div class="am-form-group" ">
							<label for="user-email" class="am-form-label">新绑定邮箱</label>
							<div class="am-form-content" style="display: flex;">
								<input type="email" id="new_email" placeholder="请输入邮箱地址">
									<a class="btn" href="javascript:void(0);"  id="sendMobileCode">
								<button class="am-btn  sendVerifyCode" >发送验证码</button>
							</a>
							</div>
						</div>
						<div class="am-form-group code" style="width: 680px;">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content" style="display: flex;">
								<input type="tel" id="verifyCode" onblur="checkVerify()"  placeholder="验证码">
								<span class="successhhh" style="width: 60px;margin-top: 6px;font-size: 15px; margin-left: 14px;display:none"><i class="am-icon-check-circle-o" style="color:green"></i>成功</span>
								<span class="failwww"   style="width: 60px;margin-top: 6px;font-size: 15px; margin-left: 14px;display:none"><i class="am-icon-close" style="color:red"></i>失败</span>
							</div>
						</div>
						<div class="info-btn" ">
							<button type="button" class="am-btn am-btn-danger" id="savemodify">保存修改</button>
							<span id="issuccesshhh" style="color:red;display:none">修改成功!</span>
						</div>
					

					</form>

<script type="text/javascript">
	function checkVerify()
	{
		var verCode=$("#verifyCode").val();
		isVerify=false;
		console.log(verCode);
		$.ajax({
			url:"<%=basePath%>/verify.ajax",
			type:"post",
			timeout:20000,
			data:{
				"verCode":verCode
			},
			dataType:"json",
			success:function(res,status){
				console.log("返回");
				if(res.status=='200'){
					$(".successhhh").css("display","inline");
					$(".failwww").css("display","none");
					//alert("验证成功")
				    console.log("验证码验证成功");
				    $("#vsuccess").show();
					
					isVerify=true;
				}else{
					console.log("s验证失败")
					$(".successhhh").css("display","none");
					$(".failwww").css("display","inline");
					$("#vfail").fail();
					$(".sendVerifyCode").text("验证失败");
				}
			},
			error:function(res,status){
				console.log("验证失败")
				$("#vstatus").html()="验证失败,网络故障"
			}
		});
	}
	
	
	var count=60;
	function countTime(){
		var button=$(".sendVerifyCode");
		button.text((count--)+"秒后重新发送");
		if(count>=0){
			setTimeout(countTime,1000);
		}else{
			setTimeout(function(){
				button.text("发送验证码");
				button.attr("disabled",false);
				count=60;
			},1000);
		}
	}
	$(function(){
		<%-- 验证码的异步发送--%>
		$(".sendVerifyCode").click(function(){
			
			
			if($("#new_email").val().length == 0)
			{
				  alert("邮箱不能为空!");
				  return;
			}
			
			 var Regex = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/;
			 
			 if(!Regex.test($("#new_email").val()))
			 {
			     alert("邮箱格式错误");
			     return;
			 }
			$(".sendVerifyCode").attr("disabled",true);
			$(".sendVerifyCode").text("正在发送...");
			console.log("发送验证码...");
			
			$.ajax({
				url:"<%=basePath%>/verifyCode.ajax",
				type:"post",
				timeout:20000,
				dataType:"json",
				data:{
					"object":$("#new_email").val()
					
					
				},
				success:function(res,status){
					console.log(res.status);
					console.log(res.status=='200');
					 if(res.status=='200'){
						 //$(".sendVerifyCode").text("60秒后重新发送");
						 countTime();
					 }else{
						 $(".sendVerifyCode").text("发送失败,重新发送");
						 $(".sendVerifyCode").attr("disabled",false);
					 }
				},
				error:function(res,status){
					console.log("返回值:"+res+";  返回状态:"+status);
					$(".sendVerifyCode").text("发送失败,重新发送");
					$(".sendVerifyCode").attr("disabled",false);
				}
			});
		});		
	});
	
	$(function()
 {
	$("#savemodify").click(function(){
		
		
		$.ajax({
			url:"<%=basePath%>/modifyEmail.ajax",
			type:"post",
			dataType:"json",
			timeout:20000,
			data:{
				"aaa104":$("#new_email").val()
			},
			success:function(res){
			  $("#issuccesshhh").css("display","inline");
              console.log("修改邮箱成功");
			},
			error:function(res){
				console.log("修改邮箱失败");
			}
		});
	});	
	});	

	
	</script>
	</body>
</html>