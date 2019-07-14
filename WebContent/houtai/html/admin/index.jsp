<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��Ӫ�̺�̨����ϵͳ</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../css/style.css">
	</head>

	<body class="hold-transition skin-green sidebar-mini" ng-app="shopping" ng-controller="AdminUserController" ng-init="getCookie('admin')">

		<div class="wrapper">

			<!-- ҳ��ͷ�� -->
			<header class="main-header">
				<a href="index.html" class="logo">
					<span class="logo-lg"><b>��Ӫ�̺�̨</b></span>
				</a>
				<nav class="navbar navbar-static-top">
					<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
						<span class="sr-only">Toggle</span>
					</a>

					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img src="../../img/Logo.png" class="user-image" alt="User Image">
									<span class="hidden-xs">{{loginName}}</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header ">
										<img src="../../img/Logo.png" class="user-image" alt="User Image">
										<p>
											{{loginName}}
										</p>
									</li>

									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="#" data-toggle="modal" data-target="#editModal" class="btn btn-default btn-flat" ng-click="pojo={};newPassword=''">�޸�����</a>
										</div>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-flat" ng-click="exit()">ע��</a>
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
							<img src="../../img/Logo.png" class="user-image" alt="User Image">
						</div>
						<div class="pull-left info ">
							<p> {{loginName}}</p>
						</div>
					</div>

					<!-- /.search form -->

					<!-- sidebar menu: : style can be found in sidebar.less -->
					<ul class="sidebar-menu">
						<li class="header">�˵�</li>
						

						<!-- �˵� -->
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>�̼ҹ���</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">
									<a href="queryShop.html" target="iframe">
										<i class="fa fa-circle-o"></i>�̼ҹ���
									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>��Ʒ����</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">
									<a href="brand.html" target="iframe">
										<i class="fa fa-circle-o"></i>Ʒ�ƹ���
									</a>
								</li>
								<li id="admin-login">
									<a href="specification.html" target="iframe">
										<i class="fa fa-circle-o"></i>������
									</a>
								</li>
								<li id="admin-login">
									<a href="type_template.html" target="iframe">
										<i class="fa fa-circle-o"></i>ģ�����
									</a>
								</li>
								<li id="admin-login">
									<a href="item_cat.html" target="iframe">
										<i class="fa fa-circle-o"></i>�������
									</a>
								</li>
								<li id="admin-login">
									<a href="goods.html" target="iframe">
										<i class="fa fa-circle-o"></i>��Ʒ���
									</a>
								</li>
							</ul>
						</li>

						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>������</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">
									<a href="content_category.html" target="iframe">
										<i class="fa fa-circle-o"></i>������͹���
									</a>
								</li>
								<li id="admin-login">
									<a href="content.html" target="iframe">
										<i class="fa fa-circle-o"></i>������
									</a>
								</li>
							</ul>
						</li>
						<!-- �˵� /-->

					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>
			<!-- �������� /-->

			<!-- �������� -->
			<div class="content-wrapper">
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="seller.jsp"></iframe>
			</div>
			<!-- �������� /-->

			<!-- �ײ����� -->
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
					<b>Version</b> 1.0.0
				</div>
				********�ṩ����֧��
			</footer>
			<!-- �ײ����� /-->
		</div>

		<!-- �༭���� -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
						<h3 id="myModalLabel">��������</h3>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>������</td>
								<td><input type="password" class="form-control" placeholder="������" ng-model="pojo.oldPassword"> </td>
							</tr>
							<tr>
								<td>������</td>
								<td><input type="password" class="form-control" placeholder="������" ng-model="pojo.newPassword"> </td>
							</tr>
							<tr>
								<td>ȷ��������</td>
								<td><input type="password" class="form-control" placeholder="ȷ������" ng-model="newPassword"> </td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="changepasswd()">����</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">�ر�</button>
					</div>
				</div>
			</div>
		</div>

	</body>

	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../plugins/angularjs/angular.min.js"></script>
	<script src="../../plugins/adminLTE/js/app.min.js"></script>
	<script type="text/javascript" src="../../js/base/Base.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/controller/AdminUserController.js"></script>
	<script type="text/javascript" src="../../js/service/AdminUserService.js"></script>
	<script type="text/javascript" src="../../js/common/common.js"></script>
</html>