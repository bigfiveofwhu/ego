<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�����̺�̨����ϵͳ</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-blue sidebar-mini" ng-app="shopping" ng-controller="SellerLoginController" ng-init="getCookie('seller_name')">

		<div class="wrapper">

			<!-- ҳ��ͷ�� -->
			<header class="main-header">
				<!-- Logo -->
				<a href="<%=path %>/houtai/html/seller/sellerpage/home.jsp" class="logo">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>������</b></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><b>������</b>��̨</span>
				</a>
				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top">
					<!-- Sidebar toggle button-->
					<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
						<span class="sr-only">Toggle navigation</span>
					</a>

					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- User Account: style can be found in dropdown.less -->
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle text-center" data-toggle="dropdown">
									<img src="<%=path%>/images/upload/user_${aaa102}.jpg" class="user-image" alt="User Image">
									<span class="hidden-xs">${aaa103 }</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="<%=path %>/images/upload/user_${aaa102}.jpg" class="user-image" alt="User Image">
										<p>
											${aaa103}
										</p>
									</li>

									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="text-center">
											<a href="<%=path %>/logout.html" class="btn btn-default btn-flat">ע��</a>
										</div>
									</li>
								</ul>
							</li>

						</ul>
					</div>
				</nav>
			</header>
			<!-- ҳ��ͷ�� /-->

			<!-- �������� -->
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<%=path%>/images/upload/user_${aaa102}.jpg" class="user-image" alt="User Image">
						</div>
						<div class="pull-left info">
							<p>${aaa103}</p>
							<a href="#"><i class="fa fa-circle text-success"></i> ����</a>
						</div>
					</div>
					<ul class="sidebar-menu">
						<li class="header">�˵�</li>
						
						<!-- �˵� -->
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>��������</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">

									<a href="<%=path %>/service/showInfo.html" target="iframe">
										<i class="fa fa-circle-o"></i> ������Ϣ
									</a>
								</li>
								<li id="admin-login">
									<a href="<%=path %>/houtai/html/seller/sellerpage/password.jsp" target="iframe">
										<i class="fa fa-circle-o"></i> �޸�����

									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>�������</span>
								<span class="pull-right-container">
				       				<i class="fa fa-angle-left pull-right"></i>
				   		 		</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">
									<a href="<%=path %>/houtai/html/service_provider/service_edit.jsp" target="iframe">
										<i class="fa fa-circle-o"></i> ��������
									</a>
								</li>
								<li id="admin-login">
									<a href="<%=path %>/service/queryService.html" target="iframe">
										<i class="fa fa-circle-o"></i> �������
									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>��������</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">

									<a href="<%=path %>/service/queryOrder.html" target="iframe">
										<i class="fa fa-circle-o"></i> ��������

									</a>
								</li>
							</ul>
						</li>
						<!-- �˵� /-->
						<!-- ���۹��� -->
						<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>���۹���</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">
									<a href="<%=path %>/service/queryComment.html" target="iframe">
										<i class="fa fa-circle-o"></i> ���۹���
									</a>
								</li>
							</ul>
						</li>
						
						<!-- �ۺ���� -->
								<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>�ۺ����</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">
									<a href="<%=path %>/shop/queryShouhou.html" target="iframe">
										<i class="fa fa-circle-o"></i> �ۺ����
									</a>
								</li>
							</ul>
						</li>
						
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>
			<!-- �������� /-->

			<!-- �������� -->
			<div class="content-wrapper">
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="<%=path %>/service/showInfo.html"></iframe>
			</div>
			<!-- �������� /-->

			<!-- �ײ����� -->
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
					<b>Version</b> 1.0.0
				</div>
				ego�̳��ṩ����֧��
			</footer>
			<!-- �ײ����� /-->

		</div>
	</body>

	<!-- ҳ��meta /-->
	<script src="<%=path %>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path %>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/plugins/angularjs/angular.min.js"></script>
	<script src="<%=path %>/houtai/plugins/adminLTE/js/app.min.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/controller/SellerLoginController.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/service/SellerService.js"></script>
	<script type="text/javascript" src="<%=path %>/houtai/js/common/common.js"></script>
	
</html>