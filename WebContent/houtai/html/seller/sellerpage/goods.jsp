<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��Ʒ����</title>
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
			<h3 class="box-title">��Ʒ����</h3>
		</div>

		<div class="box-body">

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<div class="pull-left">
					<div class="form-group form-inline">
						<div class="btn-group">
							<button type="button" class="btn btn-default" title="ˢ��" onclick="window.location.reload();"><i class="fa fa-refresh"></i> ˢ��</button>
						</div>
					</div>
				</div>
				<form action="<%=path %>/shop/queryProduct.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select ng-model="search_domain.auditStatus" name="qaab212">
							<option value="">ȫ��</option>
							<option value="01">δ���</option>
							<option value="02">���ͨ��</option>
							<option value="03">���δͨ��</option>
							<option value="04">���¼�</option>
						</select>
						��Ʒ���ƣ�<input name="qaab202" ng-model="search_domain.goodsName">
						<input type="submit"  value="��ѯ"class="btn btn-default"></input>
					</div>
				</div>
				</form>
				<!--������/-->

				<!--�����б�-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="" style="padding-right:0px">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting">���</th>
							<th class="sorting">��ƷID</th>
							<th class="sorting">��Ʒ����</th>
							<th class="sorting">��Ʒ�۸�</th>
							<th class="sorting">��Ʒ����</th>
							<th class="sorting">���</th>
							<th class="sorting">״̬</th>
							<th class="text-center">����</th>
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
						      <c:if test="${ins.cnaab212 != '���¼�' }">
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail('${ins.aab203}','pro')"> ����</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','putoff');" >
										�¼�
								</button>
								</c:if>
								
								 <c:if test="${ins.cnaab212 == '���¼�' }">
								<button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','del');">ɾ��</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" disabled >
										���¼�
								</button>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--�����б�/-->
				<tm-pagination conf="paginationConf"></tm-pagination>

			</div>
			<!-- ���ݱ�� /-->

		</div>
		<!-- /.box-body -->
		
		    <!-- ��Ʒ���� -->
   <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">��
                    </button>
                    <h3 id="myModalLabel">��Ʒ����</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#goods" data-toggle="tab">��Ʒ��ϸ��Ϣ</a>
                        </li>
                        <li>
                            <a href="#shopimg" data-toggle="tab">�ϴ�ͼƬ</a>
                        </li>
                        <li>
                            <a href="#detail" data-toggle="tab">��Ʒ���</a>
                        </li>
                    </ul>

                    <!-- ѡ���ʼ -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="goods">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>��Ʒ����</td>
                                    <td id="aab202" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒid</td>
                                    <td id="aab203" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ����</td>
                                    <td id="aab204" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ�۸�</td>
                                    <td id="aab205" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>���</td>
                                    <td id="aab206" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�ۺ�����</td>
                                    <td id="cnaab211" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ״̬</td>
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
				
							<button class="btn" id="submit1">�ϴ���ƷͼƬ</button>
							<button class="btn" id="submit2">�ϴ�����ͼƬ</button>
                        </div>

                        <div class="tab-pane fade" id="detail">
                            <br>
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
                    <!-- ѡ����� -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('04')">
                              ����
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="clearDetails()">�ر�
                    </button>
                </div>
            </div>
        </div>
    </div>
	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- ��ҳ�����ʼ -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="utf-8"></script>
	-->
	<!-- ��ҳ������� -->
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
	
	                    console.log("��ȡ��Ʒ��ϸ��Ϣ�ɹ�")
	                }
	            }
            },
            error: function () {
                console.log("��Ʒ��ϸ��Ϣ�첽���ش���");
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
	    			console.log("�����ɹ�");
	    			location.reload();
	    		}
	    			else
	    				console.log("����ʧ��");
    		},
    		error:function(res,status){
    			console.log("��������");
    		}
    	});
    }
	window.onload = function() {
		var input = document.getElementById("upgteimg");
		var showui = document.getElementById("showui");
		var result;
		var dataArr = []; // ������ѡͼƬ�Ľ��(�ļ�����base64����)
		var fd; //FormData��ʽ��������
		var showinput = document.getElementById("showinput");
		var oSubmit1 = document.getElementById("submit1");
		var oSubmit2 = document.getElementById("submit2");
		var dateli, dateinput;
		function randomString(len) {����
			len = len || 32;����
			var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; /****Ĭ��ȥ�������׻������ַ�oOLl,9gq,Vv,Uu,I1****/ ����
			var maxPos = $chars.length;����
			var pwd = '';����
			for(i = 0; i < len; i++) {��������
				pwd += $chars.charAt(Math.floor(Math.random() * maxPos));����
			}
			return pwd;
		}
		console.log()
		if(typeof FileReader === 'undefined') {
			alert("��Ǹ������������֧�� FileReader");
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
				if(!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)) { //�ж��ϴ��ļ���ʽ
					return alert("�ϴ���ͼƬ��ʽ����ȷ��������ѡ��");
				}
				var reader = new FileReader();
				reader.index = i;
				fd.append(i, this.files[i]);
				reader.readAsDataURL(this.files[i]); //ת��base64
				reader.fileName = this.files[i].name;
				reader.files = this.files[i];
				reader.onload = function(e) {
					var imgMsg = {
						name: randomString(5), //��ȡ�ļ���
						base64: this.result, //reader.readAsDataURL����ִ�����base64���ݴ�����reader.result��
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
				//ɾ��ͼ��
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
				//�Ҽ�ͷͼ��
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
							alert("�ϴ�ͼƬ�ɹ�");
						}
                      
					},
					error:function(res,status){
						console.log("�ϴ�ͼƬʧ��");
					}
				});
				console.log(dataArr[j].name);
			}
		}

		oSubmit1.onclick = function() {
			if(!dataArr.length) {
				return alert('����ѡ���ļ�');
			}
			send("shop");
		};
		oSubmit2.onclick = function() {
			if(!dataArr.length) {
				return alert('����ѡ���ļ�');
			}
			send("spec");
		};

	}
 </script>
</html>