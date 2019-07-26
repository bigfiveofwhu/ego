<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>售后管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<script type="text/javascript" src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">售后管理</h3>
		</div>

		<div class="box-body">

			<!-- 数据表格 -->
			<div class="table-box">

				<!--工具栏-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
						</div>
					</div>
				</div>
				<form action="<%=path %>/shop/queryShouhou.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select  name="qaaa803">
							<option value="">全部</option>
							<option value="01">未处理</option>
							<option value="03">已同意</option>
							<option value="04">已拒绝</option>
						</select>
						 商品:
						<input type="text" name="qaab202" value=""/>
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
							<th class="sorting">售后id</th>
							<th class="sorting">商品id</th>
							<th class="sorting">商品名称</th>
							<th class="sorting">提交用户</th>
							<th class="sorting">售后描述</th>
							<th class="sorting">售后类型</th>
							<th class="sorting">状态</th> 
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${afterbuyList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aaa802}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aaa103}</td>
							<td>${ins.aaa805}</td>
							<td>${ins.cnaaa804}</td>
							<td>${ins.cnaaa803}</td>
						<td class="text-center">
						   <c:if test="${ins.cnaaa803 == '未处理' }">
					    	<button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aaa802}','${ins.aab302}')">处理</button>
					        </c:if>
					        
					        <c:if test="${ins.cnaaa803 == '已同意' }">
			         		<button type="button" name="popBox" class="btn bg-olive btn-xs" disabled>已处理</button>
			         		</c:if>
			         		
			         		  <c:if test="${ins.cnaaa803 == '已拒绝' }">
			         		<button type="button" name="popBox" class="btn bg-olive btn-xs" disabled>已处理</button>
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
     
    </div>

	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- 分页组件开始 -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="gbk"></script>
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
	<script src="/ego/layui/layui.js"></script>
	<script>
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	function popBox(id1,id2)
	 {
		layer.confirm('确认同意售后请求吗?', { btn: ['是','否'],title: "处理售后", btn1:function(){
	        $.ajax({
	                  url:"${path}/dealAfterBuy.ajax",
	                  type:"post",
	              	  timeout:20000,
	                  dataType:"json",
	                  data:{
	                	  "aaa802":id1,
	                	  "aab302":id2,
	                	  "type":"agree"
	                	  },
	                  success:function (res,status) {
	                	  if(res.tag == 1)
	                	{
	                      layer.msg("你已同意售后请求");
	                      setTimeout("location.reload()",1000);
	                      //location.reload();
	                	}
	                  },
	                  error:function(res,status){
	                	  console.log("失败");
	                  }
	                  
	                });
	        },
	        btn2:function(){
	        	 $.ajax({
	                  url:"${path}/dealAfterBuy.ajax",
	                  type: "post",
	              	  timeout:20000,
	                  dataType:"json",
	                  data:{
	                	  "aaa802":id1,
	                	  "aab302":id2,
	                	  "type":"disagree"
	                	  },
	                  success:function (res,status) {
	                	  {
		                      layer.msg("你已拒绝售后请求");
		                      setTimeout("location.reload()",1000);
		                     // location.reload();
		                }
	                  },
                      error:function(res,status){
	                	  console.log("失败");
	                  }
	                  
	                });
	        }
	    })
	}
</script>

</html>