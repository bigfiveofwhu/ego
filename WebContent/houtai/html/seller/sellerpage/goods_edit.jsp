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
		<title>商品编辑</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../../css/style.css">
		<!-- 富文本编辑器 -->
		<link rel="stylesheet" href="../../../plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="../../../plugins/kindeditor/themes/default/default.css" />
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
							<a href="#home" data-toggle="tab">商品基本信息</a>
						</li>
						<li>
							<a href="#pic_upload" data-toggle="tab">商品图片</a>
						</li>
						<li>
							<a href="#customAttribute" data-toggle="tab">扩展属性</a>
						</li>
						<li>
							<a href="#spec" data-toggle="tab">规格</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">

						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<div class="col-md-2 title">商品分类</div>

								<div class="col-md-10 data">
									<table>
										<tr>
											<td>
												<select class="form-control" ng-model="entity.goods.category1Id" ng-options="item.id as item.name for item in itemCat1List"></select>
											</td>
											<td>
												<select class="form-control select-sm" ng-model="entity.goods.category2Id" ng-options="item.id as item.name for item in itemCat2List"></select>
											</td>
											<td>
												<select class="form-control select-sm" ng-model="entity.goods.category3Id" ng-options="item.id as item.name for item in itemCat3List"></select>
											</td>
											<td>
												模板名:{{typeName}}
											</td>
										</tr>
									</table>

								</div>

								<div class="col-md-2 title">商品名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" ng-model="entity.goods.goodsName" placeholder="商品名称" value="">
								</div>

								<div class="col-md-2 title">品牌</div>
								<div class="col-md-10 data">
									<select class="form-control" ng-model="entity.goods.brandId" ng-options="item.id as item.text for item in typeTemplate.brandIds"></select>
								</div>

								<div class="col-md-2 title">副标题</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" placeholder="副标题" value="" ng-model="entity.goods.caption">
								</div>

								<div class="col-md-2 title">价格</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<span class="input-group-addon">¥</span>
										<input type="text" class="form-control" placeholder="价格" value="" ng-model="entity.goods.price">
									</div>
								</div>

								<div class="col-md-2 title editer">商品介绍</div>
								<div class="col-md-10 data editer">
									<textarea name="content" style="width:800px;height:400px;visibility:hidden;"></textarea>
								</div>

								<div class="col-md-2 title rowHeight2x">包装列表</div>
								<div class="col-md-10 data rowHeight2x">

									<textarea rows="4" class="form-control" placeholder="包装列表" ng-model="entity.goodsDesc.packageList"></textarea>
								</div>

								<div class="col-md-2 title rowHeight2x">售后服务</div>
								<div class="col-md-10 data rowHeight2x">
									<textarea rows="4" class="form-control" placeholder="售后服务" ng-model="entity.goodsDesc.saleService"></textarea>
								</div>

							</div>
						</div>

						<!--图片上传-->
						<div class="tab-pane" id="pic_upload">
							<div class="row data-type">
								<!-- 颜色图片 -->
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="新建" data-target="#uploadModal" data-toggle="modal" ng-click="image_entity={}"><i class="fa fa-file-o"></i> 新建</button>

								</div>

								<table class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>

											<th class="sorting">颜色</th>
											<th class="sorting">图片</th>
											<th class="sorting">操作</th>
									</thead>
									<tbody>
										<tr ng-repeat="pojo in entity.goodsDesc.itemImages">
											<td>{{pojo.color}}</td>
											<td><img alt="" src="{{pojo.url}}" width="100px" height="100px"></td>
											<td><button type="button" class="btn btn-default" title="删除" ng-click="remove_image_entity($index)"><i class="fa fa-trash-o"></i> 删除</button></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>

						<!--扩展属性-->
						<div class="tab-pane" id="customAttribute">
							<div class="row data-type">
								<div ng-repeat="pojo in entity.goodsDesc.customAttributeItems">
									<div class="col-md-2 title">{{pojo.text}}</div>
									<div class="col-md-10 data">
										<input class="form-control" ng-model="pojo.value" placeholder="{{pojo.text}}">
									</div>
								</div>

							</div>
						</div>

						<!--规格-->
						<div class="tab-pane" id="spec">
							<div class="row data-type">
								<div class="col-md-2 title">是否启用规格</div>
								<div class="col-md-10 data">
									<input type="checkbox" ng-model="entity.goods.isEnableSpec" ng-true-value="1" ng-false-value="0">
								</div>
							</div>
							<p>

								<div ng-if="entity.goods.isEnableSpec==1">

									<div class="row data-type">

										<div ng-repeat="pojo in specList">
											<div class="col-md-2 title">{{pojo.text}}</div>
											<div class="col-md-10 data">
												<span ng-repeat="option in pojo.options">
										      	<input  type="checkbox" ng-click="updateSpecAttribute($event,pojo.text,option.optionName);createItemList()" ng-checked="checkAttributeValue(pojo.text,option.optionName)">{{option.optionName}}	     
										      </span>
											</div>
										</div>
									</div>
									<div class="row data-type">
										<table class="table table-bordered table-striped table-hover dataTable">
											<thead>
												<tr>
													<th class="sorting" ng-repeat="item in entity.goodsDesc.specificationItems">{{item.attributeName}}</th>
													<th class="sorting">价格</th>
													<th class="sorting">库存</th>
													<th class="sorting">是否启用</th>
													<th class="sorting">是否默认</th>

												</tr>
											</thead>
											<tbody>

												<tr ng-repeat="pojo in entity.itemList">
													<td ng-repeat="item in entity.goodsDesc.specificationItems">
														{{pojo.spec[item.attributeName]}}
													</td>
													<td>
														<input class="form-control" ng-model="pojo.price" placeholder="价格">
													</td>
													<td>
														<input class="form-control" ng-model="pojo.num" placeholder="库存数量">
													</td>
													<td>
														<input type="checkbox" ng-model="pojo.status" ng-true-value="1" ng-false-value="0">
													</td>
													<td>
														<input type="checkbox" ng-model="pojo.isDefault" ng-true-value="1" ng-false-value="0">
													</td>
												</tr>
											</tbody>
										</table>

									</div>

								</div>
						</div>

					</div>
					<!--tab内容/-->
					<!--表单内容/-->

				</div>

			</div>
			<div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary" ng-click="save()"><i class="fa fa-save" ></i>保存</button>
				<button class="btn btn-default" onclick="window.location.href='goods.html';">返回列表</button>
			</div>

		</section>

		<!-- 上传窗口 -->
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">上传商品图片</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped">
							<tr>
								<td>颜色</td>
								<td><input class="form-control" placeholder="颜色" ng-model="image_entity.color"> </td>
							</tr>
							<tr>
								<td>商品图片</td>
								<td>
									<table>
										<tr>
											<td>
												<input type="file" id="file" />
												<button class="btn btn-primary" type="button" ng-click="uploadFile()">
				                   		上传
					                </button>
											</td>
											<td>
												<img src="{{image_entity.url}}" width="200px" height="200px">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="add_image_entity()">保存</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>

	</body>


	<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script charset="utf-8" src="../../../plugins/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../../../plugins/kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="../../../plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="../../../js/base/Base.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../../js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="../../../js/service/GoodsService.js"></script>
	<script type="text/javascript" src="../../../js/service/UploadService.js"></script>
	<script type="text/javascript" src="../../../js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="../../../js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="../../../js/service/BrandService.js"></script>
	<script type="text/javascript" src="../../../js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="../../../js/controller/GoodsController.js"></script>
	<script type="text/javascript" src="../../../js/common/common.js"></script>
	
	

</html>