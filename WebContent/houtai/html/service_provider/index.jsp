<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>服务商后台管理系统</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-blue sidebar-mini" ng-app="shopping" ng-controller="SellerLoginController" ng-init="getCookie('seller_name')">

		<div class="wrapper">

			<!-- 页面头部 -->
			<header class="main-header">
				<!-- Logo -->
				<a href="<%=path %>/houtai/html/seller/sellerpage/home.jsp" class="logo">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>服务商</b></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><b>服务商</b>后台</span>
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
											<a href="<%=path %>/logout.html" class="btn btn-default btn-flat">注销</a>
										</div>
									</li>
								</ul>
							</li>

						</ul>
					</div>
				</nav>
			</header>
			<!-- 页面头部 /-->

			<!-- 导航侧栏 -->
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
							<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
						</div>
					</div>
					<ul class="sidebar-menu">
						<li class="header">菜单</li>
						
						<!-- 菜单 -->
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>基本管理</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">

									<a href="<%=path %>/service/showInfo.html" target="iframe">
										<i class="fa fa-circle-o"></i> 基本信息
									</a>
								</li>
								<li id="admin-login">
									<a href="<%=path %>/houtai/html/seller/sellerpage/password.jsp" target="iframe">
										<i class="fa fa-circle-o"></i> 修改密码

									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>服务管理</span>
								<span class="pull-right-container">
				       				<i class="fa fa-angle-left pull-right"></i>
				   		 		</span>
							</a>
							<ul class="treeview-menu">

								<li id="admin-login">
									<a href="<%=path %>/houtai/html/service_provider/service_edit.jsp" target="iframe">
										<i class="fa fa-circle-o"></i> 新增服务
									</a>
								</li>
								<li id="admin-login">
									<a href="<%=path %>/service/queryService.html" target="iframe">
										<i class="fa fa-circle-o"></i> 服务管理
									</a>
								</li>
							</ul>
						</li>
						<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>订单管理</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">

									<a href="<%=path %>/service/queryOrder.html" target="iframe">
										<i class="fa fa-circle-o"></i> 订单管理

									</a>
								</li>
							</ul>
						</li>
						<!-- 菜单 /-->
						<!-- 评论管理 -->
						<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>评价管理</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">
									<a href="<%=path %>/service/queryComment.html" target="iframe">
										<i class="fa fa-circle-o"></i> 评价管理
									</a>
								</li>
							</ul>
						</li>
						
						<!-- 售后管理 -->
								<li class="treeview">
							<a href="#" >
								<i class="fa fa-folder"></i>
								<span>售后管理</span>
								<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				       		</a>
				       		<ul class="treeview-menu">
								<li id="admin-login">
									<a href="<%=path %>/shop/queryShouhou.html" target="iframe">
										<i class="fa fa-circle-o"></i> 售后管理
									</a>
								</li>
							</ul>
						</li>
						
					</ul>
				</section>
				<!-- /.sidebar -->
			</aside>
			<!-- 导航侧栏 /-->

			<!-- 内容区域 -->
			<div class="content-wrapper">
				<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="<%=path %>/service/showInfo.html"></iframe>
			</div>
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
					<b>Version</b> 1.0.0
				</div>
				ego商城提供技术支持
			</footer>
			<!-- 底部导航 /-->

		</div>
	</body>

	<!-- 页面meta /-->
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