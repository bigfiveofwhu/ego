<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<title>��¼</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" />
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
					<h3 class="title">��¼�̳�</h3>
						<span id="lab"><font style="color:red;font-size:14px">${errorMsg}</font></span>
					<div class="clear"></div>	
					<div class="login-form">
					   <form action="<%=path %>/login" method="post">
						    <div class="user-name">
							    <label for="user"><i class="am-icon-user"></i></label>
							    <input type="text" name="username" id="user" placeholder="����/�ֻ�/�û���">
			                </div>
			                <div class="user-pass">
							    <label for="password"><i class="am-icon-lock"></i></label>
							    <input type="password" name="password" id="password" placeholder="����������">
			                </div>
			                <div class="user-pass">
							    <label for="password"><i class="am-icon-rocket"></i></label>
							    <input type="password" name="verifyCode" id="verifyCode" placeholder="��������֤��">
			                </div>
			                <div class="am-cf">
								<input type="submit" name="" value="�� ¼" class="am-btn am-btn-primary am-btn-sm">
						 	</div>
			             </form>
			          </div>
		            <div class="login-links">
						<a href="<%=path %>/home/register.jsp" class="zcnext am-fr am-btn-default">ע��</a>
						<br />
		            </div>
					<div class="partner">		
					<h3>�����˺�</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ��¼</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>΢����¼</span> </a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>΢�ŵ�¼</span> </a></li>
					</div>
				</div>	
				</div>
			</div>
		</div>
		<%@ include file="/footer.jsp" %>
	</body>
</html>