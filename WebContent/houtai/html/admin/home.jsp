<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理系统</title>
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../css/style.css">
	</head>

	<body class="hold-transition skin-blue sidebar-mini">

		<section class="content-header">
			<h1>控制面板 </h1>
			<ol class="breadcrumb">
				<li>
					<a href="../webfront/index.html"><i class="fa fa-dashboard"></i> 首页</a>
				</li>
			</ol>
		</section>
		<section class="content">

			<!-- 统计数值 -->
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<div class="inner">
							<h3>150</h3>

							<p>新订单</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="all-order-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h3>53<sup style="font-size: 20px">%</sup></h3>

							<p>转化率</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow">
						<div class="inner">
							<h3>44</h3>

							<p>新注册用户</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="all-member-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">
							<h3>65</h3>

							<p>日PV</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
						<a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- 正文区域 /-->

		<!-- 内容区域 /-->
	</body>

	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>

</html>