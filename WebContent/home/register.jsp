<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>ע��</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<%@include file="/head.jsp" %>
		<link rel="stylesheet" href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="<%=path%>/css/dlstyle.css" rel="stylesheet" type="text/css">
        <%@include file="/prompt.jsp" %>
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
								<li class="am-active"><a href="">��ͨ��Աע��</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<span style="color:red">${msg}</span>	
									<!-- ����ע�� -->
									<form action="<%=path%>/register.html" method="post">	 
										<div class="user_element">
											<label for="name"><i class="am-icon-user"></i></label>
											<input type="text" class="input_block" name="username" id="username" placeholder="�������ǳ�" required="required">
		                 			   </div>
									   <div class="user_element">
											<label for="email"><i class="am-icon-envelope-o"></i></label>
											<input type="email" class="input_block" name="email" id="email" onblur="checkEmailFormat()" 
												   placeholder="�����������ַ" required="required">
											<button type="button" class="am-btn am-btn-default am-btn-xs sendVerifyCode">������֤��</button>
		                 			   </div>
	                                   <div class="user_element" style="display: flex;">
										    <label for="code"><i class="am-icon-rocket"></i></label>
										    <input type="text" class="input_block" name="verifyCode" id="verifyCode" onblur="checkVerify()" 
										    	   maxlength="6" placeholder="��������֤��" required="required">
										    <div style="width:40px;height:30px;font-size:12px;padding-top:11px">
										    	<span class="successIcon"><i class="am-icon-check-circle-o" style="color:green"></i>�ɹ�</span>
										    	<span class="failIcon"><i class="am-icon-close" style="color:red"></i>ʧ��</span>
										    </div>
						               </div>
						               <div class="user_element">
											<label for="phone"><i class="am-icon-phone"></i></label>
											<input type="text" class="input_block" name="phone" id="phone" 
											       onblur="checkPhone()" maxlength="11" placeholder="�������ֻ�����" required="required">
											<button style="display:none" type="button" class="am-btn am-btn-default am-btn-xs sendVerifyCode">������֤��</button>
		                 			   </div>
	                 				   <div class="user_element">
										    <label for="password"><i class="am-icon-lock"></i></label>
										    <input type="password" class="input_block" name="pwd" id="password" onblur="checkPwd()" placeholder="��������" required="required">
	                                   </div>										
	                				   <div class="user_element">
										    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
										    <input type="password" class="input_block" name="pwdRep" id="passwordRepeat" onblur="verifyPwd()" placeholder="ȷ������" required="required">
	                                   </div>
	                                    <div class="user_element">
										    <label for="realname"><i class="am-icon-child"></i></label>
										    <input type="text" class="input_block" name="realname" id="realname" placeholder="��ʵ����" required="required">
	                                   </div>
	                                   <div class="user_element">
										    <label for="gender"><i class="am-icon-female"></i></label>
										    <span class="input_group" required="required">
											    <input type="radio" name="gender" class="gender" value="1">��
											    <input type="radio" name="gender" class="gender" value="2">Ů
											    <input type="radio" name="gender" class="gender" value="3" checked="checked">����
										    </span>
	                                   </div>
	                                   <div class="user_element" required="required">
										    <label for="birthday"><i class="am-icon-birthday-cake"></i></label>
										    <input type="date" class="input_block" name="birthday" id="birthday" placeholder="ȷ������" required="required">
	                                   </div>
	                                    <div class="user_element" required="required">
										    <label for="addr"><i class="am-icon-area-chart"></i></label>
										    <span class="input_block">
											    <select name="addr_1" id="addr_1" required="required"></select>
											    <select name="addr_2" id="addr_2" class="childs" required="required"></select>
											    <select name="addr_3" id="addr_3" class="childs" required="required"></select>
											    <input type="text" name="addr_4" id="addr_4" required="required" placeholder="�ֵ���ַ" maxlength="50"/>
										    </span>
	                                   </div>
									   <div class="am-cf">
											<input type="submit" name="" value="ע��" onclick="return check()" class="am-btn am-btn-primary am-btn-sm am-fl">
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
			//��������ʽ
		}
		
		function checkUserFormat()
		{
			//��������ʽ
		}
		function checkPhone()
		{
	     	var count=$("#phone").val();
	     	var tel_reg=/^1[3|4|5|7|8]\d{9}$/;
	       	//var tel_reg=new RegExp("1[3|4|5|7|8]\\d{9}]$");
	     	if(count.trim()=="")
	     	{
	     		promptGlobal("�ף��ֻ����벻��Ϊ��");
	   		}
	       	else if(!tel_reg.test(count))
	       	{
	       		promptGlobal("�ף������ֻ������ʽ����ȷ");
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
					console.log("����");
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
			if(pwd=="") promptGlobal("���벻��Ϊ��");
		}
		
		function verifyPwd(){
			var verPwd=$("#passwordRepeat").val();
			if(verPwd!=pwd){
				promptGlobal("�������벻һ��")
				$("#passwordRepeat").val("");
			}
		}
		
		function check(){
			var user=$("#username").val();
			if(user.trim()==""){
				promptGlobal("�˻�����Ϊ��")
				return false;
			}
			if(!isVerify)       ///////////////////////////////�˴��ǵø���servlet����ȫ����
			{
				promptGlobal("��������ȷ����֤��")
				return false;
			}
			if(pwd.trim()==""){
				promptGlobal("���벻��Ϊ��")
				return false;
			}
			return true;
		}
		
		var count=60;
		function countTime(){
			var button=$(".sendVerifyCode");
			button.text((count--)+"������·���");
			if(count>=0){
				setTimeout(countTime,1000);
			}else{
				setTimeout(function(){
					button.text("������֤��");
					button.attr("disabled",false);
					count=60;
				},1000);
			}
		}
		$(function(){
			
			<%-- ��֤����첽����--%>
			$(".sendVerifyCode").click(function(){
				if($("#email").val()===''){
						promptGlobal("���䲻��Ϊ��");
						return false;
				}
				$(".sendVerifyCode").attr("disabled",true);
				$(".sendVerifyCode").text("���ڷ���...");
				console.log("������֤��...");
				
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
							 //$(".sendVerifyCode").text("60������·���");
							 countTime();
						 }else{
							 $(".sendVerifyCode").text("����ʧ��,���·���");
							 $(".sendVerifyCode").attr("disabled",false);
						 }
					},
					error:function(res,status){
						console.log("����ֵ:"+res+";  ����״̬:"+status);
						$(".sendVerifyCode").text("����ʧ��,���·���");
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
			
			<%-- ��ַ��ʼ�����첽����--%>
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
						console.log("#addr_"+index+"��ַ�첽���ش���");
					}
				});
			}
			loadAddr("-1",1);
		});
		</script>
	</body>
</html>