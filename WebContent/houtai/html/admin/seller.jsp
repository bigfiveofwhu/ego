<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<!-- 页面meta -->
	　　<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商家审核</title>
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
				<h3 class="box-title">商家管理</h3>
			</div>

			<div class="box-body">

				<!-- 数据表格 -->
				<div class="table-box">

					<!--工具栏-->
                   <form action="queryShop.html" method="post">
					<div class="box-tools pull-right">
						<div class="has-feedback">
							状态：
							<select ng-model="search_domain.status" name="qaab107">
								<option value="">全部</option>
								<option value="01" >未审核</option>
								<option value="02" >审核通过</option>
								<option value="03" >审核未通过</option>
								<option value="04" >关闭</option>
							</select>
							 店铺名称： <input name="qaab103" ng-model="search_domain.nickName">
							<input type="submit" class="btn btn-default" value="查询" ></input>
						</div>
					</div>
					</form>
					<!--工具栏/-->

					<!--数据列表-->
					<table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="margin-left:10px">
						<thead>
							<tr>
							    <th class="sorting">序号</th>
								<th class="sorting_asc">商家ID</th>
								<th class="sorting">店铺名称</th>
								<th class="sorting">联系人姓名</th>
								<th class="sorting">联系人电话</th>
								<th class="sorting">状态</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
						<!-- 显示查到的数据 -->
						<c:forEach items="${shoplist }" var="ins" varStatus="vs">
						    <tr >
								<td>${vs.count }</td>
								<td>${ins.aab102 }</td>
								<td>${ins.aab103 }</td>
								<td>${ins.aaa109 }</td>
								<td>${ins.aaa108 }</td>
								<td>${ins.cnaab107 }</td>
								<td class="text-center">
									<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#sellerModal" ng-click="findOne(entity.sellerId)">详情</button>
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

			<!-- 商家详情 -->
			<div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3 id="myModalLabel">商家详情</h3>
						</div>
						<div class="modal-body">

							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#home" data-toggle="tab">基本信息</a>
								</li>
								<li>
									<a href="#linkman" data-toggle="tab">联系人</a>
								</li>
								<li>
									<a href="#certificate" data-toggle="tab">证件</a>
								</li>
								<li>
									<a href="#ceo" data-toggle="tab">法定代表人</a>
								</li>
								<li>
									<a href="#bank" data-toggle="tab">开户行</a>
								</li>
							</ul>

							<!-- 选项卡开始 -->
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane active in" id="home">
									<br>
									<table class="table table-bordered table-striped" width="800px">
										<tr>
											<td>公司名称</td>
											<td>{{entity.name}}</td>
										</tr>
										<tr>
											<td>公司手机</td>
											<td>{{entity.mobile}}</td>
										</tr>
										<tr>
											<td>公司电话</td>
											<td>{{entity.telephone}}</td>
										</tr>
										<tr>
											<td>公司详细地址</td>
											<td>{{entity.addressDetail}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="linkman">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>联系人姓名</td>
											<td>{{entity.linkmanName}}</td>
										</tr>
										<tr>
											<td>联系人QQ</td>
											<td>{{entity.linkmanQq}}</td>
										</tr>
										<tr>
											<td>联系人手机</td>
											<td>{{entity.linkmanMobile}}</td>
										</tr>
										<tr>
											<td>联系人E-Mail</td>
											<td>{{entity.linkmanEmail}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="certificate">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>营业执照号</td>
											<td>{{entity.licenseNumber}}</td>
										</tr>
										<tr>
											<td>税务登记证号</td>
											<td>{{entity.taxNumber}}</td>
										</tr>
										<tr>
											<td>组织机构代码证号</td>
											<td>{{entity.orgNumber}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="ceo">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>法定代表人</td>
											<td>{{entity.legalPerson}}</td>
										</tr>
										<tr>
											<td>法定代表人身份证号</td>
											<td>{{entity.legalPersonCardId}}</td>
										</tr>
									</table>
								</div>
								<div class="tab-pane fade" id="bank">
									<br>
									<table class="table table-bordered table-striped">
										<tr>
											<td>开户行名称</td>
											<td>{{entity.bankUser}}</td>
										</tr>
										<tr>
											<td>开户行支行</td>
											<td>{{entity.bankName}}</td>
										</tr>
										<tr>
											<td>银行账号</td>
											<td>{{entity.bankAccount}}</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- 选项卡结束 -->

						</div>
						<div class="modal-footer">
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'1')">审核通过</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'2')">审核未通过</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatus(entity.sellerId,'3')">关闭商家</button>
							<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
						</div>
					</div>
				</div>
			</div>

	</body>

	
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../plugins/angularjs/angular.min.js"></script>
	<!-- 分页组件 -->
	<script src="../../plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="../../js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/service/SellerService.js"></script>
	<script type="text/javascript" src="../../js/controller/SellerController.js"></script>

</html>