<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>评价管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<script type="text/javascript" src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<style>
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
            width: 400px;
            height: 400px;
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
			<h3 class="box-title">评价管理</h3>
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
				<form action="<%=path %>/shop/queryComment.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select  name="isreply">
							<option value="">全部</option>
							<option value="01">未回复</option>
							<option value="02">已回复</option>
						</select>
						是否带图：
							<select  name="qaab412">
							<option value="">全部</option>
							<option value="01">带图评论</option>
							<option value="02">未带图评论</option>
						</select>
						评论商品:
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
							<th class="sorting">评论商品id</th>
							<th class="sorting">评论商品名称</th>
							<th class="sorting">评论用户</th>
							<th class="sorting">评论内容</th>
							<th class="sorting">商品星级评价</th>
							<th class="sorting">评论图片</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${commentList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aaa103}</td>
							<td>${ins.aab403}</td>
							<td>${ins.aab410}</td>
							<td>
							  <c:if test="${ins.aab412 == 01 }">
							  <button class="btn bg-olive btn-xs" onclick="showImg('${ins.aab402 }')">图片</button>
							  </c:if>
							  <c:if test="${ins.aab412 == 02 }">
							    无
							  </c:if>
							</td>
						<td class="text-center">
						    <c:if test="${ins.aab405 == null }">
			         		<button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aab405}','${ins.aab402 }')">回复</button>
					        </c:if>
					        <c:if test="${ins.aab405 != null }">
					        <button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aab405}','${ins.aab402 }')">查看回复</button>
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
    <form id="myformhhh"  method="post">
    <textarea id="replyText"  rows="15" cols="48" name="aab405"  class="form-control" required ></textarea>
    <input type="submit" onclick="onSubmit()" value="回复" class="btn bg-olive"></input>
    </form>
    </div>
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
	<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
	<script> 
	layui.use('layer', function(){
		layer = layui.layer;
	});
	function showImg(id) 
	{
		var imgpath = "${path}/images/comments/"+id
		layer.open({
			  title: '评论图片'
			  ,content: '<img src='+imgpath+'>'
			});  
	}
	
    /*点击弹出按钮*/
    function popBox(v,id) {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        $("#replyText").val(v);
        $("#myformhhh").attr("action","<%=path%>/shop/replyComment.html?aab402="+id)
       // document.getElementById("replyText").value = v;
        popBox.style.display = "block";
        popLayer.style.display = "block";
    };
    
    function onSubmit()
    {
    	$("#myformhhh").submit();
    }
    /*点击关闭按钮*/
    function closeBox() {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        popBox.style.display = "none";
        popLayer.style.display = "none";
    }
</script>

</html>