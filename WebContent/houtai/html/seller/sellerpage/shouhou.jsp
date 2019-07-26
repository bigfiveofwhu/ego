<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�ۺ����</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
		<script type="text/javascript" src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="GoodsController" ng-init="findItemCatList()">
		<!-- .box-body -->

		<div class="box-header with-border">
			<h3 class="box-title">�ۺ����</h3>
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
				<form action="<%=path %>/shop/queryShouhou.html" method="post">
				<div class="box-tools pull-right">
					<div class="has-feedback">
						״̬��
						<select  name="qaaa803">
							<option value="">ȫ��</option>
							<option value="01">δ����</option>
							<option value="03">��ͬ��</option>
							<option value="04">�Ѿܾ�</option>
						</select>
						 ��Ʒ:
						<input type="text" name="qaab202" value=""/>
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
							<th class="sorting">�ۺ�id</th>
							<th class="sorting">��Ʒid</th>
							<th class="sorting">��Ʒ����</th>
							<th class="sorting">�ύ�û�</th>
							<th class="sorting">�ۺ�����</th>
							<th class="sorting">�ۺ�����</th>
							<th class="sorting">״̬</th> 
							<th class="text-center">����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${afterbuyList}" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ins.aaa802}</td>
							<td>${ins.aab203}</td>
							<td>${ins.aab202}</td>
							<td>${ins.aaa103}</td>
							<td>${ins.aaa805}</td>
							<td>${ins.cnaaa804}</td>
							<td>${ins.cnaaa803}</td>
						<td class="text-center">
						   <c:if test="${ins.cnaaa803 == 'δ����' }">
					    	<button type="button" name="popBox" class="btn bg-olive btn-xs" onclick="popBox('${ins.aaa802}','${ins.aab302}')">����</button>
					        </c:if>
					        
					        <c:if test="${ins.cnaaa803 == '��ͬ��' }">
			         		<button type="button" name="popBox" class="btn bg-olive btn-xs" disabled>�Ѵ���</button>
			         		</c:if>
			         		
			         		  <c:if test="${ins.cnaaa803 == '�Ѿܾ�' }">
			         		<button type="button" name="popBox" class="btn bg-olive btn-xs" disabled>�Ѵ���</button>
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
	<script src="/ego/layui/layui.js"></script>
	<script>
	layui.use('layer', function(){
		layer = layui.layer;
	});
	
	function popBox(id1,id2)
	 {
		layer.confirm('ȷ��ͬ���ۺ�������?', { btn: ['��','��'],title: "�����ۺ�", btn1:function(){
	        $.ajax({
	                  url:"${path}/dealAfterBuy.ajax",
	                  type:"post",
	              	  timeout:20000,
	                  dataType:"json",
	                  data:{
	                	  "aaa802":id1,
	                	  "aab302":id2,
	                	  "type":"agree"
	                	  },
	                  success:function (res,status) {
	                	  if(res.tag == 1)
	                	{
	                      layer.msg("����ͬ���ۺ�����");
	                      setTimeout("location.reload()",1000);
	                      //location.reload();
	                	}
	                  },
	                  error:function(res,status){
	                	  console.log("ʧ��");
	                  }
	                  
	                });
	        },
	        btn2:function(){
	        	 $.ajax({
	                  url:"${path}/dealAfterBuy.ajax",
	                  type: "post",
	              	  timeout:20000,
	                  dataType:"json",
	                  data:{
	                	  "aaa802":id1,
	                	  "aab302":id2,
	                	  "type":"disagree"
	                	  },
	                  success:function (res,status) {
	                	  {
		                      layer.msg("���Ѿܾ��ۺ�����");
		                      setTimeout("location.reload()",1000);
		                     // location.reload();
		                }
	                  },
                      error:function(res,status){
	                	  console.log("ʧ��");
	                  }
	                  
	                });
	        }
	    })
	}
</script>

</html>