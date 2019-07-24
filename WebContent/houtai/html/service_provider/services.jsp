<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品管理</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
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

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">服务管理</h3>
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
				<form action="<%=path %>/service/queryService.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select ng-model="search_domain.auditStatus" name="qaac208">
							<option value="">全部</option>
							<option value="01">未审核</option>
							<option value="02">审核通过</option>
							<option value="03">审核未通过</option>
							<option value="04">已下架</option>
						</select>
						服务名称：<input name="qaac203" ng-model="search_domain.goodsName">
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
							<th class="sorting">服务ID</th>
							<th class="sorting">服务名称</th>
							<th class="sorting">服务类型</th>
							<th class="sorting">服务方式</th>
							<th class="sorting">服务区间</th>
							<th class="sorting">状态</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${serviceList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aac202}</td>
							<td>${ins.aac203}</td>
							<td>${ins.cnaac204}</td>
							<td>${ins.cnaac205}</td>
							<td>${ins.aac206}</td>
							<td>
							  ${ins.cnaac208}
							</td>
						<td class="text-center">
						  <c:if test="${ins.cnaac208 == '未审核' }">
						      <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aac202}','serimg')" >
										图片
								</button>
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getServiceDetail('${ins.aac202}','ser')"> 详情</button>
								</c:if>
						
								   <c:if test="${ins.cnaac208 == '审核通过' }">
						      <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aac202}','serimg')" >
										图片
								</button>
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getServiceDetail('${ins.aac202}','ser')"> 详情</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aac202}','serputoff');" >
										下架
								</button>
								</c:if>
								
								  <c:if test="${ins.cnaac208 == '审核未通过' }">
						       <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aac202}','serimg')" >
										图片
								</button>
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getServiceDetail('${ins.aac202}','ser')"> 详情</button>
								<button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aac202}','serdel');">删除</button>
								</c:if>
								
								 <c:if test="${ins.cnaac208 == '已下架' }">
								<button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aac202}','serdel');">删除</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aac202}','serputon');" >
										重新上架
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
		
		<!-- 服务详情 -->
          <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            >×
                    </button>
                    <h3 id="myModalLabel">服务详情</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#goods" data-toggle="tab">服务详细信息</a>
                        </li>
                        <li>
                            <a href="#shopimg" data-toggle="tab">上传图片</a>
                        </li>
                    </ul>

                    <!-- 选项卡开始 -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="goods">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>id</td>
                                    <td id="aac202" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务名称</td>
                                    <td id="aac203" class="to_clear"></td>
                                </tr>
                                  <tr>
                                    <td>联系电话</td>
                                    <td id="aac209" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务区间</td>
                                    <td id="aac206" class="to_clear">
                                    </td>
                                </tr>
                                <tr>
                                    <td>服务类型</td>
                                    <td id="cnaac204" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务方式</td>
                                    <td id="cnaac205" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务描述</td>
                                    <td id="aac207" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>状态</td>
                                    <td id="cnaac208" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="shopimg">
                             <div id="showimg">
				                <ul id="showui">
								</ul>
				
								<div id="showinput">
				
								</div>
							</div>
							<div class="upimg">
								<input tag ="1" type="file" id="upgteimg" value="" multiple />
							</div>
				
							<button class="btn" id="submit1">上传服务图片</button>
                        </div>
                    </div>
                    <!-- 选项卡结束 -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updatePro()">
                              保存
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" >关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    
     
    <!-- 图片 -->
       <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">×
                    </button>
                    <h3 id="myModalLabel">服务图片</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#proimghhh" data-toggle="tab">服务图片</a>
                        </li>
                    </ul>

                    <!-- 选项卡开始 -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="proimghhh">
                            <br>
                          <!-- 服务图片 -->
                        
                        </div>
                    </div>
                    <!-- 选项卡结束 -->

                </div>
                <div class="modal-footer">
                    
                </div>
            </div>
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
     <script type="text/javascript">
     var pid;
     function getServiceDetail(id,type) {
     	pid = id
         $.ajax({
             url: "<%=path%>/putOffGoods.ajax",
             type: "post",
             timeout: 20000,
             dataType: "json",
             data: {
                 "aac202": id,
                 "type": type
             },
             success: function (res) {
             	if(res.tag == 1)
 	            {
 	                var map = res.map;
 	                if (typeof (map) !== "undefined") {
 	                    $("#aac202").html(map.aac202);
 	                    $("#aac203").html(map.aac203);
 	                    $("#cnaac204").html(map.cnaac204);
 	                    $("#cnaac205").html(map.cnaac205);
 	                    $("#aac206").html(map.aac206);
 	                    $("#aac207").html(map.aac207);
 	                    $("#cnaac208").html(map.cnaac208);
 	                    $("#aac209").html(map.aac209);

 	                    console.log("获取服务详细信息成功")
 	                }
 	            }
             },
             error: function () {
                 console.log("商品详细信息异步加载错误");
             }
         });
     }
    
     function clearDetails() {
         $(".to_clear").html("");
     }
     
     function putoff_del(id,type)
     {
     	$.ajax({
     		url:"${path}/putOffGoods.ajax",
     		type:"post",
     		timeout:20000,
     		dataType:"json",
     		data:{
     			"aac202":id,
     			"type":type
     		},
     		success:function(res,status){
 	    			if(res.tag == 1)
 	    		{
 	    			console.log("操作成功");
 	    			location.reload();
 	    		}
 	    			else
 	    				console.log("操作失败");
     		},
     		error:function(res,status){
     			console.log("操作错误");
     		}
     	});
     }
     
     function getProImg(id,type)
     {
     	$.ajax({
     		url:"${path}/putOffGoods.ajax",
     		type:"post",
     		timeout:20000,
     		dataType:"json",
     		data:{
     			"aac202":id,
     			"type":type
     		},
     		success:function(res,status){
     			$("#proimghhh").html("");
     			var prodiv = document.getElementById("proimghhh");
     			for(var i =0;i<res.proimgUrl.length;i++)
 	    		{
 	    			var div = document.createElement('div');
 	    			var imgurl = '${path}' + res.proimgUrl[i];
 	    			var result = '<img style="width:150px;heigth:150px;float:left;margin-left:30px"  src="' + imgurl + '" />';
 	    			div.innerHTML=result;
 	    			prodiv.appendChild(div);
 	    		}
     			
     		},
     		error:function(res,status){
     			console.log("图片显示错误");
     		}
     	});
     }
     
     window.onload = function() {
 		var input = document.getElementById("upgteimg");
 		var showui = document.getElementById("showui");
 		var result;
 		var dataArr = []; // 储存所选图片的结果(文件名和base64数据)
 		var fd; //FormData方式发送请求
 		var showinput = document.getElementById("showinput");
 		var oSubmit1 = document.getElementById("submit1");
 		//var oSubmit2 = document.getElementById("submit2");
 		var dateli, dateinput;
 		function randomString(len) {
 			len = len || 32;　　
 			var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/ 　　
 			var maxPos = $chars.length;　　
 			var pwd = '';　　
 			for(i = 0; i < len; i++) {　　　　
 				pwd += $chars.charAt(Math.floor(Math.random() * maxPos));　　
 			}
 			return pwd;
 		}
 		console.log()
 		if(typeof FileReader === 'undefined') {
 			alert("抱歉，你的浏览器不支持 FileReader");
 			input.setAttribute('disabled', 'disabled');
 		} else {
 			input.addEventListener('change', readFile, false);
 		}

 		function readFile() {
 			fd = new FormData();
 			var iLen = this.files.length;
 			alert(iLen);
 			var index = 0;
 			var currentReViewImgIndex = 0;
 			for(var i = 0; i < iLen; i++) {
 				if(!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)) { //判断上传文件格式
 					return alert("上传的图片格式不正确，请重新选择");
 				}
 				var reader = new FileReader();
 				reader.index = i;
 				fd.append(i, this.files[i]);
 				reader.readAsDataURL(this.files[i]); //转成base64
 				reader.fileName = this.files[i].name;
 				reader.files = this.files[i];
 				reader.onload = function(e) {
 					var imgMsg = {
 						name: randomString(5), //获取文件名
 						base64: this.result, //reader.readAsDataURL方法执行完后，base64数据储存在reader.result里
 					}
 					dataArr.push(imgMsg);
 					for(var j = 0; j < dataArr.length; j++) {
 						currentReViewImgIndex = j
 					}
 					alert(this.result);
 					result = '<div class="showdiv"><img class="left" src="${path}/images/Arrow_left.svg" /><img class="center" src="${path}/images/delete.svg" /><img class="right" src="${path}/images/Arrow_right.svg" /></div><img id="img' +currentReViewImgIndex+randomString(1)+randomString(2) +randomString(5) + '" class="showimg" src="' + this.result + '" />';
 					var li = document.createElement('li');
 					li.innerHTML = result;
 					showui.appendChild(li);
 					index++;
 				}
 			}
 		}

 		function onclickimg() {
 			var dataArrlist = dataArr.length;
 			var lilength = document.querySelectorAll('ul#showui li');
 			for(var i = 0; i < lilength.length; i++) {
 				lilength[i].getElementsByTagName('img')[0].onclick = function(num) {
 					return function() {
 						if(num == 0) {} else {
 							var list = 0;
 							for(var j = 0; j < dataArr.length; j++) {
 								list = j
 							}
 							var up = num - 1;
 							dataArr.splice(up, 0, dataArr[num]);
 							dataArr.splice(num + 1, 1)
 							var lists = $("ul#showui li").length;
 							for(var j = 0; j < lists; j++) {
 								var usid = $("ul#showui li")[j].getElementsByTagName('img')[3];
 								$("#" +usid.id+ "").attr("src", dataArr[j].base64)
 							}
 						}
 					}
 				}(i)
 				//删除图标
 				lilength[i].getElementsByTagName('img')[1].onclick = function(num) {
 					return function() {
 						if(dataArr.length == 1) {
 							dataArr = [];
 							$("ul#showui").html("")
 						} else {
 							$("ul#showui li:eq(" + num + ")").remove()
 							dataArr.splice(num, 1)
 						}
 						
 						$.ajax

 					}
 				}(i)
 				//右箭头图标
 				lilength[i].getElementsByTagName('img')[2].onclick = function(num) {
 					return function() {
 						var list = 0;
 						for(var j = 0; j < dataArr.length; j++) {
 							list = j
 						}
 						var datalist = list + 1;
 						dataArr.splice(datalist, 0, dataArr[num]);
 						dataArr.splice(num, 1)
 						var lists = $("ul#showui li").length;
 						for(var j = 0; j < lists; j++) {
 							var usid = $("ul#showui li")[j].getElementsByTagName('img')[3];
 							$("#" + usid.id + "").attr("src", dataArr[j].base64)
 						}

 					}
 				}(i);

 			}
 		}
 		showui.addEventListener("click", function() {
 			onclickimg();
 		}, true)

 		function send(type) {
 			for(var j = 0; j < dataArr.length; j++) {
 				dataArr[j].name = "product_"+dataArr[j].name
 				$.ajax({
 					url:"${path}/mulImgUpload.ajax",
 					type:"post",
 					dataType:"json",
 					timeout:20000,
 					data:{
 						"type":type,
 						"base64":dataArr[j].base64,
 						"aac202":pid
 					},
 					success:function(res,status){
 						if(res.tag == 1)
 						{
 							dataArr = [];
 							$("ul#showui").html("");
 							alert("上传图片成功");
 						}
                       
 					},
 					error:function(res,status){
 						console.log("上传图片失败");
 					}
 				});
 				console.log(dataArr[j].name);
 			}
 		}

 		oSubmit1.onclick = function() {
 			if(!dataArr.length) {
 				return alert('请先选择图片文件');
 			}
 			send("ser");
 		};

 	}
     
     </script>
	
</html>