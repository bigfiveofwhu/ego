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
			<h3 class="box-title">商品管理</h3>
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
				<form action="<%=path %>/shop/queryProduct.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						状态：
						<select ng-model="search_domain.auditStatus" name="qaab212">
							<option value="">全部</option>
							<option value="01">未审核</option>
							<option value="02">审核通过</option>
							<option value="03">审核未通过</option>
							<option value="04">已下架</option>
						</select>
						商品名称：<input name="qaab202" ng-model="search_domain.goodsName">
						<input type="submit"  value="查询"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--工具栏/-->

				<!--数据列表-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting">序号</th>
							<th class="sorting">商品ID</th>
							<th class="sorting">商品名称</th>
							<th class="sorting">商品价格</th>
							<th class="sorting">商品分类</th>
							<th class="sorting">库存</th>
							<th class="sorting">状态</th>
							<th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="ins" varStatus="vs">
						<tr>
							<td><input type="checkbox" ></td>
							<td>${vs.count}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aab205}</td>
							<td>${ins.cnaab204}</td>
							<td>${ins.aab206}</td>
							<td>
							  ${ins.cnaab212}
							</td>
						<td class="text-center">
						      <c:if test="${ins.cnaab212 != '已下架' }">
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail('${ins.aab203}','pro')"> 详情</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','putoff');" >
										下架
								</button>
								</c:if>
								
								 <c:if test="${ins.cnaab212 == '已下架' }">
								<button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','del');">删除</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" disabled >
										已下架
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
		
		    <!-- 商品详情 -->
   <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">×
                    </button>
                    <h3 id="myModalLabel">商品详情</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#goods" data-toggle="tab">商品详细信息</a>
                        </li>
                        <li>
                            <a href="#shopimg" data-toggle="tab">上传图片</a>
                        </li>
                        <li>
                            <a href="#detail" data-toggle="tab">商品规格</a>
                        </li>
                    </ul>

                    <!-- 选项卡开始 -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="goods">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>商品名称</td>
                                    <td id="aab202" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品id</td>
                                    <td id="aab203" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品类型</td>
                                    <td id="aab204" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品价格</td>
                                    <td id="aab205" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>库存</td>
                                    <td id="aab206" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>售后类型</td>
                                    <td id="cnaab211" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品状态</td>
                                    <td id="aab212" class="to_clear"></td>
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
				
							<button class="btn" id="submit1">上传商品图片</button>
							<button class="btn" id="submit2">上传详情图片</button>
                        </div>

                        <div class="tab-pane fade" id="detail">
                            <br>
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
                    <!-- 选项卡结束 -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('04')">
                              保存
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="clearDetails()">关闭
                    </button>
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
    </script>
    <script type="text/javascript">
    var pid;
    function getGoodDetail(id,type) {
    	pid = id
        $.ajax({
            url: "<%=path%>/putOffGoods.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab203": id,
                "type": type
            },
            success: function (res) {
            	if(res.tag == 1)
	            {
	                var map = res.map;
	                if (typeof (map) !== "undefined") {
	                    $("#aab202").html(map.aab202);
	                    $("#aab203").html(map.aab203);
	                    $("#aab204").html(map.cnaab204);
	                    $("#aab205").html(map.aab205);
	                    $("#aab206").html(map.aab206);
	                    $("#cnaab211").html(map.cnaab211);
	                    $("#aab212").html(map.cnaab212);
	
	                    console.log("获取商品详细信息成功")
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
    			"aab203":id,
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
	window.onload = function() {
		var input = document.getElementById("upgteimg");
		var showui = document.getElementById("showui");
		var result;
		var dataArr = []; // 储存所选图片的结果(文件名和base64数据)
		var fd; //FormData方式发送请求
		var showinput = document.getElementById("showinput");
		var oSubmit1 = document.getElementById("submit1");
		var oSubmit2 = document.getElementById("submit2");
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
						"aab203":pid
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
				return alert('请先选择文件');
			}
			send("shop");
		};
		oSubmit2.onclick = function() {
			if(!dataArr.length) {
				return alert('请先选择文件');
			}
			send("spec");
		};

	}
 </script>
</html>