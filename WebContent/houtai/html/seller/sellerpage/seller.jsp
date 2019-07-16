<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�̼���������</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerController" ng-init="findOne(getCookie('seller'))">

		<!-- �������� -->
		<section class="content">

			<div class="box-body">

				<!--tabҳ-->
				<div class="nav-tabs-custom">

					<!--tabͷ-->
					<ul class="nav nav-tabs">

						<li class="active">
							<a href="#home" data-toggle="tab">�̼���Ϣ</a>
						</li>
					</ul>
					<!--tabͷ/-->

					<!--tab����-->
					<div class="tab-content">

						<!--������-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
							<form class="sui-form form-horizontal" name="myForm" novalidate>
								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��˾����" value="" ng-model="entity.nickName"required>
								</div>

								<div class="col-md-2 title">��˾�ֻ�</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"name="phone"  placeholder="��˾�ֻ�" value="" ng-model="entity.mobile"required >
								</div>

								<div class="col-md-2 title">��˾�绰</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��˾�绰" value="" ng-model="entity.telephone"required>
								</div>

								<div class="col-md-2 title">��˾��ϸ��ַ</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��˾��ϸ��ַ" value="" ng-model="entity.addressDetail"required>
								</div>

								<div class="col-md-2 title">��ϵ������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��ϵ������" value="" ng-model="entity.linkmanName"required>
								</div>

								<div class="col-md-2 title">��ϵ��QQ</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��ϵ��QQ" value="" ng-model="entity.linkmanQq"required>
								</div>

								<div class="col-md-2 title">��ϵ���ֻ�</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��ϵ���ֻ�" value="" ng-model="entity.linkmanMobile"required>
								</div>

								<div class="col-md-2 title">��ϵ��EMAIL</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��ϵ��EMAIL" value="" ng-model="entity.linkmanEmail"required>
								</div>

								<div class="col-md-2 title">Ӫҵִ�պ�</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="Ӫҵִ�պ�" value="" ng-model="entity.licenseNumber"required>
								</div>

								<div class="col-md-2 title">˰��Ǽ�֤��</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="˰��Ǽ�֤��" value="" ng-model="entity.taxNumber"required>
								</div>

								<div class="col-md-2 title">��֯��������֤</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="��֯��������֤" value="" ng-model="entity.orgNumber"required>
								</div>

								<div class="col-md-2 title">����������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="����������" value="" ng-model="entity.legalPerson"required>
								</div>

								<div class="col-md-2 title">�������������֤��</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="�������������֤��" value="" ng-model="entity.legalPersonCardId"required>
								</div>

								<div class="col-md-2 title">����������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="����������" value="" ng-model="entity.bankUser"required>
								</div>

								<div class="col-md-2 title">������֧��</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="������֧��" value="" ng-model="entity.bankName" required>
								</div>

								<div class="col-md-2 title">�����˺�</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="�����˺�" value="" ng-model="entity.bankAccount" required>
								</div>
									<div class="btn-toolbar list-toolbar">
										<button class="btn btn-primary" ng-click="update()" ng-disabled="!myForm.$valid" ><i class="fa fa-save" >����</i></button>
									</div>
								</form>
							</div>
						</div>

					</div>
					<!--tab����/-->
					<!--������/-->

				</div>

			</div>
			
		</section>
		<!-- �������� /-->

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