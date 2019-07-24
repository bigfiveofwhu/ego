<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>服务编辑</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<!-- 富文本编辑器 -->
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="selectItemCat1List();findOne()">

		<!-- 正文区域 -->
		<section class="content">

			<div class="box-body">

				<!--tab页-->
				<div class="nav-tabs-custom">

					<!--tab头-->
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#home" data-toggle="tab">服务基本信息</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">
                           
                           
                       
						<!--表单内容-->
						<div class="tab-pane active" id="home">
						  <form id="myform" action="<%=path %>/service/addService.html" method="post">
							<div class="row data-type">
								<div class="col-md-2 title">服务类型</div>

								<div class="col-md-10 data">
							    <select  name="aac204">
													<option value="01">服务类型1</option>
													<option value="02">服务类型2</option>
						         </select>
								</div>

								<div class="col-md-2 title">服务名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" id="aac203" required="required" placeholder="服务名称"  name="aac203" value=""/>
								</div>


								<div class="col-md-2 title">服务方式</div>
								<div class="col-md-10 data">
									<select  name="aac205">
													<option value="01">上门服务</option>
													<option value="02">线上服务</option>
													<option value="03">门店服务</option>
						         </select>
								</div>
								
								<div class="col-md-2 title">服务区间</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" id="aac206" placeholder="服务区间" name="aac206" required="required" />
									</div>
								</div>
								
								<div class="col-md-2 title">联系电话</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" id="aac209" placeholder="联系电话" name="aac209" required="required" />
									</div>
								</div>
                               
								<div class="col-md-2 title editer">服务描述</div>
								<div class="col-md-10 data editer">
									<textarea name="aac207" id="aac207" style="width:800px;height:400px;"></textarea>
								</div>


							</div>
						  </form>
						</div>
                  </div>
                  <div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary"   onclick="saveData()"><i class="fa fa-save" ></i>保存</button>
				<span>${msg}</span>
				<button class="btn btn-default" onclick="window.location.href='<%=path %>/service/queryService.html';">返回列表</button>
			</div>
                   
	</body>


	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script charset="utf-8" src="<%=path%>/houtai/plugins/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path%>/houtai/plugins/kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/GoodsService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/UploadService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/BrandService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/GoodsController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/common/common.js"></script>
 <script type="text/javascript">
 
 function saveData()
 {
	 if($("#aac203").val().length == 0 || $("#aac206").val().length == 0 || $("#aac209").val().length == 0 || $("#aac207").val().length == 0)
	 {
		 alert("基本信息不能为空!");
		 return;
	 }
	 var vform = document.getElementById("myform");
	 vform.submit();
 }

	</script>

</html>