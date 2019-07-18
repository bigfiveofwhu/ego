<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商家完善资料</title>
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
							<a href="#home" data-toggle="tab">商家信息</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">

						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<div class="col-md-2 title">店铺名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly" value="${shop.aab103 }" name="aab103" required>
								</div>

								<div class="col-md-2 title">店铺信用积分</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  readonly="readonly"  value="${shop.aab104 }" name="aab104" required >
								</div>

								<div class="col-md-2 title">店铺地址</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab105 }" name="aab105" required>
								</div>

								<div class="col-md-2 title">认证信息</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab106 }" name="aab106" required>
								</div>

								<div class="col-md-2 title">店铺状态</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.cnaab107 }" name="cnaab107" required>
								</div>

								<div class="col-md-2 title">保证金</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab108 }" name="aab108" required>
								</div>

								<div class="col-md-2 title">物流评分</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab109 }" name="aab109" required>
								</div>

								<div class="col-md-2 title">服务评分</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab110 }" name="aab110" required>
								</div>

								<div class="col-md-2 title">商品评分</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  readonly="readonly"  value="${shop.aab111 }" name="aab111" required>
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