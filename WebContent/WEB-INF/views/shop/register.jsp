<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>店铺注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="<%=path%>/css/shop/dlstyle.css" rel="stylesheet" type="text/css">
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
								<li class="am-active"><a href="">店铺注册</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<span style="color:red">${msg}</span>	
									<!-- 店铺资格认证信息 -->
									<form action="<%=path%>/shop/shopRegister.html" method="post">	 
										<div class="shop_element">
											<label for="name"><i class="am-icon-user"></i></label>
											<input type="text" class="input_block" name="shopname" id="shopname" placeholder="请输入店铺名称" required="required">
		                 			   </div>
	                                  
	                                   <div class="shop_element">
										    <label for="passwordRepeat"><i class="am-icon-cc-paypal"></i></label>
										    <input type="number" class="input_block" name="amount" id="amount" placeholder="保证金" required="required">
	                                   </div>
	                                    <div class="shop_element_textarea">
										    <label for="realname"><i class="am-icon-child"></i></label>
										    <textarea cols="50" rows="10" name="subscribe" id="subscribe" placeholder="店铺描述" required="required"></textarea>
	                                   </div>
	                                   <div class="shop_element">
										    <label for="addr"><i class="am-icon-area-chart"></i></label>
										    <span class="input_block">
											    <select name="addr_1" id="addr_1" required="required"></select>
											    <select name="addr_2" id="addr_2" class="childs" required="required"></select>
											    <select name="addr_3" id="addr_3" class="childs" required="required"></select>
											    <input type="text" name="addr_4" id="addr_4" required="required" placeholder="街道地址" value="${addr_4 }" maxlength="50"/>
										    </span>
	                                   </div>
									   <div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
									   </div>
	                               </form>
							   </div>
								<div class="am-tab-panel">
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
			return true;
			var shop=$("#shopname").val();
			if(shop==""){
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
				$("#addr_2").html("");
				$("#addr_3").html("");
				loadAddr(A_id,2);
			});
			$("#addr_2").change(function(){
				var A_id=$(this).children("option:selected").attr("A_id");
				$("#addr_3").html("");
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
						var p=0;
						if(n>0){
							for(var i=0;i<n;i++){
								var kk;
								switch(index){
								case 1:
									kk= addrs[i].areaname=='${addr_1}';
									break;
								case 2:
									kk= addrs[i].areaname=='${addr_2}';
									break;
								case 3:
									kk= addrs[i].areaname=='${addr_3}';
									break;
								}
								if(kk){
									html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"' selected='selected'>"+addrs[i].areaname+"</option>";
									p=i;
								}else{
									html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
								}
							}
						}
						$("#addr_"+index).html(html);
						loadAddr(addrs[p].areaid,++index);
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