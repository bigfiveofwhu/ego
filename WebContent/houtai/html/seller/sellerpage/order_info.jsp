<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>订单管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<style type="text/css">
		 /*背景层*/
        #popLayer {
            display: none;
            background-color: #B3B3B3;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 10;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);/* 只支持IE6、7、8、9 */
        }
 
        /*弹出层*/
        #popBox {
            display: none;
            background-color: #FFFFFF;
            z-index: 11;
            width: 300px;
            height: 200px;
            position:fixed;
            top:0;
            right:0;
            left:0;
            bottom:0;
            margin:auto;
        }
 
        #popBox .close{
            text-align: right;
            margin-right: 5px;
            background-color: #F8F8F8;
        }
 
        /*关闭按钮*/
        #popBox .close a {
            text-decoration: none;
            color: #2D2C3B;
        }
 
		</style>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">订单管理</h3>
		</div>

		<div class="box-body">

			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<form action="<%=path %>/shop/queryOrder.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select ng-model="search_domain.auditStatus" name="qaab303">
							<option value="">全部</option>
							<option value="02">待发货</option>
							<option value="04">已发货</option>
							<option value="05">已完成</option>
						</select>
						订单号：<input name="qaab302" ng-model="search_domain.goodsName">
						<input type="submit"  value="查询"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting">序号</th>
							<th class="sorting">订单编号</th>
							<th class="sorting">下单时间</th>
							<th class="sorting">消费金额</th>
							<th class="sorting">买家状态</th>
							<th class="sorting">买家留言</th>
							<th class="sorting">发货时间</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aab302}</td>
							<td>${ins.aab304}</td>
							<td>${ins.totalmoney}</td>
							<td>${ins.cnaab303}</td>
							<td>${ins.aab312}</td>
							<td>${ins.aab306}</td>
						<td class="text-center">
						<c:if test="${ins.cnaab303 == '待发货' }">
								<button type="button" class="btn bg-olive btn-xs" disabled="disabled">删&nbsp除</button>
								<button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aab302}')">
										发货
								</button>
					    </c:if>
					    <c:if test="${ins.aab306 != null }">
					    	<button type="button" class="btn bg-olive btn-xs" >删除</button>
								<button type="button" class="btn bg-olive btn-xs" disabled="disabled">
										已发货
								</button>
					    </c:if>
								
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
      <div id="popLayer"></div>
     <div id="popBox">
       <div class="close">
        <a href="javascript:void(0)" onclick="closeBox()">×</a>
     </div>
    <div class="content">
    <form action="<%=path %>/shop/deliver.html" method="post">
              物流单号:<input type="text" class="form-control" name="aab309"/>
    	<select class="has-feedback">
							<option value="">选择快递方</option>
							<option value="02">圆通</option>
							<option value="04">申通</option>
							<option value="05">韵达</option>
			</select>
			<br>
			<input type="hidden" id="ddbh" name="aab302"/>
    <input type="submit" class="btn" value="确定"></input>
    </form>
    </div>
    </div>
	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- 分页组件开始 -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="utf-8"></script>
	-->
	<!-- 分页组件结束 -->
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
    <script>
    /*点击弹出按钮*/
    function popBox(v) {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        $("#ddbh").val(v);
       // document.getElementById("replyText").value = v;
        popBox.style.display = "block";
        popLayer.style.display = "block";
    };
    
    /*点击关闭按钮*/
    function closeBox() {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        popBox.style.display = "none";
        popLayer.style.display = "none";
    }
    </script>
</html>