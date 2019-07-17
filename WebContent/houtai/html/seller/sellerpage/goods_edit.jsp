<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商品编辑</title>
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
							<a href="#home" data-toggle="tab">商品基本信息</a>
						</li>
						<li>
							<a href="#pic_upload" data-toggle="tab">商品图片</a>
						</li>
						<li>
							<a href="#spec" data-toggle="tab">规格</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">
                           
                           
                         <form id="myform" action="addProduct.html" method="post">
						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<div class="col-md-2 title">商品分类</div>

								<div class="col-md-10 data">
								
                                   <button><a href="<%=path %>/houtai/seller/sellerpage/sort.jsp">选择分类</a></button>
                               
                                   <input type="text" value="${sortName }" name="aab204"/>

								</div>

								<div class="col-md-2 title">商品名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  required="required" placeholder="商品名称"  name="aab202" value=""/>
								</div>


								<div class="col-md-2 title">价格</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="价格" name="aab205" required="required"  />
										<span class="input-group-addon">元</span>
									</div>
								</div>
								
								<div class="col-md-2 title">总库存</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="库存" name="aab206" required="required" />
									</div>
								</div>

								<div class="col-md-2 title editer">商品介绍</div>
								<div class="col-md-10 data editer">
									<textarea name="content" name="aab207" style="width:800px;height:400px;visibility:hidden;"></textarea>
								</div>


								<div class="col-md-2 title">售后服务</div>
								<div class="col-md-10 data">
											<select  name="aab211">
													<option value="01">售后类型1</option>
													<option value="02">售后类型2</option>
													<option value="03">售后类型3</option>
						                  </select>
								</div>
							</div>
						</div>
                   </form>
                   
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
											<th class="sorting">图片</th>
											<th class="sorting">操作</th>
									</thead>
									<tbody>
										<tr ng-repeat="pojo in entity.goodsDesc.itemImages">
										
											<td><img id="preview" alt="图片" src="<%=path%>/images/upload/product_1.jpg" width="100px" height="100px"></td>
											<td><button type="button" class="btn btn-default" title="删除" ng-click="remove_image_entity($index)"><i class="fa fa-trash-o"></i> 删除</button></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>

						

						<!--规格-->
						<div class="tab-pane" id="spec">
							<div class="control-group">
							    <label class="control-label"> </label>
							    <div class="controls">
							        <button id="add_lv1" class="btn btn-primary" type="button">添加规格项</button>
							        <button id="update_table" class="btn btn-success" type="button">刷新规格项目表</button>
							    </div>
							</div>
							<div id="lv_table_con" class="control-group" style="display: none;">
							    <label class="control-label">规格项目表</label>
							    <div class="controls">
							        <div id="lv_table">
							            
							        </div>
							    </div>
                             </div>
						</div>
					</div>
					<!--tab内容/-->
					<!--表单内容/-->

				</div>
			</div>
			
			<div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary"   onclick="saveData()"><i class="fa fa-save" ></i>保存</button>
				<button class="btn btn-default" onclick="window.location.href='queryProduct.html';">返回列表</button>
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
								<td>商品图片</td>
								<td>
									<table>
										<tr>
											<div class="filePic">
												<input id="pop_file" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
												<img id="preview" width="200px" height="200px" src="" alt="no image" />
											</div>
										</tr>
									</table>
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="add_image_entity()" onclick="uploadImg()">确定</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
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
	<script>
	 var lv1HTML = '<div class="control-group lv1">' +
     '<label class="control-label">规格名称</label>' +
     '<div class="controls">' +
     '<input type="text" name="lv1" placeholder="规格名称">' +
     '<button class="btn btn-primary add_lv2" type="button">添加参数</button>' +
     '<button class="btn btn-danger remove_lv1" type="button">删除规格</button>' +
     '</div>' +
     '<div class="controls lv2s"></div>' +
     '</div>';

 var lv2HTML = '<div style="margin-top: 5px;">' +
     '<input type="text" name="lv2" placeholder="参数名称">' +
     '<button class="btn btn-danger remove_lv2" type="button">删除参数</button>' +
     '</div>';

 $(document).ready(function() {
     $('#add_lv1').on('click', function() {
         var last = $('.control-group.lv1:last');
         if (!last || last.length == 0) {
             $(this).parents('.control-group').eq(0).after(lv1HTML);
         } else {
             last.after(lv1HTML);
         }
     });

     $(document).on('click', '.remove_lv1', function() {
         $(this).parents('.lv1').remove();
     });

     $(document).on('click', '.add_lv2', function() {
         $(this).parents('.lv1').find('.lv2s').append(lv2HTML);
     });

     $(document).on('click', '.remove_lv2', function() {
         $(this).parent().remove();
     });

     $('#update_table').on('click', function() {
         var lv1Arr = $('input[name="lv1"]');
         if (!lv1Arr || lv1Arr.length == 0) {
             $('#lv_table_con').hide();
             $('#lv_table').html('');
             return;
         }
         for (var i = 0; i < lv1Arr.length; i++) {
             var lv2Arr = $(lv1Arr[i]).parents('.lv1').find('input[name="lv2"]');
             if (!lv2Arr || lv2Arr.length == 0) {
                 alert('请先删除无参数的规格项！');
                 return;
             }
         }

         var tableHTML = '';
         tableHTML += '<table class="table table-bordered">';
         tableHTML += '    <thead>';
         tableHTML += '        <tr>';
         for (var i = 0; i < lv1Arr.length; i++) {
             tableHTML += '<th width="50">' + $(lv1Arr[i]).val() + '</th>';
         }
         tableHTML += '            <th width="20">价格</th>';
         tableHTML += '            <th width="20">库存</th>';
         tableHTML += '        </tr>';
         tableHTML += '    </thead>';
         tableHTML += '    <tbody>';

         var numsArr = new Array();
         var idxArr = new Array();
         //numsArr记录每个规格又多少个参数，并用idxarr记录规格数组下标 方便后边标记name
         for (var i = 0; i < lv1Arr.length; i++) {
             numsArr.push($(lv1Arr[i]).parents('.lv1').find('input[name="lv2"]').length);
             idxArr[i] = 0;
         }

         var len = 1;
         var rowsArr = new Array();
         for (var i = 0; i < numsArr.length; i++) {
             //len  记录参数总行数
             len = len * numsArr[i];

             var tmpnum = 1;
             for (var j = numsArr.length - 1; j > i; j--) {
                 tmpnum = tmpnum * numsArr[j];
             }
             //当前规格每个参数所占行数
             rowsArr.push(tmpnum);
         }

         for (var i = 0; i < len; i++) {
             tableHTML += '        <tr data-row="' + (i+1) + '">';

             var name = '';
             for (var j = 0; j < lv1Arr.length; j++) {
                 var n = parseInt(i / rowsArr[j]);
                 if (j == 0) {
                 } else if (j == lv1Arr.length - 1) {
                     n = idxArr[j];
                     if (idxArr[j] + 1 >= numsArr[j]) {
                         idxArr[j] = 0;
                     } else {
                         idxArr[j]++;
                     }
                 } else {
                     var m = parseInt(i / rowsArr[j]);
                     n = m % numsArr[j];
                 }

                 var text = $(lv1Arr[j]).parents('.lv1').find('input[name="lv2"]').eq(n).val();
                 if (j != lv1Arr.length - 1) {
                     name += text + '_';
                 } else {
                     name += text;
                 }

                 if (i % rowsArr[j] == 0) {
                     tableHTML += '<td width="50" rowspan="' + rowsArr[j] + '" data-rc="' + (i+1) + '_' + (j+1) + '">' + text + '</td>';
                 }
             }

             tableHTML += '<td width="20"><input type="text" name="' + name + '[price]" /></td>';
             tableHTML += '<td width="20"><input type="text" name="' + name + '[amount]" /></td>';
             tableHTML += '</tr>';
         }
         tableHTML += '</tbody>';
         tableHTML += '</table>';

         $('#lv_table_con').show();
         $('#lv_table').html(tableHTML);
     });
 });
 
 /////////////////
 
  var formdata = new FormData();
 function uploadFile(ev){
    var that = this;
    const file = document.getElementById('pop_file');
    const fileObj = file.files[0];
    formdata.append("file",fileObj);
    const windowURL = window.URL || window.webkitURL;
    const img = document.getElementById('preview');
    if(file && fileObj) {
        const dataURl = windowURL.createObjectURL(fileObj);
        console.log(dataURl);
        img.setAttribute('src',dataURl);
    }
    
   // var ftype = "user_${user.aaa102}";
  
}
 
 function uploadImg()
 {    
	    $.ajax({
			url:"<%=path%>/fileUpload.ajax?type=product&id=1",
			type:"post",
			dataType:"json",
			processData : false,
			contentType : false,
			timeout : 20000,
			data : formdata,
			success:function(res,status){
				//img.setAttribute('src',"<%=path%>/images/upload/user_1.jpg")
	            console.log("上传图片成功");
				},
				error:function(res,status){
					console.log("上传图片失败");
				}
		 });
 }
 
 function saveData()
 {
	 var vform = document.getElementById("myform");
	 vform.submit();
 }

	</script>

</html>