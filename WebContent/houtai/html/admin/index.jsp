<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>


<!DOCTYPE html>
<html>

<head>
	<!-- 页面meta -->

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>运营商后台管理系统</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
</head>

<body class="hold-transition skin-green sidebar-mini" ng-app="shopping" ng-controller="AdminUserController" ng-init="getCookie('admin')">

<div class="wrapper">

	<!-- 页面头部 -->
	<header class="main-header">
		<a href="index.html" class="logo">
			<span class="logo-lg"><b>运营商后台</b></span>
		</a>
		<nav class="navbar navbar-static-top">
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle</span>
			</a>

			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<%=path%>/houtai/img/Logo.png" class="user-image" alt="User Image">
							<span class="hidden-xs">{{loginName}}</span>
						</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header ">
								<img src="<%=path%>/houtai/img/Logo.png" class="user-image" alt="User Image">
								<p>
									{{loginName}}
								</p>
							</li>

							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" data-toggle="modal" data-target="#editModal" class="btn btn-default btn-flat" ng-click="pojo={};newPassword=''">修改密码</a>
								</div>
								<div class="pull-right">
									<a href="#" class="btn btn-default btn-flat" ng-click="exit()">注销</a>
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
					<img src="<%=path%>/houtai/img/Logo.png" class="user-image" alt="User Image">
				</div>
				<div class="pull-left info ">
					<p> {{loginName}}</p>
				</div>
			</div>

			<!-- /.search form -->

			<!-- sidebar menu: : style can be found in sidebar.less -->
			<ul class="sidebar-menu">
				<li class="header">菜单</li>


				<!-- 菜单 -->
				<li class="treeview">
					<a href="#">
						<i class="fa fa-folder"></i>
						<span>商家管理</span>
						<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
					</a>
					<ul class="treeview-menu">

						<li id="admin-login">
							<a href="queryShop.html" target="iframe">
								<i class="fa fa-circle-o"></i>商家管理
							</a>
						</li>
						<li id="admin-login">
							<a href="queryServiceProvider.html" target="iframe">
								<i class="fa fa-circle-o"></i>服务商管理
							</a>
						</li>
					</ul>
				</li>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-folder"></i>
						<span>商品管理</span>
						<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
					</a>
					<ul class="treeview-menu">

						<li id="admin-login">
							<a href="queryGood.html" target="iframe">
								<i class="fa fa-circle-o"></i>商品审核
							</a>
						</li>
						<li id="admin-login">
							<a href="queryService.html" target="iframe">
								<i class="fa fa-circle-o"></i>服务审核
							</a>
						</li>
					</ul>
				</li>

				<li class="treeview">
					<a href="#">
						<i class="fa fa-folder"></i>
						<span>广告管理</span>
						<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
					</a>
					<ul class="treeview-menu">

						<li id="admin-login">
							<a href="/ego/advertise/adAudit.html" target="iframe">
								<i class="fa fa-circle-o"></i>广告账户管理
							</a>
						</li>
						<li id="admin-login">
							<a href="/ego/advertise/getPlatformAdInfo.html" target="iframe">
								<i class="fa fa-circle-o"></i>数据统计
							</a>
						</li>
						</ul>
						</li>
						
						<!-- 投诉管理 -->
						<li class="treeview">
					<a href="#">
						<i class="fa fa-folder"></i>
						<span>投诉管理</span>
						<span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
					</a>
					<ul class="treeview-menu">

						<li id="admin-login">
							<a href="<%=path %>/houtai/html/admin/queryJubao.html" target="iframe">
								<i class="fa fa-circle-o"></i>投诉管理
							</a>
						</li>
					</ul>
				</li>
				<!-- 菜单 /-->

			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>
	<!-- 导航侧栏 /-->

	<!-- 内容区域 -->
	<div class="content-wrapper">
		<iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="<%=path %>/houtai/html/admin/queryShop.html"></iframe>
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

<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">更改密码</h3>
			</div>
			<div class="modal-body">
				<table class="table table-bordered table-striped" width="800px">
					<tr>
						<td>旧密码</td>
						<td><input type="password" class="form-control" placeholder="旧密码" ng-model="pojo.oldPassword"> </td>
					</tr>
					<tr>
						<td>新密码</td>
						<td><input type="password" class="form-control" placeholder="新密码" ng-model="pojo.newPassword"> </td>
					</tr>
					<tr>
						<td>确认新密码</td>
						<td><input type="password" class="form-control" placeholder="确认密码" ng-model="newPassword"> </td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="changepasswd()">保存</button>
				<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</div>
</div>

</body>

<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
<script src="<%=path%>/houtai/plugins/adminLTE/js/app.min.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>s
<script type="text/javascript" src="<%=path%>/houtai/js/controller/AdminUserController.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/service/AdminUserService.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/common/common.js"></script>
</html>

