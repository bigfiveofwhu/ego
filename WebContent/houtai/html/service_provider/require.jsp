<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�������</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<script type="text/javascript" src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<style>
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
			<h3 class="box-title">�������</h3>
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
				<form action="<%=path %>/service/queryComment.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select id="selectReq"  name="isreply">
							<option value="00" selected>ȫ��</option>
							<option value="01">δ���뾺��</option>
							<option value="02">�Ѳ��뾺��</option>
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
				<!--������/-->

				<!--�����б�-->
				<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting">���</th>
							<th class="sorting">�ͻ��ǳ�</th>
							<th class="sorting">��������</th>
							<th class="sorting">����ʽ</th>
							<th class="sorting">��������</th>
							<th class="sorting">��ϸ��ַ</th>
							<th class="sorting">�ύʱ��</th>
							<th class="text-center">����</th>
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
			         		<button id="require${vs.count}" type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aac602}','${vs.count}')" data-id="">����</button>
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
											text="���뾺��";
											$("#require${vs.count}").attr("data-id","0");
										}else if(res.status=='01'){
											text='�鿴��������';
											$("#require${vs.count}").attr("data-id",res.aac302);
										}
										$("#require${vs.count}").text(text);
									},
									error:function(res,status){
										console.log("�������!");
									}
								});
							});
						</script>
						</c:forEach>
					</tbody>
				</table>
				<!--�����б�/-->
				<tm-pagination conf="paginationConf"></tm-pagination>

			</div>
			<!-- ���ݱ�� /-->

		</div>
		<!-- /.box-body -->
      <div id="popLayer"></div>
     <div id="popBox">
       <div class="close">
        <a href="javascript:void(0)" onclick="closeBox()">��</a>
     </div>
    <div class="content">
    <form id="myform1" method="post">
    <div id="msg101" style="color:red">���뾺��</div>
    <div>
    <i class=""></i>
    <input type="number" id="aac303" name="aac303" placeholder="����۸�" required="required" >
    </div>
    <textarea id="aac304" rows="15" cols="48" name="aac304" placeholder="��д��������" required="required"></textarea>
    <input type="hidden" id="aac602" value="">
    <input class="btn bg-olive btn-xs" type="submit" onclick="joinRequire()" id="1314p"  value="���뾺��"></input>
    </form>
    </div>
    </div>
	</body>

	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<!-- ��ҳ�����ʼ -->
	<!--  
	<script src="<%=path%>/houtai/plugins/angularjs/pagination.js" charset="gbk"></script>
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
	/*���뾺��*/
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
				console.log("�ɹ�");
				if(res.status=='200'){
					alert("�ɹ����뾺��!");
					location.reload();
				}else{
					alert("�����쳣! error:No-9869");
					closeBox();
				}
			},
			error:function(res,status){
				console.log("ʧ��");
			}
		});
		return false;
	}
    /*���������ť*/
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
    					$("#aac602").val(re.aac302);   <%--�ȰѾ���id��������id��--%>
    					$("#1314p").attr("disabled",true);
    					if(re.aac305=='01'){
    						$("#msg101").text("������");
    					}else if(re.aac305=='02'){
    						$("#msg101").text("���ͻ�����");
    					}else if(re.aac305=='03'){
    						$("#msg101").text("���ͻ��ܾ�");
    					}
    					$("#popBox").css("display","block");
    			        $("#popLayer").css("display","block");
    				}else if(res.status=='201'){
    					alert("�����쳣  eror:No- 9869");
    				}
    			},
    			error:function(res,status){
    				alert("�����쳣");
    			}
    		});
    	}
       // document.getElementById("replyText").value = v;
    };
    
    /*����رհ�ť*/
    function closeBox() {
        var popBox = document.getElementById("popBox");
        var popLayer = document.getElementById("popLayer");
        popBox.style.display = "none";
        popLayer.style.display = "none";
    }
</script>

</html>