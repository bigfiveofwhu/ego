<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">商品管理</h3>
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
				<form action="<%=path %>/shop/queryProduct.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select ng-model="search_domain.auditStatus" name="qaab212">
							<option value="">全部</option>
							<option value="01">未审核</option>
							<option value="02">审核通过</option>
							<option value="03">审核未通过</option>
							<option value="04">已下架</option>
						</select>
						商品名称：<input name="qaab202" ng-model="search_domain.goodsName">
						<input type="submit"  value="查询"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting">序号</th>
							<th class="sorting">商品ID</th>
							<th class="sorting">商品名称</th>
							<th class="sorting">商品价格</th>
							<th class="sorting">商品分类</th>
							<th class="sorting">库存</th>
							<th class="sorting">状态</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="ins" varStatus="vs">
						<tr>
							<td><input type="checkbox" ></td>
							<td>${vs.count}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aab205}</td>
							<td>${ins.cnaab204}</td>
							<td>${ins.aab206}</td>
							<td>
							  ${ins.cnaab212}
							</td>
						<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs"><a class="btn bg-olive btn-xs">修改</a></button>
								<button type="button" class="btn bg-olive btn-xs" >
									<a class="btn bg-olive btn-xs"  >
										下架
									</a>
									<a class="btn bg-olive btn-xs"  >
										上架
									</a>
								</button>
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

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- 分页组件开始 -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="utf-8"></script>
	-->
	<!-- 分页组件结束 -->
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/GoodsService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/UploadService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/BrandService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/GoodsController.js"></script>

</html>