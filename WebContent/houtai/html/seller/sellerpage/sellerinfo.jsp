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
								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly" value="${shop.aab103 }" name="aab103" required>
								</div>

								<div class="col-md-2 title">�������û���</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  readonly="readonly"  value="${shop.aab104 }" name="aab104" required >
								</div>

								<div class="col-md-2 title">���̵�ַ</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab105 }" name="aab105" required>
								</div>

								<div class="col-md-2 title">��֤��Ϣ</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab106 }" name="aab106" required>
								</div>

								<div class="col-md-2 title">����״̬</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.cnaab107 }" name="cnaab107" required>
								</div>

								<div class="col-md-2 title">��֤��</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab108 }" name="aab108" required>
								</div>

								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab109 }" name="aab109" required>
								</div>

								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" readonly="readonly"  value="${shop.aab110 }" name="aab110" required>
								</div>

								<div class="col-md-2 title">��Ʒ����</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  readonly="readonly"  value="${shop.aab111 }" name="aab111" required>
								</div>
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