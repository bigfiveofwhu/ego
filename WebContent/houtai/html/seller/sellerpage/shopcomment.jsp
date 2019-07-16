<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../css/style.css">
		<link rel="stylesheet" href="../../../plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">评价管理</h3>
		</div>

		<div class="box-body">

			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
						</div>
					</div>
				</div>
				<form action="queryProduct.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select  name="isrepl y">
							<option value="">全部</option>
							<option value="01">未回复</option>
							<option value="02">已回复</option>
						</select>
						是否带图：
							<select  name="aab412">
							<option value="">全部</option>
							<option value="01">带图评论</option>
							<option value="02">未带图评论</option>
						</select>
						评论商品:
						<input type="text" name="aab202" value=""/>
						<input type="submit"  value="查询"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting">序号</th>
							<th class="sorting">评论商品id</th>
							<th class="sorting">评论商品名称</th>
							<th class="sorting">评论用户</th>
							<th class="sorting">评论内容</th>
							<th class="sorting">商品星级评价</th>
							<th class="sorting">评论图片</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${commentList}" var="ins" varStatus="vs">
						<tr>
							<td><input type="checkbox" ></td>
							<td>${vs.count}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aaa103}</td>
							<td>${ins.aab403}</td>
							<td>${ins.aab410}</td>
							<td>
							  <button>图片</button>
							</td>
						<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs"><a class="btn bg-olive btn-xs">回复</a></button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--数据列表/-->
				<tm-pagination conf="paginationConf"></tm-pagination>

			</div>
			<!-- 数据表格 /-->

		</div>
		<!-- /.box-body -->

	</body>

	<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../../plugins/angularjs/angular.min.js"></script>
	<!-- 分页组件开始 -->
	<script src="../../../plugins/angularjs/pagination.js"></script>
	<!-- 分页组件结束 -->
	<script type="text/javascript" src="../../../js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../../js/service/GoodsService.js"></script>
	<script type="text/javascript" src="../../../js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="../../../js/service/UploadService.js"></script>
	<script type="text/javascript" src="../../../js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="../../../js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="../../../js/service/BrandService.js"></script>
	<script type="text/javascript" src="../../../js/controller/GoodsController.js"></script>

</html>