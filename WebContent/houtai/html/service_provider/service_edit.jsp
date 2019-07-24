<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>����༭</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<!-- ���ı��༭�� -->
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
		<style>
			.main {
				width: 80%;
				margin: auto;
			}
			
			* {
				padding: 0;
				margin: 0;
			}
			
			.upimg {
				position: relative;
				width: 100px;
				height: 100px;
				border-radius: 5px;
				border: dashed #999999;
				background: url(${path}/images/addimg.svg) no-repeat;
				background-position: 33px;
			}
			
			.upimg input {
				position: absolute;
				width: 100px;
				height: 100px;
				opacity: 0;
			}
			
			#showui {
				display: flex;
				justify-content: flex-start;
			}
			
			#showui li {
				width: 150px;
				height: 150px;
				position: relative;
				overflow: hidden;
				display: inline-block;
				margin-right: 5px;
			}
			
			#showui li img.showimg {
				position: absolute;
				text-align: center;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				z-index: 6;
			}
			
			.showdiv {
				position: absolute;
				z-index: 9;
				bottom: 0;
				width: calc(100% - 20px);
				padding: 10px;
				display: flex;
				justify-content: space-around;
				background: rgba(0, 0, 0, .6);
			}
			
			.showdiv img {
				width: 20px;
				height: 20px;
				cursor: pointer;
			}
			
			#showui li:first-child img.left {
				opacity: .6;
				cursor: no-drop;
			}
			
			#showui li:last-child img.right {
				opacity: .6;
				cursor: no-drop;
			}
			
			.oneright {
				opacity: .6;
				cursor: no-drop !important;
			}
		</style>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="selectItemCat1List();findOne()">

		<!-- �������� -->
		<section class="content">

			<div class="box-body">

				<!--tabҳ-->
				<div class="nav-tabs-custom">

					<!--tabͷ-->
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#home" data-toggle="tab">���������Ϣ</a>
						</li>
					</ul>
					<!--tabͷ/-->

					<!--tab����-->
					<div class="tab-content">
                           
                           
                       
						<!--������-->
						<div class="tab-pane active" id="home">
						  <form id="myform" action="<%=path %>/service/addService.html" method="post">
							<div class="row data-type">
								<div class="col-md-2 title">��������</div>

								<div class="col-md-10 data">
							    <select  name="aac204">
													<option value="01">��������1</option>
													<option value="02">��������2</option>
						         </select>
								</div>

								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" id="aac203" required="required" placeholder="��������"  name="aac203" value=""/>
								</div>


								<div class="col-md-2 title">����ʽ</div>
								<div class="col-md-10 data">
									<select  name="aac205">
													<option value="01">���ŷ���</option>
													<option value="02">���Ϸ���</option>
													<option value="03">�ŵ����</option>
						         </select>
								</div>
								
								<div class="col-md-2 title">��������</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" id="aac206" placeholder="��������" name="aac206" required="required" />
									</div>
								</div>
								
								<div class="col-md-2 title">��ϵ�绰</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" id="aac209" placeholder="��ϵ�绰" name="aac209" required="required" />
									</div>
								</div>
                               
								<div class="col-md-2 title editer">��������</div>
								<div class="col-md-10 data editer">
									<textarea name="aac207" id="aac207" style="width:800px;height:400px;"></textarea>
								</div>


							</div>
						  </form>
						</div>
						
                  </div>
                  <div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary"  id="submitservice" onclick="saveData()"><i class="fa fa-save" ></i>����</button>
				<span>${msg}</span>
				<button class="btn btn-default" onclick="window.location.href='<%=path %>/service/queryService.html';">�����б�</button>
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
		 alert("������Ϣ����Ϊ��!");
		 return;
	 }
	 var vform = document.getElementById("myform");
	 vform.submit();
 }

	</script>

</html>