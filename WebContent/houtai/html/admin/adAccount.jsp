<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <!-- ҳ��meta -->
    ����
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>��Ʒ����</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
</head>

<body class="hold-transition skin-red sidebar-mini" ng-controller="SellerController">
<!-- .box-body -->
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">����˻����</h3>
    </div>

    <div class="box-body">
        <!-- ���ݱ�� -->
        <div class="table-box">

            <!--������-->
            <form action="queryGood.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        ״̬��
                        <select name="qaab212">
                            <option value="">ȫ��</option>
                        </select>
                        ��Ʒ���ƣ� <input name="qaab202">
                        <input type="submit" class="btn btn-default" value="��ѯ"/>
                    </div>
                </div>
            </form>
            <!--������/-->

            <!--�����б�-->
            <table id="dataList" class="table table-bordered table-striped table-hover dataTable"
                   style="margin-left:10px">
                <thead>
                <tr>
                    <th class="sorting"></th>
                    <th class="sorting_asc">�û���</th>
                    <th class="sorting">��ʵ����</th>
                    <th class="sorting">���֤��</th>
                    <th class="sorting">�����˻�</th>
                    <th class="sorting">�绰����</th>
                    <th class="text-center">����</th>
                </tr>
                </thead>
                <tbody>
                <!-- ��ʾ�鵽������ -->
                <c:forEach items="${applications}" var="ins" varStatus="vs">
                    <tr id="${ins.aad801 }">
                        <td>${vs.count}</td>
                        <td>${ins.aaa103}</td>
                        <td>${ins.realName}</td>
                        <td>${ins.identity}</td>
                        <td>${ins.bankAccount}</td>
                        <td>${ins.phoneNumber}</td>
                        <td id="status-${ins.aad801}">�����</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="sendYes(${ins.aad801},${ins.aaa102 })">
                                    	ͨ��
                            </button>
                            <button type="button" class="btn bg-black btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="sendNo(${ins.aad801})">
                                    	���
                            </button>
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
<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
<!-- ��ҳ��� -->
<script src="<%=path%>/houtai/plugins/angularjs/pagination.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/Base_pagination.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/service/SellerService.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/controller/SellerController.js"></script>

<script src="/ego/layui/layui.js"></script>
<script>

layui.use('layer',function(){
});

function sendYes(sequence,userId){
	var a=$(this);
	
	
	 $.getJSON("AgreeAdAccount.ajax",
		{yesOrNo:'yes',aaa102:userId,aad801:sequence},
		function(result){
			if(result.result==true){
				layer.msg('ͨ���ɹ�');
				$("#status-"+sequence).html("���ͨ��")
			}else {
				layer.mag('δ֪����')
			}
	 	}
	 ).fail(function(){
		 layer.mag('�������ͨ��ʧ��')
	 })
}
 
function sendNo(sequence){
	$.getJSON("AgreeAdAccount.ajax",
			{yesOrNo:'no',aad801:sequence},
			function(result){
				if(result.result==true){
					layer.msg('����ɹ�');
					$("#status-"+sequence).html("�ѷ��")
				}else {
					layer.mag('δ֪����')
				}
		 	}
		 )
}
</script>

</html>