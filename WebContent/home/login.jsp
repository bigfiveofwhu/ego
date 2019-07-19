<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>µÇÂ¼</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/login.js"></script>
	</head>
	<body>
		<div class="login-boxtitle">
			<a href="home.html"><img alt="logo" src="<%=path %>/images/logobig.png" /></a>
		</div>
		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="<%=path %>/images/big.jpg" /></div>
				<div class="login-box">
					<h3 class="title">µÇÂ¼ÉÌ³Ç</h3>
						<span id="lab"><font style="color:red;font-size:14px">${msg}</font></span>
					<div class="clear"></div>	
					<div class="login-form">
					   <form action="<%=path %>/home/login.html" method="post">
						    <div class="user_element">
							    <label for="email"><i class="am-icon-user"></i></label>
							    <input type="email" class="input_block" name="email" id="email" placeholder="ÓÊÏä" required="required">
			                </div>
			                <div class="user_element">
							    <label for="password"><i class="am-icon-lock"></i></label>
							    <input type="password" class="input_block" name="pwd" id="password" placeholder="ÇëÊäÈëÃÜÂë">
			                </div>
			                <div class="user_element">
							    <label for="code"><i class="am-icon-rocket"></i></label>
							    <input type="text" class="input_block" name="verifyCode" id="verifyCode" maxlength="6" placeholder="ÇëÊäÈëÑéÖ¤Âë">
							    <img alt="¼ÓÔØÊ§°Ü" onclick="javascript:getChange();" title="¿´²»Çå,»»Ò»ÕÅ" name="verifyImage"
									 id="verifyCodeImg" src="${path}/images/001/000001.jpg" width="53px" 
									 height="38px" border="1" align="absmiddle" style="margin-bottom:-16px"
									 style="cursor:pointer">
			                </div>
			                <div class="am-cf">
								<input type="submit" name="" value="µÇ Â¼" class="am-btn am-btn-primary am-btn-sm">
						 	</div>
			             </form>
			             <script type="text/javascript">
			             	function getChange(){
			             		$.ajax({
			             			url:"<%=path%>/getVerifyImg.ajax",
			             			type:"post",
			             			dataType:"json",
			             			timeout:20000,
			             			data:{
			             				
			             			},
			             			success:function(res,status){
			             				setTimeout(() => {
				             				$("#verifyCodeImg").attr("src",res.url);
										}, 1000);
			             				console.log("ÇëÇó³É¹¦!");
			             			},
			             			error:function(res,status){
			             				console.log("ÍøÂç¹ÊÕÏ!")
			             			}
			             		});
			             	}
			             	getChange();
			             </script>
			          </div>
		            <div class="login-links">
						<a href="<%=path %>/home/register.jsp" class="zcnext am-fr am-btn-default">×¢²á</a>
						<br />
		            </div>
					<div class="partner">		
					<h3>ºÏ×÷ÕËºÅ</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQµÇÂ¼</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>Î¢²©µÇÂ¼</span> </a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>Î¢ÐÅµÇÂ¼</span> </a></li>
					</div>
				</div>	
				</div>
			</div>
		</div>
		<%@ include file="/footer.jsp" %>
	</body>
</html>