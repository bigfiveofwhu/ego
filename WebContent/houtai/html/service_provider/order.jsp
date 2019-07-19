<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��������</title>
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
			<h3 class="box-title">��������</h3>
		</div>

		<div class="box-body">

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<form action="<%=path %>/service/queryOrder.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select ng-model="search_domain.auditStatus" name="qaac408">
						
							<option value="01">��Ԥ��</option>
							<option value="02">�����</option>
						</select>
						�����ţ�<input name="qaac402" ng-model="search_domain.goodsName">
						<input type="submit"  value="��ѯ"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--������/-->

				<!--�����б�-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting">���</th>
							<th class="sorting">�������</th>
							<th class="sorting">Ԥ��ʱ��</th>
							<th class="sorting">Ԥ�����</th>
							<th class="sorting">�ɽ�ʱ��</th>
							<th class="sorting">�ɽ��ܶ�</th>
							<th class="text-center">����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aac402}</td>
							<td>${ins.aac404}</td>
							<td>${ins.aac406}</td>
							<td>${ins.aac405}</td>
							<td>${ins.aac407}</td>
						<td class="text-center">
						<c:if test="${ins.aac405 == null }">
								<a type="button" name="popBox" class="btn bg-olive btn-xs" href="<%=path%>/service/agreeOrder.html?aac402=${ins.aac402}" >
										�ɽ�
								</a>
					    </c:if>
					    <c:if test="${ins.aac405 != null }">
								<button type="button" class="btn bg-olive btn-xs" disabled="disabled">
										�ѳɽ�
								</button>
					    </c:if>
								
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
	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- ��ҳ�����ʼ -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="utf-8"></script>
	-->
	<!-- ��ҳ������� -->
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