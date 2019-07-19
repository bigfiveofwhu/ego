<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商家修改密码</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerLoginController" >

		<!-- 正文区域 -->
		<section class="content">

			<div class="box-body">

				<!--tab页-->
				<div class="nav-tabs-custom">

					<!--tab头-->
					<ul class="nav nav-tabs">

						<li class="active">
							<a href="#home" data-toggle="tab">修改密码</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">

						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">

								<div class="col-md-2 title">原密码</div>
								<div class="col-md-10 data">
									<input type="password" class="form-control" placeholder="原密码" value="" ng-model="pojo.oldPassword">
								</div>

								<div class="col-md-2 title">新密码</div>
								<div class="col-md-10 data">
									<input type="password" class="form-control" placeholder="新密码" value="" ng-model="pojo.newPassword">
								</div>

								<div class="col-md-2 title">确认新密码</div>
								<div class="col-md-10 data">
									<input type="password" class="form-control" placeholder="确认新密码" value="" ng-model="newPassword">
								</div>
							</div>
						</div>

					</div>
					<!--tab内容/-->
					<!--表单内容/-->
				</div>
			</div>
			<div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary" ng-click="changepasswd()"><i class="fa fa-save" >保存</i></button>
			</div>

		</section>
		<!-- 正文区域 /-->

	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/SellerService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/SellerLoginController.js"></script>

</html>