<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>购物商城运营商管理后台</title>
		<link rel="icon" href="../assets/img/favicon.ico">
		<link rel="stylesheet" type="text/css" href="../../css/webbase.css" />
		<link rel="stylesheet" type="text/css" href="../../css/pages-login-manage.css" />
		<link rel="stylesheet" href="../../plugins/jquery-front-end-verify/css/verify.css" />

	</head>

	<body ng-app="shopping" ng-controller="AdminUserController">
		<div class="loginmanage">
			<div class="py-container">
				<h4 class="manage-title">运营商管理后台</h4>
				<div class="loginform">

					<ul class="sui-nav nav-tabs tab-wraped">
						<li>
							<a href="#index" data-toggle="tab">
								<h3>扫描登录</h3>
							</a>
						</li>
						<li class="active">
							<a href="#profile" data-toggle="tab">
								<h3>账户登录</h3>
							</a>
						</li>
					</ul>
					<div class="tab-content tab-wraped">
						<div id="index" class="tab-pane">
							<p>二维码登录</p>
							<img src="" />
						</div>
						<div id="profile" class="tab-pane  active">
							<form class="sui-form" name="myForm">
								<div class="input-prepend"><span class="add-on loginname"></span>
									<input ng-model="entity.username" type="text" placeholder="用户名" class="span2 input-xfat" required>
								</div>
								<div class="input-prepend"><span class="add-on loginpwd"></span>
									<input ng-model="entity.password" type="password" placeholder="请输入密码" class="span2 input-xfat" required>
								</div>
								<div class="setting">
									<div id="mpanel4" >
									
									</div>
								</div>
								<div id="loginBtn" class="logined" hidden="true">
									<a class="sui-btn btn-block btn-xlarge btn-danger" ng-disabled="!myForm.$valid" ng-click="login(entity)" >登&nbsp;&nbsp;录</a>
								</div>
							</form>

						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<!--foot-->
		<div class="py-container copyright">
			<ul>
				<li>关于我们</li>
				<li>联系我们</li>
				<li>联系客服</li>
				<li>商家入驻</li>
				<li>营销中心</li>
				<li>手机App</li>
				<li>销售联盟</li>
				<li>商家社区</li>
			</ul>
			<div class="address">地址：广州番禺职业技术学院 邮编：515644 电话：110-100-110 </div>
			<div class="beian">广州番禺区
			</div>
		</div>
	</body>

	
	<script src="../../plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="../../js/base/Base.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/service/AdminUserService.js"></script>
	<script type="text/javascript" src="../../js/controller/AdminUserController.js"></script>
	<script type="text/javascript" src="../../plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="../../plugins/sui/sui.min.js"></script>
	<script type="text/javascript" src="../../plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
	<script type="text/javascript" src="../../js/pages/jquery.slideunlock.js"></script>
	<script type="text/javascript" src="../../plugins/jquery-front-end-verify/js/jquery.min.js" ></script>
	<script type="text/javascript" src="../../plugins/jquery-front-end-verify/js/verify.js" ></script>
	<script>
		$('#mpanel4').slideVerify({
			type : 2,		//类型
			vOffset : 4,	//误差量，根据需求自行调整
			vSpace : 5,	//间隔
			imgName : ['../../../img/1.jpg', '../../../img/2.jpg'],
			imgSize : {
				width: '335px',
				height: '100px',
			},
			blockSize : {
				width: '40px',
				height: '40px',
			},
			barSize : {
				width : '335px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				 $("#loginBtn").show();
			},
			error : function() {
			     
			}
		});
	</script>

</html>