<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
	����<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�̼����</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../css/style.css">
		<link rel="stylesheet" href="../../plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerController">
		<!-- .box-body -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">�̼ҹ���</h3>
			</div>

			<div class="box-body">

				<!-- ���ݱ�� -->
				<div class="table-box">

					<!--������-->
                   <form action="queryShop.html" method="post">
					<div class="box-tools pull-right">
						<div class="has-feedback">
							״̬��
							<select ng-model="search_domain.status" name="qaab107">
								<option value="">ȫ��</option>
								<option value="01" >δ���</option>
								<option value="02" >���ͨ��</option>
								<option value="03" >���δͨ��</option>
								<option value="04" >�ر�</option>
							</select>
							 �������ƣ� <input name="qaab103" ng-model="search_domain.nickName">
							<input type="submit" class="btn btn-default" value="��ѯ" ></input>
						</div>
					</div>
					</form>
					<!--������/-->

					<!--�����б�-->
					<table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="margin-left:10px">
						<thead>
							<tr>
							    <th class="sorting">���</th>
								<th class="sorting_asc">�̼�ID</th>
								<th class="sorting">��������</th>
								<th class="sorting">��ϵ������</th>
								<th class="sorting">��ϵ�˵绰</th>
								<th class="sorting">״̬</th>
								<th class="text-center">����</th>
							</tr>
						</thead>
						<tbody>
						<!-- ��ʾ�鵽������ -->
						<c:forEach items="${shoplist }" var="ins" varStatus="vs">
						    <tr >
								<td>${vs.count }</td>
								<td>${ins.aab102 }</td>
								<td>${ins.aab103 }</td>
								<td>${ins.aaa109 }</td>
								<td>${ins.aaa108 }</td>
								<td>${ins.cnaab107 }</td>
								<td class="text-center">
									<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#sellerModal" ng-click="findOne(entity.sellerId)">����</button>
								</td>
							</tr>
						</c:forEach>
							
						</tbody>
					</table>
					<!--�����б�/-->
					<tm-pagination conf="paginationConf"></tm-pagination>

				</div>
				<!-- ���ݱ�� /-->

			</div>
			<!-- /.box-body -->

			<!-- �̼����� -->
			<div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
							<h3 id="myModalLabel">�̼�����</h3>
						</div>
						<div class="modal-body">

							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#home" data-toggle="tab">������Ϣ</a>
								</li>
								<li>
									<a href="#linkman" data-toggle="tab">��ϵ��</a>
								</li>
								<li>
									<a href="#certificate" data-toggle="tab">֤��</a>
								</li>
								<li>
									<a href="#ceo" data-toggle="tab">����������</a>
								</li>
								<li>
									<a href="#bank" data-toggle="tab">������</a>
								</li>
							</ul>

							<!-- ѡ���ʼ -->
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane active in" id="home">
									<br>
									<table class="table table-bordered table-striped" width="800px">
										<tr>
											<td>��˾����</td>
											<td>{{entity.name}}</td>
										</tr>
										<tr>
											<td>��˾�ֻ�</td>
											<td>{{entity.mobile}}</td>
										</tr>
										<tr>
											<td>��˾�绰</td>
											<td>{{entity.telephone}}</td>
										</tr>
										<tr>
											<td>��˾��ϸ��ַ</td>
											<td>{{entity.addressDetail}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="linkman">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>��ϵ������</td>
											<td>{{entity.linkmanName}}</td>
										</tr>
										<tr>
											<td>��ϵ��QQ</td>
											<td>{{entity.linkmanQq}}</td>
										</tr>
										<tr>
											<td>��ϵ���ֻ�</td>
											<td>{{entity.linkmanMobile}}</td>
										</tr>
										<tr>
											<td>��ϵ��E-Mail</td>
											<td>{{entity.linkmanEmail}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="certificate">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>Ӫҵִ�պ�</td>
											<td>{{entity.licenseNumber}}</td>
										</tr>
										<tr>
											<td>˰��Ǽ�֤��</td>
											<td>{{entity.taxNumber}}</td>
										</tr>
										<tr>
											<td>��֯��������֤��</td>
											<td>{{entity.orgNumber}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="ceo">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>����������</td>
											<td>{{entity.legalPerson}}</td>
										</tr>
										<tr>
											<td>�������������֤��</td>
											<td>{{entity.legalPersonCardId}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="bank">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>����������</td>
											<td>{{entity.bankUser}}</td>
										</tr>
										<tr>
											<td>������֧��</td>
											<td>{{entity.bankName}}</td>
										</tr>
										<tr>
											<td>�����˺�</td>
											<td>{{entity.bankAccount}}</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- ѡ����� -->

						</div>
						<div class="modal-footer">
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'1')">���ͨ��</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'2')">���δͨ��</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'3')">�ر��̼�</button>
							<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">�ر�</button>
						</div>
					</div>
				</div>
			</div>

	</body>

	
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../plugins/angularjs/angular.min.js"></script>
	<!-- ��ҳ��� -->
	<script src="../../plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="../../js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/service/SellerService.js"></script>
	<script type="text/javascript" src="../../js/controller/SellerController.js"></script>

</html>