<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>��������</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<style type="text/css">
		 /*������*/
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
            filter: alpha(opacity=80);/* ֻ֧��IE6��7��8��9 */
        }
 
        /*������*/
        #popBox {
            display: none;
            background-color: #FFFFFF;
            z-index: 11;
            width: 300px;
            height: 200px;
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
 
        /*�رհ�ť*/
        #popBox .close a {
            text-decoration: none;
            color: #2D2C3B;
        }
 
		</style>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">��������</h3>
		</div>

		<div class="box-body">

			<!-- ���ݱ�� -->
			<div class="table-box">

				<!--������-->
				<form action="<%=path %>/shop/queryOrder.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select ng-model="search_domain.auditStatus" name="qaab303">
							<option value="">ȫ��</option>
							<option value="01">������</option>
							<option value="02">������</option>
							<option value="04">�ѷ���</option>
							<option value="05">������</option>
							<option value="08">���˿�</option>
						</select>
						�����ţ�<input name="qaab302" ng-model="search_domain.goodsName">
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
							<th class="sorting">�������</th>
							<th class="sorting">�µ�ʱ��</th>
							<th class="sorting">���ѽ��</th>
							<th class="sorting">���״̬</th>
							<th class="sorting">�������</th>
							<th class="sorting">����ʱ��</th>
							<th class="text-center">����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aab302}</td>
							<td>${ins.aab304}</td>
							<td>${ins.totalmoney}</td>
							<td>${ins.cnaab303}</td>
							<td>${ins.aab312}</td>
							<td>${ins.aab306}</td>
						<td class="text-center">
						
						<button type="button" id="button_order"  class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getOrderDetail('${ins.aab302}','order','${ins.cnaab303}')"> ����</button>
						<c:if test="${ins.cnaab303 == '������' }">
								<button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aab302}','${ins.aab203}')">
										����
								</button>
					    </c:if>
					    <c:if test="${ins.aab306 != null && ins.cnaab303 != '���˿�'}">
								<button type="button" class="btn bg-olive btn-xs" disabled="disabled">
										�ѷ���
								</button>
					    </c:if>
					    
					    <c:if test="${ins.cnaab303 == '���˿�' }">
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
                    <h3 id="myModalLabel">��������</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#order" data-toggle="tab">������ϸ��Ϣ</a>
                        </li>
                    </ul>

                    <!-- ѡ���ʼ -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="order">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>������</td>
                                    <td id="aab302" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ����</td>
                                    <td id="aab202" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�û���</td>
                                    <td id="aaa103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>����ʱ��</td>
                                    <td id="aab304" class="to_clear">
                                    </td>
                                </tr>
                                <tr>
                                    <td>����ʱ��</td>
                                    <td id="aab305" class="to_clear">
                                    </td>
                                </tr>
                                <tr>
                                    <td>����ʱ��</td>
                                    <td id="aab306" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�ջ�ʱ��</td>
                                    <td id="aab307" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>������</td>
                                    <td id="aab309" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�ջ���ַ</td>
                                    <td id="aab311" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�������</td>
                                    <td id="aab312" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�˷�</td>
                                    <td id="aab313" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>״̬</td>
                                    <td id="state_order" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- ѡ����� -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" >�ر�
                    </button>
                </div>
            </div>
        </div>
    </div>
		
      <div id="popLayer"></div>
     <div id="popBox">
       <div class="close">
        <a href="javascript:void(0)" onclick="closeBox()">��</a>
     </div>
    <div class="content">
    <form action="<%=path %>/shop/deliver.html" method="post">
              ��������:<input type="text" class="form-control" name="aab309" required/>
    	<select class="has-feedback">
							<option value="">ѡ���ݷ�</option>
							<option value="02">Բͨ</option>
							<option value="04">��ͨ</option>
							<option value="05">�ϴ�</option>
			</select>
			<br>
			<input type="hidden" id="ddbh" name="aab302"/>
			<input type="hidden" id="proidhhh" name="aab203"/>
    <input type="submit" class="btn" value="ȷ��"></input>
    </form>
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
    <script>
    /*���������ť*/
    function popBox(aab302,aab203) {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        $("#ddbh").val(aab302);
        $("#proidhhh").val(aab203);
       // document.getElementById("replyText").value = v;
        popBox.style.display = "block";
        popLayer.style.display = "block";
    };
    
    /*����رհ�ť*/
    function closeBox() {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        popBox.style.display = "none";
        popLayer.style.display = "none";
    }
    
    function getOrderDetail(id,type,vs) {
    	//pid = id
        $.ajax({
            url: "<%=path%>/putOffGoods.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab302": id,
                "type": type
            },
            success: function (res) {
            	if(res.tag == 1)
	            {
	                var map = res.map;
	                if (typeof (map) !== "undefined") {
	                    $("#aab302").html(map.aab302);
	                    $("#aab202").html(map.aab202);
	                    $("#aaa103").html(map.aaa103);
	                    $("#aab304").html(map.aab304);
	                    $("#aab305").html(map.aab305);
	                    $("#aab306").html(map.aab306);
	                    $("#aab307").html(map.aab307);
	                    $("#aab309").html(map.aab309);
	                    $("#aab311").html(map.aab311);
	                    $("#aab312").html(map.aab312);
	                    $("#aab313").html(map.aab313);
	                    $("#state_order").html(vs);
	                    console.log("��ȡ������ϸ��Ϣ�ɹ�")
	                }
	            }
            },
            error: function () {
                console.log("������ϸ��Ϣ�첽���ش���");
            }
        });
    }
    
    </script>
</html>