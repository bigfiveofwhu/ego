<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>服务商完善资料</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerController" ng-init="findOne(getCookie('seller'))">

		<!-- 正文区域 -->
		<section class="content">

			<div class="box-body">

				<!--tab页-->
				<div class="nav-tabs-custom">

					<!--tab头-->
					<ul class="nav nav-tabs">

						<li class="active">
							<a href="#home" data-toggle="tab">服务商信息</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">

						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<div class="col-md-2 title">服务商名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly" value="${sp.aac103 }" name="aac103" required>
								</div>


								<div class="col-md-2 title">地址</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.aac104 }" name="aac104" required>
								</div>
								
								<div class="col-md-2 title">城市</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.cnaac105 }" name="cnaac105" required>
								</div>
								
								<div class="col-md-2 title">服务类型</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.cnaac106 }" name="cnaac106" required>
								</div>

								<div class="col-md-2 title">认证信息</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.aac107 }" name="aac106" required>
								</div>

								<div class="col-md-2 title">服务商状态</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.cnaac108 }" name="cnaac108" required>
								</div>

								<div class="col-md-2 title">保证金</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.aac109 }" name="aac109" required>
								</div>

								<div class="col-md-2 title">服务评分</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${sp.aac110 }" name="aac110" required>
								</div>

				
							</div>
						</div>

					</div>
					<!--tab内容/-->
					<!--表单内容/-->

				</div>

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
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/SellerController.js"></script>

</html>