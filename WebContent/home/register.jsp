<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="<%=path%>/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

        <script type="text/javascript">
        function getchang()
        {
		  document.getElementById("randomCodeImg").src="<%=path%>/randomCode?"+new Date().getTime();
	     }
        </script>
	</head>
	<body>
		<div class="login-boxtitle">
			<a href="home/demo.html">
				<img alt="" src="<%=path%>/images/logobig.png" />
			</a>
		</div>
		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="<%=path%>/images/big.jpg" /></div>
				<div class="login-box">
						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">普通会员注册</a></li>
								<li><a href="">手机号注册</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<span style="color:red">${msg}</span>	
									<!-- 邮箱注册 -->
									<form action="<%=path%>/register.html" method="post">	 
										<div class="user_element">
											<label for="name"><i class="am-icon-user"></i></label>
											<input type="text" class="input_block" name="username" id="username" placeholder="请输入昵称" required="required">
		                 			   </div>
									   <div class="user_element">
											<label for="email"><i class="am-icon-envelope-o"></i></label>
											<input type="email" class="input_block" name="email" id="email" onblur="checkEmailFormat()" 
												   placeholder="请输入邮箱地址" required="required">
											<button type="button" class="am-btn am-btn-default am-btn-xs sendVerifyCode">发送验证码</button>
		                 			   </div>
	                                   <div class="user_element" style="display: flex;">
										    <label for="code"><i class="am-icon-rocket"></i></label>
										    <input type="text" class="input_block" name="verifyCode" id="verifyCode" onblur="checkVerify()" 
										    	   maxlength="6" placeholder="请输入验证码">
										    <div style="width:40px;height:30px;font-size:12px;padding-top:11px">
										    	<span class="successIcon"><i class="am-icon-check-circle-o" style="color:green"></i>成功</span>
										    	<span class="failIcon"><i class="am-icon-close" style="color:red"></i>失败</span>
										    </div>
						               </div>
						               <div class="user_element">
											<label for="phone"><i class="am-icon-phone"></i></label>
											<input type="text" class="input_block" name="phone" id="phone" 
											       onblur="check()" maxlength="11" placeholder="请输入手机号码" required="required">
											<button style="display:none" type="button" class="am-btn am-btn-default am-btn-xs sendVerifyCode">发送验证码</button>
		                 			   </div>
	                 				   <div class="user_element">
										    <label for="password"><i class="am-icon-lock"></i></label>
										    <input type="password" class="input_block" name="pwd" id="password" onblur="checkPwd()" placeholder="设置密码" required="required">
	                                   </div>										
	                				   <div class="user_element">
										    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
										    <input type="password" class="input_block" name="pwdRep" id="passwordRepeat" onblur="verifyPwd()" placeholder="确认密码" required="required">
	                                   </div>
	                                    <div class="user_element">
										    <label for="realname"><i class="am-icon-child"></i></label>
										    <input type="realname" class="input_block" name="realname" id="realname" placeholder="真实名称" required="required">
	                                   </div>
	                                   <div class="user_element">
										    <label for="gender"><i class="am-icon-female"></i></label>
										    <span class="input_group">
											    <input type="radio" name="gender" class="gender" value="1">男
											    <input type="radio" name="gender" class="gender" value="2">女
											    <input type="radio" name="gender" class="gender" value="3" checked="checked">保密
										    </span>
	                                   </div>
	                                   <div class="user_element">
										    <label for="birthday"><i class="am-icon-birthday-cake"></i></label>
										    <input type="date" class="input_block" name="birthday" id="birthday" placeholder="确认密码" required="required">
	                                   </div>
	                                    <div class="user_element">
										    <label for="addr"><i class="am-icon-area-chart"></i></label>
										    <span class=""input_block"">
											    <select name="addr_1" id="addr_1" required="required"></select>
											    <select name="addr_2" id="addr_2" class="childs" required="required"></select>
											    <select name="addr_3" id="addr_3" class="childs" required="required"></select>
											    <input type="text" name="addr_4" id="addr_4" required="required" placeholder="街道地址" maxlength="50"/>
										    </span>
	                                   </div>
									   <div class="am-cf">
											<input type="submit" name="" value="注册" onclick="return check()" class="am-btn am-btn-primary am-btn-sm am-fl">
									   </div>
	                               </form>
							   </div>
								<div class="am-tab-panel">
								<!-- 手机号码注册 -->
									<form action="<%=path%>/register?cmd=mob" method="post">
										<p id="prop" style="color:red;font-size:12px"/>
	                			        <div class="user-phone">
										    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
										    <input type="text" name="phone" id="phone" placeholder="请输入手机号码" onchange="check()" onblur="dis()">
	                                    </div>																			
										<div class="verification">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="text" name="verifyCode" id="code" placeholder="请输入验证码">
											<img alt="加载失败" onclick="javascript:getchang();" title="看不清,换一张" name="verifyImage"
									             id="verifyCodeImg" src="${pageContext.request.contextPath}/verifyCode" width="53px" 
									             height="38px" border="1" align="absmiddle" style="margin-bottom:-16px">
										</div>
	                                    <div class="user-pass">
										    <label for="password"><i class="am-icon-lock"></i></label>
										    <input type="password" name="pwd" id="password" placeholder="请输入密码">
	                                    </div>										
	                                    <div class="user-pass">
										    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
										    <input type="password" name="pwdRep" id="" placeholder="请输入密码">
										    <div class="am-cf">
												<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
											</div>
	                                    </div>	
									</form>
									<hr>
								</div>
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>
							</div>
						</div>
				</div>
			</div>
		</div>
		<%@ include file="/footer.jsp" %>
		<script type="text/javascript">
		var isVerify=false;
		
		function checkEmailFormat()
		{
			//检查输入格式
		}
		
		function checkUserFormat()
		{
			//检查输入格式
		}
		function check()
		{
	     	var count=$("#phone").val();
	     	var tel_reg=/^1[3|4|5|7|8]\d{9}$/;
	       	//var tel_reg=new RegExp("1[3|4|5|7|8]\\d{9}]$");
	     	if(count.trim()=="")
	     	{
		  		alert("手机号码不能为空");
		  		$("#prop").html("亲，手机号码不能为空");
	   		}
	       	else if(!tel_reg.test(count))
	       	{
				alert("输入手机号码格式不正确");
				$("#prop").html("亲，输入手机号码格式不正确");
	   	    }else
	   	    {
	   			 $("#prop").css("visibility","hidden");	
	    	}
		}
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
						$(".successIcon").css("display","inline");
						$(".failIcon").css("display","none");
						isVerify=true;
					}else{
						$(".successIcon").css("display","none");
						$(".failIcon").css("display","inline");
					}
				},
				error:function(res,status){
					$(".successIcon").css("display","none");
					$(".failIcon").css("display","inline");
				}
			});
		}
		var pwd="";
		function checkPwd(){
			pwd=$("#password").val();
			if(pwd=="") alert("密码不能为空");
		}
		
		function verifyPwd(){
			var verPwd=$("#passwordRepeat").val();
			if(verPwd!=pwd){
				alert("两次密码不一样");
				$("#passwordRepeat").val("");
			}
		}
		
		function check(){
			var user=$("#username").val();
			if(user==""){
				alert("账户不能为空");
				return false;
			}
			if(!isVerify)       ///////////////////////////////此处记得更改servlet出安全设置
			{
				alert("请输入正确的验证码");
				return false;
			}
			if(pwd==""){
				alert(密码不能为空);
				return false;
			}
			return true;
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
				$(".sendVerifyCode").attr("disabled",true);
				$(".sendVerifyCode").text("正在发送...");
				console.log("发送验证码...");
				
				$.ajax({
					url:"<%=basePath%>/verifyCode.ajax",
					type:"post",
					timeout:20000,
					dataType:"json",
					data:{
						"object":$("#email").val()
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
			
			$("#addr_1").change(function(){
				var A_id=$(this).children("option:selected").attr("A_id");
				loadAddr(A_id,2);
			});
			$("#addr_2").change(function(){
				var A_id=$(this).children("option:selected").attr("A_id");
				loadAddr(A_id,3);
			});
			
			<%-- 地址初始化的异步加载--%>
			function loadAddr(type,index){
				if(index>3) return;
				$.ajax({
					url:"<%=basePath%>/getAddr.ajax",
					type:"post",
					timeout:20000,
					dataType:"json",
					data:{
						"type":type
					},
					success:function(res,status){
						var addrs=res.addrs;
						var n=addrs.length;
						var html="";
						if(n>0){
							html="<option value='"+addrs[0].areaname+"' A_id='"+addrs[0].areaid+"' selected='selected'>"+addrs[0].areaname+"</option>";
							for(var i=1;i<n;i++){
								html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
							}
						}
						$("#addr_"+index).html(html);
						loadAddr(addrs[0].areaid,++index);
					},
					error:function(res,status){
						console.log("#addr_"+index+"地址异步加载错误");
					}
				});
			}
			loadAddr("-1",1);
		});
		</script>
	</body>
</html>