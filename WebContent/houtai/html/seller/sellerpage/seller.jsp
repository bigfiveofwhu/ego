<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商家完善资料</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../css/style.css">
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
							<form class="sui-form form-horizontal" name="myForm" novalidate>
								<div class="col-md-2 title">店铺名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="公司名称" value="" ng-model="entity.nickName"required>
								</div>

								<div class="col-md-2 title">公司手机</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"name="phone"  placeholder="公司手机" value="" ng-model="entity.mobile"required >
								</div>

								<div class="col-md-2 title">公司电话</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="公司电话" value="" ng-model="entity.telephone"required>
								</div>

								<div class="col-md-2 title">公司详细地址</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="公司详细地址" value="" ng-model="entity.addressDetail"required>
								</div>

								<div class="col-md-2 title">联系人姓名</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="联系人姓名" value="" ng-model="entity.linkmanName"required>
								</div>

								<div class="col-md-2 title">联系人QQ</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="联系人QQ" value="" ng-model="entity.linkmanQq"required>
								</div>

								<div class="col-md-2 title">联系人手机</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="联系人手机" value="" ng-model="entity.linkmanMobile"required>
								</div>

								<div class="col-md-2 title">联系人EMAIL</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="联系人EMAIL" value="" ng-model="entity.linkmanEmail"required>
								</div>

								<div class="col-md-2 title">营业执照号</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="营业执照号" value="" ng-model="entity.licenseNumber"required>
								</div>

								<div class="col-md-2 title">税务登记证号</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="税务登记证号" value="" ng-model="entity.taxNumber"required>
								</div>

								<div class="col-md-2 title">组织机构代码证</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="组织机构代码证" value="" ng-model="entity.orgNumber"required>
								</div>

								<div class="col-md-2 title">法定代表人</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="法定代表人" value="" ng-model="entity.legalPerson"required>
								</div>

								<div class="col-md-2 title">法定代表人身份证号</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="法定代表人身份证号" value="" ng-model="entity.legalPersonCardId"required>
								</div>

								<div class="col-md-2 title">开户行名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="开户行名称" value="" ng-model="entity.bankUser"required>
								</div>

								<div class="col-md-2 title">开户行支行</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="开户行支行" value="" ng-model="entity.bankName" required>
								</div>

								<div class="col-md-2 title">银行账号</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="银行账号" value="" ng-model="entity.bankAccount" required>
								</div>
									<div class="btn-toolbar list-toolbar">
										<button class="btn btn-primary" ng-click="update()" ng-disabled="!myForm.$valid" ><i class="fa fa-save" >保存</i></button>
									</div>
								</form>
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
	<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../../plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="../../../js/base/Base.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../../js/service/SellerService.js"></script>
	<script type="text/javascript" src="../../../js/controller/SellerController.js"></script>

</html>