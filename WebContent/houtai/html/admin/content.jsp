<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>������</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app='shopping' ng-controller='ContentController' ng-init="findContentCategoryList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">������</h3>
		</div>

		<div class="box-body">

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="�½�" data-toggle="modal" data-target="#editModal" ng-click="entity={}"><i class="fa fa-file-o"></i> �½�</button>
							<button type="button" class="btn btn-default" title="ɾ��" ng-click="delete()"><i class="fa fa-trash-o"></i> ɾ��</button>
							<button type="button" class="btn btn-default" title="ˢ��" onclick="window.location.reload();"><i class="fa fa-refresh"></i> ˢ��</button>
						</div>
					</div>
				</div>
				<div class="box-tools pull-right">
					<div class="has-feedback">

					</div>
				</div>
				<!--������/-->

				<!--�����б�-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">���ID</th>
							<th class="sorting">����ID</th>
							<th class="sorting">����</th>
							<th class="sorting">URL</th>
							<th class="sorting">ͼƬ</th>
							<th class="sorting">����</th>
							<th class="sorting">�Ƿ���Ч</th>
							<th class="text-center">����</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="entity in list">
							<td><input type="checkbox" ng-click="updateSelection($event,entity.id)"></td>
							<td>{{entity.id}}</td>
							<td>{{itemCatList[entity.categoryId]}}</td>
							<td>{{entity.title}}</td>
							<td>{{entity.url}}</td>
							<td>
								<img alt="" src="{{entity.pic}}" width="100px" height="50px">
							</td>
							<td>{{entity.sortOrder}}</td>
							<td>{{status[entity.status]}}</td>
							<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)">�޸�</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--�����б�/-->
				<tm-pagination conf="paginationConf"></tm-pagination>
			</div>
			<!-- ���ݱ�� /-->
		</div>
		<!-- /.box-body -->

		<!-- �༭���� -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
						<h3 id="myModalLabel">���༭</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>������</td>
								<td>
									<select class="form-control" ng-model="entity.categoryId" ng-options="item.id as item.name  for item in contentCategoryList"></select>
								</td>
							</tr>
							<tr>
								<td>����</td>
								<td><input class="form-control" ng-model="entity.title" placeholder="����"> </td>
							</tr>
							<tr>
								<td>URL</td>
								<td><input class="form-control" ng-model="entity.url" placeholder="URL"> </td>
							</tr>
							<tr>
								<td>����</td>
								<td><input class="form-control" ng-model="entity.sortOrder" placeholder="����"> </td>
							</tr>
							<tr>
								<td>���ͼƬ</td>
								<td>
									<table>
										<tr>
											<td>
												<input type="file" id="file" />
												<button class="btn btn-primary" type="button" ng-click="uploadFile()">�ϴ�</button>
											</td>
											<td>
												<img src="{{entity.pic}}" width="200px" height="100px">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>�Ƿ���Ч</td>
								<td>
									<input type="checkbox" ng-model="entity.status" ng-true-value="1" ng-false-value="0">
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="save()">����</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">�ر�</button>
					</div>
				</div>
			</div>
		</div>

	</body>
	
	
	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ContentService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ContentCategoryService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/UploadService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/ContentController.js"></script>

</html>