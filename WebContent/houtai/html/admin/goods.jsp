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
		<title>商品管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="../../css/style.css">
		<link rel="stylesheet" href="../../plugins/angularjs/pagination.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="search_domain.auditStatus=1;findItemCatList();findTypeList();findBrandList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">商品审核</h3>
		</div>

		<div class="box-body">

			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="删除" ng-click="delete()"><i class="fa fa-trash-o"></i> 删除</button>
							<button type="button" class="btn btn-default" title="审核通过" ng-click="updateStatus('2')"><i class="fa fa-check"></i> 通过</button>
							<button type="button" class="btn btn-default" title="审核驳回" ng-click="updateStatus('3')"><i class="fa fa-ban" ></i> 驳回</button>
							<button type="button" class="btn btn-default" title="商品关闭" ng-click="updateStatus('4')"><i class="fa fa-ban" ></i> 关闭</button>
							<button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
						</div>
					</div>
				</div>
				<div class="box-tools pull-right">
					<div class="has-feedback">
						商品名称：<input ng-model="search_domain.goodsName">
						<button class="btn btn-default" ng-click="reloadList()">查询</button>
					</div>
				</div>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">商品ID</th>
							<th class="sorting">商品名称</th>
							<th class="sorting">商品价格</th>
							<th class="sorting">一级分类</th>
							<th class="sorting">二级分类</th>
							<th class="sorting">三级分类</th>
							<th class="sorting">状态</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="entity in list">
							<td><input type="checkbox" ng-click="updateSelection($event,entity.id)"></td>
							<td>{{entity.id}}</td>
							<td>{{entity.goodsName}}</td>
							<td>{{entity.price}}</td>
							<td>{{itemCatList[entity.category1Id]}}</td>
							<td>{{itemCatList[entity.category2Id]}}</td>
							<td>{{itemCatList[entity.category3Id]}}</td>
							<td>
								<span>
		                         {{status[entity.auditStatus]}} 
		                        </span>

							</td>
							<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#goodsModal" ng-click="findOneByID(entity.id)">详情</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--数据列表/-->
				<tm-pagination conf="paginationConf"></tm-pagination>
			</div>
			<!-- 数据表格 /-->

		</div>
		<!-- /.box-body -->

		<!-- 商品详情 -->
		<div class="modal fade" id="goodsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">商品详情</h3>
					</div>
					<div class="modal-body">

						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#Baes" data-toggle="tab">基本信息</a>
							</li>
							<li>
								<a href="#Category" data-toggle="tab">类目信息</a>
							</li>
							<li>
								<a href="#extend" data-toggle="tab">扩展信息</a>
							</li>
							<li>
								<a href="#sku" data-toggle="tab">SKU信息</a>
							</li>

						</ul>

						<!-- 选项卡开始 -->
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active in" id="Baes">
								<br>
								<table class="table table-bordered table-striped" width="800px">
									<tr>
										<td>商品ID</td>
										<td>{{details.goods.id}}</td>
									</tr>
									<tr>
										<td>商家</td>
										<td>{{details.goods.sellerId}}</td>
									</tr>
									<tr>
										<td>商品名称</td>
										<td>{{details.goods.goodsName}}</td>
									</tr>
									<tr>
										<td>价格</td>
										<td>{{details.goods.price}}</td>
									</tr>
									<tr>
										<td>品牌</td>
										<td>{{BrandList[details.goods.brandId]}}</td>
									</tr>
									<tr>
										<td>副标题</td>
										<td>{{details.goods.caption}}</td>
									</tr>
									<tr>
										<td>包装列表</td>
										<td>{{details.goodsDesc.packageList}}</td>
									</tr>
									<tr>
										<td>售后服务</td>
										<td>{{details.goodsDesc.saleService}}</td>
									</tr>
								</table>
							</div>

							<div class="tab-pane fade" id="Category">
								<br>
								<table class="table table-bordered table-striped" width="800px">
									<tr>
										<td>一级类目</td>
										<td>{{itemCatList[details.goods.category1Id]}}</td>
									</tr>
									<tr>
										<td>二级类目</td>
										<td>{{itemCatList[details.goods.category2Id]}}</td>
									</tr>
									<tr>
										<td>三级类目</td>
										<td>{{itemCatList[details.goods.category3Id]}}</td>
									</tr>

									<tr>
										<td>分类模板</td>
										<td>{{TypeList[details.goods.typeTemplateId]}}</td>
									</tr>
								</table>
							</div>

							<div class="tab-pane fade" id="extend">
								<br>
								<table class="table table-bordered table-striped" width="800px">
									<tr>
										<td>扩展信息</td>
										<td>
											<span ng-repeat="pojo in details.goodsDesc.customAttributeItems">
												{{pojo.text}}  :{{pojo.value}}  <br />
											</span>

										</td>
									</tr>
									<tr>
										<td id="#container">商品介绍</td>
										<td ng-bind-html="details.goodsDesc.introduction"></td>
									</tr>
									<tr>
										<td>规格信息</td>
										<td>
											<span ng-repeat="spec in details.goodsDesc.specificationItems">
												{{spec.attributeName}} :  {{spec.attributeValue}} <br />
											</span>
										</td>
									</tr>
									<tr>
										<td>图片详情</td>
										<td>
											<p ng-repeat="img in details.goodsDesc.itemImages">
												{{img.color}} : <img alt="" src="{{img.url}}" width="100px" height="100px"> <br />
											</p>
										</td>
									</tr>

								</table>
							</div>

							<div class="tab-pane fade" id="sku">
								<br>
								<table class="table table-bordered table-striped" width="800px">
									<tr>
										<th class="sorting">商品标题</th>
										<th class="sorting">商品库存</th>
										<th class="sorting">商品价格</th>
										<th class="sorting">创建时间</th>
										<th class="sorting">更新时间</th>
									</tr>
									<tr ng-repeat="list in details.itemList">
										<td>{{list.title}}</td>
										<td>{{list.num}}</td>
										<td>{{list.price}}</td>
										<td>{{list.createTime}}</td>
										<td>{{list.updateTime}}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="updateStatusOne(details.goods.id,'2')">通过申请</button>
						<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatusOne(details.goods.id,'3')">驳回申请</button>
						<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" ng-click="updateStatusOne(details.goods.id,'4')">关闭商品</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="../../plugins/angularjs/angular-sanitize.min.js"></script>
	<script src="../../plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="../../js/base/Base_ngSanitize.js"></script>
	<script type="text/javascript" src="../../js/base/BaseService.js"></script>
	<script type="text/javascript" src="../../js/base/BaseController.js"></script>
	<script type="text/javascript" src="../../js/service/UploadService.js"></script>
	<script type="text/javascript" src="../../js/service/TypeTemplateService.js"></script>
	<script type="text/javascript" src="../../js/service/SpecificationService.js"></script>
	<script type="text/javascript" src="../../js/service/ItemCatService.js"></script>
	<script type="text/javascript" src="../../js/service/GoodsService.js"></script>
	<script type="text/javascript" src="../../js/service/BrandService.js"></script>
	<script type="text/javascript" src="../../js/controller/GoodsController.js"></script>

</html>