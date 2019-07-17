<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��Ʒ����</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/../css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/../plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">���۹���</h3>
		</div>

		<div class="box-body">

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="ˢ��" onclick="window.location.reload();"><i class="fa fa-refresh"></i> ˢ��</button>
						</div>
					</div>
				</div>
				<form action="queryProduct.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select  name="isrepl y">
							<option value="">ȫ��</option>
							<option value="01">δ�ظ�</option>
							<option value="02">�ѻظ�</option>
						</select>
						�Ƿ��ͼ��
							<select  name="aab412">
							<option value="">ȫ��</option>
							<option value="01">��ͼ����</option>
							<option value="02">δ��ͼ����</option>
						</select>
						������Ʒ:
						<input type="text" name="aab202" value=""/>
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
							<th class="sorting">������Ʒid</th>
							<th class="sorting">������Ʒ����</th>
							<th class="sorting">�����û�</th>
							<th class="sorting">��������</th>
							<th class="sorting">��Ʒ�Ǽ�����</th>
							<th class="sorting">����ͼƬ</th>
							<th class="text-center">����</th>
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
							  <button>ͼƬ</button>
							</td>
						<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs"><a class="btn bg-olive btn-xs">�ظ�</a></button>
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

	<script src="<%=path%>/houtai/../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../plugins/angularjs/angular.min.js"></script>
	<!-- ��ҳ�����ʼ -->
	<script src="<%=path%>/houtai/../plugins/angularjs/pagination.js"></script>
	<!-- ��ҳ������� -->
	<script type="text/javascript" src="<%=path%>/houtai/../js/base/Base_pagination.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/GoodsService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/UploadService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/service/BrandService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/../js/controller/GoodsController.js"></script>

</html>