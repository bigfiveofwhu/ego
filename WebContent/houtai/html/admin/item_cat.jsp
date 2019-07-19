<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��Ʒ�������</title>
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
			<h3 class="box-title">��Ʒ�������     
                       	</h3>
		</div>

		<div class="box-body">
			<ol class="breadcrumb">
				<li>
					<a href="#" ng-click="grade=1;selectList({id:0})">���������б�</a>
				</li>
				<li>
					<a href="#" ng-click="grade=2;selectList(entity_1)">{{entity_1.name}}</a>
				</li>
				<li>
					<a href="#" ng-click="grade=3;selectList(entity_2)">{{entity_2.name}}</a>
				</li>
			</ol>

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="�½�" data-toggle="modal" data-target="#editModal" ng-click="entity={}"><i class="fa fa-file-o"></i> �½�</button>
							<button type="button" class="btn btn-default" title="ɾ��" ng-click="delete()"><i class="fa fa-trash-o" ></i> ɾ��</button>
							<button type="button" class="btn btn-default" title="ˢ��" onclick="window.location.reload();"><i class="fa fa-check"></i> ˢ��</button>

						</div>
					</div>
				</div>

				<!--�����б�-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">����ID</th>
							<th class="sorting">��������</th>
							<th class="sorting">����ģ��</th>

							<th class="text-center">����</th>
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
		                                      <button type="button" class="btn bg-olive btn-xs" ng-click="setGrade(grade+1);selectList(entity)" >��ѯ�¼�</button> 		                                     
		                                 	</span>
								<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" ng-click="findOne(entity.id)">�޸�</button>
							</td>
						</tr>
					</tbody>
				</table>

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
						<h3 id="myModalLabel">��Ʒ����༭</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>�ϼ���Ʒ����</td>
								<td>
									{{entity_1.name}} >> {{entity_2.name}}
								</td>
							</tr>
							<tr>
								<td>��Ʒ��������</td>
								<td><input class="form-control" ng-model="entity.name" placeholder="��Ʒ��������"> </td>
							</tr>
							<tr>
								<td>����ģ��</td>
								<td>
									<input select2 select2-model="entity.typeId" config="typeList" placeholder="��Ʒ����ģ��" class="form-control" type="text" />
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
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/ItemCatController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/select2/angular-select2.js"></script>

</html>