<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品分类管理</title>
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/select2/select2.css" />
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/select2/select2-bootstrap.css" />
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app='shopping' ng-controller='ItemCatController' ng-init="findByParentId(0);findTypeList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">商品分类管理     
                       	</h3>
		</div>

		<div class="box-body">
			<ol class="breadcrumb">
				<li>
					<a href="#" ng-click="grade=1;selectList({id:0})">顶级分类列表</a>
				</li>
				<li>
					<a href="#" ng-click="grade=2;selectList(entity_1)">{{entity_1.name}}</a>
				</li>
				<li>
					<a href="#" ng-click="grade=3;selectList(entity_2)">{{entity_2.name}}</a>
				</li>
			</ol>

			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ng-click="entity={}"><i class="fa fa-file-o"></i> 新建</button>
							<button type="button" class="btn btn-default" title="删除" ng-click="delete()"><i class="fa fa-trash-o" ></i> 删除</button>
							<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-check"></i> 刷新</button>

						</div>
					</div>
				</div>

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">分类ID</th>
							<th class="sorting">分类名称</th>
							<th class="sorting">类型模板</th>

							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="entity in list">
							<td><input type="checkbox" ng-click="updateSelection($event,entity.id)"></td>
							<td>{{entity.id}}</td>
							<td>{{entity.name}}</td>
							<td>{{entity.typeId}} </td>
							<td class="text-center">
								<span ng-if="grade!=3">
		                                      <button type="button" class="btn bg-olive btn-xs" ng-click="setGrade(grade+1);selectList(entity)" >查询下级</button> 		                                     
		                                 	</span>
								<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)">修改</button>
							</td>
						</tr>
					</tbody>
				</table>

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
						<h3 id="myModalLabel">商品分类编辑</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>上级商品分类</td>
								<td>
									{{entity_1.name}} >> {{entity_2.name}}
								</td>
							</tr>
							<tr>
								<td>商品分类名称</td>
								<td><input class="form-control" ng-model="entity.name" placeholder="商品分类名称"> </td>
							</tr>
							<tr>
								<td>类型模板</td>
								<td>
									<input select2 select2-model="entity.typeId" config="typeList" placeholder="商品类型模板" class="form-control" type="text" />
								</td>
							</tr>
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

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/ItemCatController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/select2/angular-select2.js"></script>

</html>