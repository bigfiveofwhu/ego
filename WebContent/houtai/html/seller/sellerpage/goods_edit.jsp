<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��Ʒ�༭</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<!-- ���ı��༭�� -->
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/kindeditor/themes/default/default.css" />
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
							<a href="#home" data-toggle="tab">��Ʒ������Ϣ</a>
						</li>
						<li>
							<a href="#pic_upload" data-toggle="tab">��ƷͼƬ</a>
						</li>
						<li>
							<a href="#spec" data-toggle="tab">���</a>
						</li>
					</ul>
					<!--tabͷ/-->

					<!--tab����-->
					<div class="tab-content">
                           
                           
                         <form id="myform" action="addProduct.html" method="post">
						<!--������-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<div class="col-md-2 title">��Ʒ����</div>

								<div class="col-md-10 data">
								
                                   <button><a href="<%=path %>/houtai/seller/sellerpage/sort.jsp">ѡ�����</a></button>
                               
                                   <input type="text" value="${sortName }" name="aab204"/>

								</div>

								<div class="col-md-2 title">��Ʒ����</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control"  required="required" placeholder="��Ʒ����"  name="aab202" value=""/>
								</div>


								<div class="col-md-2 title">�۸�</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="�۸�" name="aab205" required="required"  />
										<span class="input-group-addon">Ԫ</span>
									</div>
								</div>
								
								<div class="col-md-2 title">�ܿ��</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="���" name="aab206" required="required" />
									</div>
								</div>

								<div class="col-md-2 title editer">��Ʒ����</div>
								<div class="col-md-10 data editer">
									<textarea name="content" name="aab207" style="width:800px;height:400px;visibility:hidden;"></textarea>
								</div>


								<div class="col-md-2 title">�ۺ����</div>
								<div class="col-md-10 data">
											<select  name="aab211">
													<option value="01">�ۺ�����1</option>
													<option value="02">�ۺ�����2</option>
													<option value="03">�ۺ�����3</option>
						                  </select>
								</div>
							</div>
						</div>
                   </form>
                   
						<!--ͼƬ�ϴ�-->
						<div class="tab-pane" id="pic_upload">
							<div class="row data-type">
								<!-- ��ɫͼƬ -->
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="�½�" data-target="#uploadModal" data-toggle="modal" ng-click="image_entity={}"><i class="fa fa-file-o"></i> �½�</button>

								</div>

								<table class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<th class="sorting">ͼƬ</th>
											<th class="sorting">����</th>
									</thead>
									<tbody>
										<tr ng-repeat="pojo in entity.goodsDesc.itemImages">
										
											<td><img id="preview" alt="ͼƬ" src="<%=path%>/images/upload/product_1.jpg" width="100px" height="100px"></td>
											<td><button type="button" class="btn btn-default" title="ɾ��" ng-click="remove_image_entity($index)"><i class="fa fa-trash-o"></i> ɾ��</button></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>

						

						<!--���-->
						<div class="tab-pane" id="spec">
							<div class="control-group">
							    <label class="control-label"> </label>
							    <div class="controls">
							        <button id="add_lv1" class="btn btn-primary" type="button">��ӹ����</button>
							        <button id="update_table" class="btn btn-success" type="button">ˢ�¹����Ŀ��</button>
							    </div>
							</div>
							<div id="lv_table_con" class="control-group" style="display: none;">
							    <label class="control-label">�����Ŀ��</label>
							    <div class="controls">
							        <div id="lv_table">
							            
							        </div>
							    </div>
                             </div>
						</div>
					</div>
					<!--tab����/-->
					<!--������/-->

				</div>
			</div>
			
			<div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary"   onclick="saveData()"><i class="fa fa-save" ></i>����</button>
				<button class="btn btn-default" onclick="window.location.href='queryProduct.html';">�����б�</button>
			</div>
			 
		</section>
		   

		<!-- �ϴ����� -->
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
						<h3 id="myModalLabel">�ϴ���ƷͼƬ</h3>
					</div>
					<div class="modal-body">

						<table class="table table-bordered table-striped">
							<tr>
								<td>��ƷͼƬ</td>
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
						<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" ng-click="add_image_entity()" onclick="uploadImg()">ȷ��</button>
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">�ر�</button>
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
     '<label class="control-label">�������</label>' +
     '<div class="controls">' +
     '<input type="text" name="lv1" placeholder="�������">' +
     '<button class="btn btn-primary add_lv2" type="button">��Ӳ���</button>' +
     '<button class="btn btn-danger remove_lv1" type="button">ɾ�����</button>' +
     '</div>' +
     '<div class="controls lv2s"></div>' +
     '</div>';

 var lv2HTML = '<div style="margin-top: 5px;">' +
     '<input type="text" name="lv2" placeholder="��������">' +
     '<button class="btn btn-danger remove_lv2" type="button">ɾ������</button>' +
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
                 alert('����ɾ���޲����Ĺ���');
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
         tableHTML += '            <th width="20">�۸�</th>';
         tableHTML += '            <th width="20">���</th>';
         tableHTML += '        </tr>';
         tableHTML += '    </thead>';
         tableHTML += '    <tbody>';

         var numsArr = new Array();
         var idxArr = new Array();
         //numsArr��¼ÿ������ֶ��ٸ�����������idxarr��¼��������±� �����߱��name
         for (var i = 0; i < lv1Arr.length; i++) {
             numsArr.push($(lv1Arr[i]).parents('.lv1').find('input[name="lv2"]').length);
             idxArr[i] = 0;
         }

         var len = 1;
         var rowsArr = new Array();
         for (var i = 0; i < numsArr.length; i++) {
             //len  ��¼����������
             len = len * numsArr[i];

             var tmpnum = 1;
             for (var j = numsArr.length - 1; j > i; j--) {
                 tmpnum = tmpnum * numsArr[j];
             }
             //��ǰ���ÿ��������ռ����
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
	            console.log("�ϴ�ͼƬ�ɹ�");
				},
				error:function(res,status){
					console.log("�ϴ�ͼƬʧ��");
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