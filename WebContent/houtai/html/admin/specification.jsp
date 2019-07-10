<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>规格管理</title>
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../css/style.css">
		<link rel="stylesheet" href="../../plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SpecificationController">
		<div class="box-header with-border">
			<h3 class="box-title">规格管理</h3>
		</div>
		<div class="box-body">
			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ng-click="entity={'specificationOptionList':[]}"><i class="fa fa-file-o"></i> 新建</button>
							<button type="button" class="btn btn-default" title="删除" ng-click="delete()"><i class="fa fa-trash-o"></i> 删除</button>
							<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
						</div>
					</div>
				</div>
				<div class="box-tools pull-right">
					<div class="has-feedback">
						规格名称：<input ng-model="search_domain.specName">
						<button class="btn btn-default" ng-click="search()">查询</button>
					</div>
				</div>
				<!--工具栏/-->
				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">规格ID</th>
							<th class="sorting">规格名称</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="entity in list">
							<td><input type="checkbox" ng-click="updateSelection($event,entity.id)"></td>
							<td>{{entity.id}}</td>
							<td>{{entity.specName}}</td>
							<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)">修改</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--数据列表/-->
				<tm-pagination conf="paginationConf"></tm-pagination>
			</div>
			<!-- 数据表格 /-->
		</div>
		<!-- /.box-body -->

		<!-- 编辑窗口 -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">规格编辑</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>规格名称</td>
								<td><input class="form-control" placeholder="规格名称" ng-model="entity.specification.specName"> </td>
							</tr>
						</table>

						<!-- 规格选项 -->
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="新建" ng-click="addTableRow()"><i class="fa fa-file-o"></i> 新增规格选项</button>

						</div>

						<table class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th class="sorting">规格选项</th>
									<th class="sorting">排序</th>
									<th class="sorting">操作</th>
								</tr>
							</thead>
							<tbody ng-repeat="pojo in entity.specificationOptionList">
								<tr>

									<td>
										<input ng-model="pojo.optionName" class="form-control" placeholder="规格选项">
									</td>
									<td>
										<input ng-model="pojo.orders" class="form-control" placeholder="排序">
									</td>
									<td>
										<button type="button" class="btn btn-default" title="删除" ng-click="deleTableRow($index)"><i class="fa fa-trash-o"></i> 删除</button>
									</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="save()">保存</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>

	</body>

	
	<script src="../../plugins/angularjs/angular.min.js"></script>
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- 分页组件 -->
	<script src="../../plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="../../js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="../../js/controller/SpecificationController.js"></script>

</html>