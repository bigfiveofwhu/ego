<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>订单管理</title>
		<link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/webbase.css" />
    	<link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/pages-seckillOrder.css" />
    	<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
	</head>

	<body style="background-color:#8AA4AF;" ng-app="shopping" ng-controller="OrderController" ng-init="selectstatus(3)">
		<div id="account" >
			<div class="py-container">
				<div class="yui3-g home">
					<!--左侧列表-->
					<div class="yui3-u-1-6 list">
						<div class="list-items">
							<dl>
								<dt><i>·</i> 订单中心</dt>
							
								<dd>
									<a ng-click="selectstatus(3)" class=" {{isSelectedstatus(3)?'list-active':''}} ">
										<i class="fa fa-folder"></i>
										<span>待发货</span>
										<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
									</a>
								</dd>
								<dd>
									<a  ng-click="selectstatus(4)" class=" {{isSelectedstatus(4)?'list-active':''}} ">
										<i class="fa fa-folder"></i>
										<span>已发货</span>
										<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
									</a>
								</dd>
							
								<dd>
									<a  ng-click="selectstatus(5)" class=" {{isSelectedstatus(5)?'list-active':''}} ">
										<i class="fa fa-folder"></i>
										<span>交易成功</span>
										<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
									</a>
								</dd>
								<dd>
									<a  ng-click="selectstatus(7)" class=" {{isSelectedstatus(7)?'list-active':''}} ">
										<i class="fa fa-folder"></i>
										<span>退款/退货</span>
										<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
									</a>
								</dd>
								<dd>
									<a  ng-click="selectstatus(8)" class=" {{isSelectedstatus(8)?'list-active':''}} ">
										<i class="fa fa-folder"></i>
										<span>退款/退货记录</span>
										<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
									</a>
								</dd>
								
							</dl>
						</div>
					</div>
					<!--右侧主内容-->
					<div class="yui3-u-5-6 order-pay">
						<div class="body">
							<div class="table-title">
								<table class="sui-table  order-table">
									<tr>
										<thead>
											<th width="35%">宝贝</th>
											<th width="5%">单价</th>
											<th width="5%">数量</th>
											<th width="10%">实付款</th>
											<th width="10%">交易状态</th>
											<th width="10%">交易操作</th>
										</thead>
									</tr>
								</table>
							</div>
							<div class="order-detail">
								<div class="orders">
									<!--order1-->
									<div class="choose-title" ng-repeat="item in list">
										<label data-toggle="checkbox">
                                           <span>订单编号:{{item.orderId}}  送货地址:{{item.order.receiverAreaName}}  {{item.order.createTime}}　</span>
                                    	</label>
										<table class="sui-table table-bordered order-datatable">

											<tr ng-repeat="itemlist in item.orderItemlist">

												<td width="35%">
													<div class="typographic">
														<img src="{{itemlist.picPath}}" width="100px" height="100px" />
														<a href="#" class="block-text">{{itemlist.title}}</a>
													</div>
												</td>
												<td width="5%" class="center">
													<ul class="unstyled">
														<li>${{itemlist.price}}</li>
													</ul>
												</td>
												<td width="5%" class="center">{{itemlist.num}}</td>
												<td width="10%" class="center" ng-if="$first" rowspan="{{item.orderItemlist.length}}">
													<ul class="unstyled">
														<li>${{item.totalFee}}</li>
													</ul>
												</td>

												<td width="10%" class="center" ng-if="$first" rowspan="{{item.orderItemlist.length}}">
													<ul class="unstyled">
														<li ng-if="item.order.status==3">未发货</li>
														<li ng-if="item.order.status==4">等待用户确认收货</li>
														<li ng-if="item.order.status==5">交易成功</li>
														<li ng-if="item.order.status==7">退款/退货中</li>
														<li ng-if="item.order.status==8">已退款/退货</li>
													</ul>
												</td>
												<td width="10%" class="center" ng-if="$first" rowspan="{{item.orderItemlist.length}}">
													<ul class="unstyled">
														<li>
															<a class="sui-btn btn-info" ng-if="item.order.status>=2&&item.order.status<=3" ng-click="settingId(item.orderId)"  data-toggle="modal" data-target="#editModal" class="btn btn-default btn-flat">发货</a>
															<p ng-if="item.order.status==7">
																<a class="sui-btn btn-info"  ng-click="UpdateOrderStatus(item.orderId,8)">同意退款/退货</a>
															</p>
															
															
														</li>
													</ul>
												</td>

											</tr>

										</table>

									</div>
								</div>

								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 编辑窗口 -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">填写物流订单</h3>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>物流公司名称</td>
								<td><input type="type" class="form-control" placeholder="物流公司名称" ng-model="pojo.name"> </td>
							</tr>
							<tr>
								<td>快递单号</td>
								<td><input type="type" class="form-control" placeholder="快递单号" ng-model="pojo.code"> </td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="setsend()">保存</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>

	</body>

	<script type="text/javascript" src="<%=path%>/houtai/plugins/jQuery/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/common/input.js"></script>
	<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService_Seller.js" ></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/OrderController_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/OrderService_Seller.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>

</html>