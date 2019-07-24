<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    　　
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品管理</title>
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
        <h3 class="box-title">广告账户审核</h3>
    </div>

    <div class="box-body">
        <!-- 数据表格 -->
        <div class="table-box">

            <!--工具栏-->
            <form action="queryGood.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        状态：
                        <select name="qaab212">
                            <option value="">全部</option>
                        </select>
                        商品名称： <input name="qaab202">
                        <input type="submit" class="btn btn-default" value="查询"/>
                    </div>
                </div>
            </form>
            <!--工具栏/-->

            <!--数据列表-->
            <table id="dataList" class="table table-bordered table-striped table-hover dataTable"
                   style="margin-left:10px">
                <thead>
                <tr>
                    <th class="sorting"></th>
                    <th class="sorting_asc">用户名</th>
                    <th class="sorting">真实姓名</th>
                    <th class="sorting">身份证号</th>
                    <th class="sorting">银行账户</th>
                    <th class="sorting">电话号码</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 显示查到的数据 -->
                <c:forEach items="${applications}" var="ins" varStatus="vs">
                    <tr id="${ins.aad801 }">
                        <td>${vs.count}</td>
                        <td>${ins.aaa103}</td>
                        <td>${ins.realName}</td>
                        <td>${ins.identity}</td>
                        <td>${ins.bankAccount}</td>
                        <td>${ins.phoneNumber}</td>
                        <td id="status-${ins.aad801}">待审核</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="sendYes(${ins.aad801},${ins.aaa102 })">
                                    	通过
                            </button>
                            <button type="button" class="btn bg-black btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="sendNo(${ins.aad801})">
                                    	否决
                            </button>
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
</div>
</body>


<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
<!-- 分页组件 -->
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
				layer.msg('通过成功');
				$("#status-"+sequence).html("审核通过")
			}else {
				layer.mag('未知错误')
			}
	 	}
	 ).fail(function(){
		 layer.mag('与服务器通信失败')
	 })
}
 
function sendNo(sequence){
	$.getJSON("AgreeAdAccount.ajax",
			{yesOrNo:'no',aad801:sequence},
			function(result){
				if(result.result==true){
					layer.msg('否决成功');
					$("#status-"+sequence).html("已否决")
				}else {
					layer.mag('未知错误')
				}
		 	}
		 )
}
</script>

</html>