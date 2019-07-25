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
		  <style>
    * {
      padding: 0;
      margin: 0;
    }
    .wrap {
      width: 410px;
      margin: auto 0;
    }
    table {
      border-collapse: collapse;
      border-spacing: 0;
      border: 1px solid #c0c0c0;
    }
    th,
    td {
      border: 1px solid #d0d0d0;
      color: #404060;
      padding: 10px;
    }
    th {
      background-color: #09c;
      font: bold 16px "微软雅黑";
      color: #fff;
    }
    td {
      font: 14px "微软雅黑";
    }
    td a.get {
      text-decoration: none;
    }
    a.del:hover {
      text-decoration: underline;
    }
    tbody tr {
      background-color: #f0f0f0;
    }
    tbody tr:hover {
      cursor: pointer;
      background-color: #fafafa;
    }
    .btnAdd {
      width: 110px;
      height: 30px;
      font-size: 20px;
      font-weight: bold;
    }
    .form-item {
      height: 100%;
      position: relative;
      padding-left: 100px;
      padding-right: 20px;
      margin-bottom: 34px;
      line-height: 36px;
    }
    .form-item > .lb {
      position: absolute;
      left: 0;
      top: 0;
      display: block;
      width: 100px;
      text-align: right;
    }
    .form-item > .txt {
      width: 300px;
      height: 32px;
    }
    .mask {
      position: absolute;
      top: 0px;
      left: 0px;
      width: 100%;
      height: 100%;
      background: #000;
      opacity: 0.15;
      display: none;
    }
    .form-add {
      position: fixed;
      top: 30%;
      left: 50%;
      margin-left: -197px;
      padding-bottom: 20px;
      background: #fff;
      display: none;
    }
    .form-add-title {
      background-color: #f7f7f7;
      border-width: 1px 1px 0 1px;
      border-bottom: 0;
      margin-bottom: 15px;
      position: relative;
    }
    .form-add-title span {
      width: auto;
      height: 30px;
      font-size: 18px;
      font-family: 宋体;
      font-weight: bold;
      color: rgb(102, 102, 102);
      text-indent: 12px;
      padding: 8px 0px 10px;
      margin-right: 10px;
      display: block;
      overflow: hidden;
      text-align: left;
    }
    .form-add-title div {
      width: 16px;
      height: 30px;
      position: absolute;
      right: 10px;
      top: 6px;
      font-size: 30px;
      line-height: 16px;
      cursor: pointer;
    }
    .form-submit {
      text-align: center;
    }
    .form-submit input {
      width: 170px;
      height: 32px;
    }
  </style>
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
							<a href="#home" data-toggle="tab" onclick="showSave()" >商品基本信息</a>
						</li>
						
						<li>
							<a href="#pro_para" data-toggle="tab" onclick="hideSave()">产品参数</a>
						</li>
						<li>
							<a href="#spec" data-toggle="tab" onclick="hideSave()">规格</a>
						</li>
						
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">
                           
                           
                       
						<!--表单内容-->
						<div class="tab-pane active" id="home">
						  <form id="myform" action="" method="post">
							<div class="row data-type">
								<div class="col-md-2 title">商品分类</div>

								<div class="col-md-10 data">
								
                                   <button class="btn btn-default"><a href="<%=path %>/houtai/html/seller/sellerpage/sort.jsp">选择分类</a></button>
                               
                                   <input type="text" value="${sortName }" name="aab204" id="gaab204" readonly="readonly" required/>

								</div>

								<div class="col-md-2 title">商品名称</div>
								<div class="col-md-10 data">
									<input type="text" class="form-control" id="gaab202"  placeholder="商品名称"  name="aab202" value="" required/>
								</div>


								<div class="col-md-2 title">价格</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="价格" id="gaab205" name="aab205" required />
										<span class="input-group-addon">元</span>
									</div>
								</div>
								
								<div class="col-md-2 title">总库存</div>
								<div class="col-md-10 data">
									<div class="input-group">
										<input type="number" class="form-control" id="gaab206" placeholder="库存" name="aab206" required/>
									</div>
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
						  </form>
						</div>
 


         <!-- 产品参数 -->
                  <div class="tab-pane" id="pro_para">
									<div class="wrap">
										  <div>
										    <input type="button" value="添加数据" id="j_btnAddData" class="btn btn-primary""/>
										  </div>
										  <table>
										    <thead>
										    <tr>
										      <!-- <th><input type="checkbox" id="j_cbAll" /></th> -->
										      <th>产品参数</th>
										      <th>具体描述</th>
										      <th>操作</th>
										    </tr>
										    </thead>
										    <tbody id="j_tb">
										    
										    </tbody>
										  </table>
										</div>
										<div id="j_mask" class="mask"></div>
										<div id="j_formAdd" class="form-add">
										  <div class="form-add-title">
										    <span>添加参数</span>
										    <div id="j_hideFormAdd">x</div>
										  </div>
										  <div class="form-item">
										    <label class="lb" for="j_txtLesson">产品参数：</label>
										    <input class="txt" type="text" id="j_txtLesson" ">
										  </div>
										  <div class="form-item">
										    <label class="lb" for="j_txtBelSch">具体描述：</label>
										    <input class="txt" type="text" id="j_txtBelSch" >
										  </div>
										  <div class="form-submit">
										    <input type="button" value="添加" id="j_btnAdd">
										  </div>
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
				<button class="btn btn-primary"  id="goods_savehhh" onclick="saveData()"><i class="fa fa-save" ></i>保存</button>
				<button class="btn btn-default" onclick="window.location.href='<%=path %>/shop/queryProduct.html';">返回列表</button>
			</div>
			 
		</section>
		   
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
	
<script >
function showSave()
{
	$("#goods_savehhh").show();
}
function hideSave()
{
	$("#goods_savehhh").hide();
}


    
    
function saveData()
{   
	 if($("#gaab202").val().length == 0 || $("#gaab204").val().length == 0 || $("#gaab205").val().length == 0 || $("#gaab206").val().length == 0)
	 {
		 alert("基本信息不能为空!");
		 return;
	 }
	
	 if(isNumber($("#gaab205").val()) == false)
     {
		 alert("请正确输入商品价格");
		 return;
     }
	 
	 if($("#gaab206").val() < 0)
	 {
	     alert("请正确输入商品库存");
	     return;
	 }
	  var proStr = "";
	  var proTable = document.getElementById("j_tb");
	  var rows = proTable.rows;
	  for(var i=0;i<rows.length;i++){ //遍历表格的行
		  if(i == rows.length-1)
              proStr=proStr + rows[i].cells[0].innerHTML + ":" + rows[i].cells[1].innerHTML+"&";
         else 
        	 proStr=proStr + rows[i].cells[0].innerHTML + ":" + rows[i].cells[1].innerHTML + ";";
       }
	  proStr = proStr;
	  if(proStr == "")
     {
		  alert("请先添加产品参数");
		  return;
	 }
	  console.log(proStr);
	  
	  var specStr = "";
	  var specTable=document.getElementsByClassName("control-group lv1");
	  for(var i=0;i<specTable.length;i++){ //遍历
         // var spec = specTable[i].getElementById("spec_name").value;
	      var para = specTable[i].getElementsByTagName("input");
	      var paraStr = "";
	      for(var j = 0;j<para.length;j++)
	     {
	    	  if(j == para.length - 1)
	    	   paraStr = paraStr+para[j].value+";";
	    	else
	    		paraStr = paraStr+para[j].value+",";
	     }
	      specStr = specStr + paraStr;
       }
	  if(specStr == "")
		{
			  alert("请先添加商品规格");
		      return;
		}
	  console.log(specStr);
		 var vform = document.getElementById("myform");
		 vform.action="<%=path %>/shop/addProduct.html?aab209="+encodeURI(specStr)+"&aab207="+encodeURI(proStr);
		 vform.submit();
		 
}

function isNumber(val) {
    var regPos = /^\d+(\.\d+)?$/; //非负浮点数
    var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
    if(regPos.test(val) || regNeg.test(val)) {
        return true;
        } else {
        return false;
        }
    }
    
  $(document).ready(function () {
    $("#j_btnAddData").click(function () {
      $("#j_mask").show();
      $("#j_formAdd").show();
      $("#j_txtLesson").val("");
      $("#j_txtBelSch").val("");
    });
    $("#j_hideFormAdd").click(function () {
      $("#j_mask").hide();
      $("#j_formAdd").hide();
    });
    $("#j_btnAdd").click(function () {
      var txtLesson = $("#j_txtLesson").val();
      var txtBelSch = $("#j_txtBelSch").val();
      if (txtLesson == "" || txtBelSch == "") {
        alert("产品参数或具体描述不能为空");
        return;
      }
      var str = '<tr>'
          + '<td>' + txtLesson + '</td>'
          + '<td>' + txtBelSch + '</td>'
          + '<td><a href="javascrip:;" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="get">删除</a></td>'
          + '</tr>';
      $("#j_tb").append(str);
      $("#j_mask").hide();
      $("#j_formAdd").hide();
    });
    $("#j_tb").on("click",".get",function(){
      $(this).parent().parent().remove();
    });
  });
</script>
<script>

</script>
	<script>
	 var lv1HTML = '<div class="control-group lv1">' +
     '<label class="control-label">规格名称</label>' +
     '<div class="controls">' +
     '<input type="text" id="spec_name" name="lv1" placeholder="规格名称">' +
     '<button class="btn btn-primary add_lv2" type="button">添加参数</button>' +
     '<button class="btn btn-danger remove_lv1" type="button">删除规格</button>' +
     '</div>' +
     '<div class="controls lv2s"></div>' +
     '</div>';

 var lv2HTML = '<div style="margin-top: 5px;">' +
     '<input type="text" id="spec_para" name="lv2" placeholder="参数名称">' +
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
         tableHTML += '<table class="table table-bordered" id="spec_table">';
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


	</script>
	
</html>