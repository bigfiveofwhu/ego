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
							<th class="sorting">���</th>
							<th class="sorting">��ƷID</th>
							<th class="sorting">��Ʒ����</th>
							<th class="sorting">��Ʒ�۸�(Ԫ)</th>
							<th class="sorting">��Ʒ����</th>
							<th class="sorting">���</th>
							<th class="sorting">״̬</th>
							<th class="text-center">����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="ins" varStatus="vs">
						<tr>
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
						<c:if test="${ins.cnaab212 == 'δ���' }">
									      <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aab203}','img')" >
										ͼƬ
								</button>
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail('${ins.aab203}','pro')"> ����</button>
						</c:if>
						
						      <c:if test="${ins.cnaab212 == '���ͨ��' }">
						      <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aab203}','img')" >
										ͼƬ
								</button>
								<button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail('${ins.aab203}','pro')"> ����</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','putoff');" >
										�¼�
								</button>
								</c:if>
								
								  <c:if test="${ins.cnaab212 == '���δͨ��' }">
								   <button type="button" id="button_0" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#imgModal" onclick="getProImg('${ins.aab203}','img')" >
										ͼƬ
								   </button>
								   <button type="button" id="button_1"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail('${ins.aab203}','pro')"> ����</button>
                                    <button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','del');">ɾ��</button>
								  
								  </c:if>
								
								 <c:if test="${ins.cnaab212 == '���¼�' }">
								<button type="button" id="button_1" name="delete" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','del');">ɾ��</button>
								<button type="button" id="button_2" class="btn bg-olive btn-xs" onclick="putoff_del('${ins.aab203}','puton');"  >
										�����ϼ�
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
                            >��
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
                                    <td>�޸���Ʒ�۸�</td>
                                    <td id="aab205" class="">
                                    <input type="text" id="modify_price" value=""></input>Ԫ
                                    </td>
                                </tr>
                                <tr>
                                    <td>�޸Ŀ��</td>
                                    <td id="aab206" class="">
                                    <input type="number" id="modify_amount" value=""></input>
                                    </td>
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
                    </div>
                    <!-- ѡ����� -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updatePro()">
                              ����
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" >�ر�
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ͼƬ -->
       <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">��
                    </button>
                    <h3 id="myModalLabel">ͼƬ</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#proimghhh" data-toggle="tab">��ƷͼƬ</a>
                        </li>
                        <li>
                            <a href="#specimghhh" data-toggle="tab">����ͼƬ</a>
                        </li>
                    </ul>

                    <!-- ѡ���ʼ -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="proimghhh">
                            <br>
                          <!-- ��ƷͼƬ -->
                        
                        </div>
                        <div class="tab-pane fade" id="specimghhh">
                            <!-- ����ͼƬ -->
                        </div>
                    </div>
                    <!-- ѡ����� -->

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
	                    $("#modify_price").val(map.aab205);
	                    $("#modify_amount").val(map.aab206);
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
    
    function isNumber(val) {
        var regPos = /^\d+(\.\d+)?$/; //�Ǹ�������
        var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //��������
        if(regPos.test(val) || regNeg.test(val)) {
            return true;
            } else {
            return false;
            }
        }
    
    function updatePro()
    {
    	if(isNumber($("#modify_price").val()) == false)
   		{
   		   alert("����ȷ�޸���Ʒ�۸�");
   		   return;
   		}
    	
    	if($("#modify_amount").val() < 0)
   		{
   		   alert("����ȷ�޸���Ʒ���");
   		   return;
   		}
    	$.ajax({
    		url:"${path}/putOffGoods.ajax",
    		type:"post",
    		timeout:20000,
    		dataType:"json",
    		data:{
    			"aab203":pid,
    			"type":"update",
    			"aab205":$("#modify_price").val(),
    			"aab206":$("#modify_amount").val()
    		},
    		success:function(res,status){
	    			if(res.tag == 1)
	    		{
	    			console.log("�����ɹ�");
	    		}
	    			else
	    				console.log("����ʧ��");
    		},
    		error:function(res,status){
    			console.log("��������");
    		}
    	});
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
    
    function getProImg(id,type)
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
    			$("#proimghhh").html("");
    			$("#specimghhh").html("");
    			var prodiv = document.getElementById("proimghhh");
    			//alert(res.proimgUrl.length)
    			if(res.proimgUrl.length > 0)
    			for(var i =0;i<res.proimgUrl.length;i++)
	    		{
    				if(res.proimgUrl[i] == "")
    					break;
	    			var div = document.createElement('div');
	    			var imgurl = '${path}' + res.proimgUrl[i];
	    			var result = '<img style="width:150px;heigth:150px;float:left;margin-left:30px"  src="' + imgurl + '" />';
	    			div.innerHTML=result;
	    			prodiv.appendChild(div);
	    		}
    			
    			var prodiv = document.getElementById("specimghhh");
    			//alert(res.specimgUrl.length);
    			if(res.specimgUrl.length > 0)
    			for(var i =0;i<res.specimgUrl.length;i++)
	    		{
    				if(res.specimgUrl[i] == "")
    					break;
	    			var div = document.createElement('div');
	    			var imgurl = '${path}' + res.specimgUrl[i];
	    			var result = '<img style="width:150px;heigth:150px;float:left;margin-left:30px"  src="' + imgurl + '" />';
	    			div.innerHTML=result;
	    			prodiv.appendChild(div);
	    		}	
    		},
    		error:function(res,status){
    			console.log("ͼƬ��ʾ����");
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
		function randomString(len) {
			return "";
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

			//alert(iLen);

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

					//alert(this.result);

					result = '<div class="showdiv"><img class="left" src="${path}/images/Arrow_left.svg" /><img class="center" src="${path}/images/delete.svg" /><img class="right" src="${path}/images/Arrow_right.svg" /></div><img  id="img' +currentReViewImgIndex+randomString(1)+randomString(2) +randomString(5) + '" class="showimg" src="' + this.result + '" />';
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
		
       // var imgcount = 0;
		function send(type) {
			
			for(var j = dataArr.length -1; j >= 0; j--) {
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
							//dataArr = [];
							//alert("�ϴ��ɹ���"+j+"��ͼƬ")
						
						}
                      
					},
					error:function(res,status){
						console.log("�ϴ�ͼƬʧ��");
					}
				});
				console.log(dataArr[j].name);
			}
			//alert(imgcount);
			//if(imgcount == dataArr.length)
				alert("ͼƬ�ϴ��ɹ�");
			$("ul#showui").html("");
			dataArr = [];
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