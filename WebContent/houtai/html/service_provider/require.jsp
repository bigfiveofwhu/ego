<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>需求管理</title>
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
			<h3 class="box-title">需求管理</h3>
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
				<form action="<%=path %>/service/queryComment.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select id="selectReq"  name="isreply">
							<option value="00" selected>全部</option>
							<option value="01">未参与竞标</option>
							<option value="02">已参与竞标</option>
						</select>
					</div>
				</div>
				<script type="text/javascript">
					$(function(){
						$("#selectReq").change(function(){
							var option=$("#selectReq option:selected").attr("value");
							if(option=='00'){
								
							}else if(option=='01'){
								
							}else if(option=='02'){
								
							}
						});
					});
				</script>
				</form>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting">序号</th>
							<th class="sorting">客户昵称</th>
							<th class="sorting">服务类型</th>
							<th class="sorting">服务方式</th>
							<th class="sorting">需求描述</th>
							<th class="sorting">详细地址</th>
							<th class="sorting">提交时间</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requires}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aaa103}</td>
							<td>${ins.aac603}</td>
							<td>${ins.aac604}</td>
							<td>${ins.aac605}</td>
							<td>${ins.addr}</td>
							<td>${ins.aac608}</td>
						<td class="text-center">
			         		<button id="require${vs.count}" type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aac602}','${vs.count}')" data-id="">错误</button>
						</td>
						</tr>
						<script>
							$(function(){
								$.ajax({
									url:"<%=path%>/require.ajax",
									type:"post",
									dataType:"json",
									timeout:20000,
									data:{
										"type":"1",
										"aac602":'${ins.aac602}'
									},
									success:function(res,status){
										var text="";
										if(res.status=='00'){
											text="参与竞标";
											$("#require${vs.count}").attr("data-id","0");
										}else if(res.status=='01'){
											text='查看竞标详情';
											$("#require${vs.count}").attr("data-id",res.aac302);
										}
										$("#require${vs.count}").text(text);
									},
									error:function(res,status){
										console.log("网络故障!");
									}
								});
							});
						</script>
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
    <form id="myform1" method="post">
    <div id="msg101" style="color:red">参与竞标</div>
    <div>
    <i class=""></i>
    <input type="number" id="aac303" name="aac303" placeholder="竞标价格" required="required" >
    </div>
    <textarea id="aac304" rows="15" cols="48" name="aac304" placeholder="填写竞标描述" required="required"></textarea>
    <input type="hidden" id="aac602" value="">
    <input class="btn bg-olive btn-xs" type="submit" onclick="joinRequire()" id="1314p"  value="参与竞标"></input>
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
	<script>
	/*参与竞标*/
	function joinRequire(){
		$.ajax({
			url:"<%=path%>/require.ajax",
			type:"post",
			dataType:"json",
			timeout:20000,
			data:{
				"type":"3",
				"aac303":$("#aac303").val().trim(),
				"aac304":$("#aac304").val().trim(),
				"aac602":$("#aac602").val().trim()
			},
			success:function(res,status){
				console.log("成功");
				if(res.status=='200'){
					alert("成功参与竞标!");
					location.reload();
				}else{
					alert("网络异常! error:No-9869");
					closeBox();
				}
			},
			error:function(res,status){
				console.log("失败");
			}
		});
		return false;
	}
    /*点击弹出按钮*/
    function popBox(id,index) {
    	var data_id=$("#require"+index).attr("data-id");
    	if(data_id=='0'){
            $("#popBox").css("display","block");
            $("#popLayer").css("display","block");
            $("#aac602").attr("value",id);
    	}else{
    		$.ajax({
    			url:"<%=path%>/require.ajax",
    			type:"post",
    			dataType:"json",
    			timeout:20000,
    			data:{
    				"type":"2",
    				"aac302":data_id
    			},
    			success:function(res,status){
    				if(res.status=='200'){
    					var re=res.re;
    					$("#aac303").val(re.aac303);
    					$("#aac303").attr("readonly",true);
    					$("#aac304").val(re.aac304);
    					$("#aac304").attr("readonly",true);
    					$("#aac602").val(re.aac302);   <%--先把竞标id放在需求id出--%>
    					$("#1314p").attr("disabled",true);
    					if(re.aac305=='01'){
    						$("#msg101").text("竞标中");
    					}else if(re.aac305=='02'){
    						$("#msg101").text("被客户接收");
    					}else if(re.aac305=='03'){
    						$("#msg101").text("被客户拒绝");
    					}
    					$("#popBox").css("display","block");
    			        $("#popLayer").css("display","block");
    				}else if(res.status=='201'){
    					alert("网络异常  eror:No- 9869");
    				}
    			},
    			error:function(res,status){
    				alert("网络异常");
    			}
    		});
    	}
       // document.getElementById("replyText").value = v;
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