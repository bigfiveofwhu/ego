<%@ page pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    　　
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>服务审核</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../plugins/angularjs/pagination.css">
</head>

<body class="hold-transition skin-red sidebar-mini" ng-controller="SellerController">
<!-- .box-body -->
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">服务管理</h3>
    </div>

    <div class="box-body">

        <!-- 数据表格 -->
        <div class="table-box">

            <!--工具栏-->
            <form action="queryService.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        状态：
                        <select name="qaac208">
                            <option value="">全部</option>
                            <option value="01">未审核</option>
                            <option value="02">审核通过</option>
                            <option value="03">审核未通过</option>
                            <option value="04">关闭</option>
                        </select>
                        服务名称： <input name="qaac203">
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
                    <th class="sorting">序号</th>
                    <th class="sorting_asc">服务id</th>
                    <th class="sorting">服务名称</th>
                    <th class="sorting">服务类型</th>
                    <th class="sorting">服务方式</th>
                    <th class="sorting">服务描述</th>
                    <th class="sorting">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 显示查到的数据 -->
                <c:forEach items="${servicelist}" var="ins" varStatus="vs">
                    <tr id="tr-${ins.aac202}">
                        <td>${vs.count}</td>
                        <td>${ins.aac202}</td>
                        <td>${ins.aac203}</td>
                        <td>${ins.cnaac204}</td>
                        <td>${ins.cnaac205}</td>
                        <td>${ins.aac207}</td>
                        <td class="status">${ins.cnaac208}</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getServiceDetail(${ins.aac202})">详情
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

    <!-- 服务详情 -->
    <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">×
                    </button>
                    <h3 id="myModalLabel">服务详情</h3>
                </div>
                <div class="modal-body">

                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#service" data-toggle="tab">服务详细信息</a>
                        </li>
                        <li>
                            <a href="#serviceProvider" data-toggle="tab">服务商详细信息</a>
                        </li>
                        <li>
                            <a href="#content" data-toggle="tab">审核内容</a>
                        </li>
                        <li>
                            <a href="#detail" data-toggle="tab">审核详情</a>
                        </li>
                    </ul>

                    <!-- 选项卡开始 -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="service">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>服务id</td>
                                    <td id="aac202" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务名称</td>
                                    <td id="aac203" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务类型</td>
                                    <td id="aac204" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务方式</td>
                                    <td id="aac205" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务区间</td>
                                    <td id="aac206" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务描述</td>
                                    <td id="aac207" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>状态</td>
                                    <td id="aac208" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="serviceProvider">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>服务商id</td>
                                    <td id="aac102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务商名称</td>
                                    <td id="aac103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>地址</td>
                                    <td id="aac104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>城市</td>
                                    <td id="aac105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务类型</td>
                                    <td id="aac106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>认证信息</td>
                                    <td id="aac107" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>保证金</td>
                                    <td id="aac109" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务评分</td>
                                    <td id="aac110" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="content">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>审核内容</td>
                                    <td id="aad802" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="detail">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>审核流水号</td>
                                    <td id="aad801" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>审核人</td>
                                    <td id="aad102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>权限级别</td>
                                    <td id="aad104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>审核状态</td>
                                    <td id="aad804" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>审核时间</td>
                                    <td id="aad806" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 选项卡结束 -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="updateState('02')">
                        审核通过
                    </button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('03')">
                        审核未通过
                    </button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('04')">
                        下架服务
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="clearDetails()">关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    function getServiceDetail(id) {
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aac202": id,
                "type": '7'
            },
            success: function (res) {
                var map = res.map;
                if (typeof (map) !== "undefined") {
                    $("#aac202").html(map.aac202);
                    $("#aac203").html(map.aac203);
                    $("#aac204").html(map.cnaac204);
                    $("#aac205").html(map.cnaac205);
                    $("#aac206").html(map.aac206);
                    $("#aac207").html(map.aac207);
                    $("#aac208").html(map.cnaac208);

                    $("#aac102").html(map.aac102);
                    $("#aac103").html(map.aac103);
                    $("#aac104").html(map.aac104);
                    $("#aac105").html(map.aac105);
                    $("#aac106").html(map.cnaac106);
                    $("#aac107").html(map.aac107);
                    $("#aac109").html(map.aac109);
                    $("#aac110").html(map.aac110);

                    $("#aad802").html(map.aad802);

                    $("#aad801").html(map.aad801);
                    $("#aad102").html(map.aad102);
                    $("#aad104").html(map.aad104);
                    $("#aad804").html(map.cnaad804);
                    $("#aad806").html(map.aad806);

                    console.log("获取服务详细信息成功")
                }
            },
            error: function () {
                console.log("服务详细信息异步加载错误");
            }
        });
    }

    function updateState(state) {
        var aac202 = $("#aac202").text();
        var val = '';
        switch (state) {
            case '02':
                val = '审核通过';
                break;
            case '03':
                val = '审核未通过';
                break;
            case '04':
                val = '关闭';
                break;
            default:
                val = '未审核';
        }
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aac202": aac202,
                "aac208": state,
                "aad102": '7001',
                "aad801": $("#aad801").text(),
                "aad804": state,
                "type": '8'
            },
            success: function () {
                $('#tr-' + aac202).find('.status').html(val);
                alert('操作成功')
            },
            error: function () {
                alert('操作失败，请重试')
            }
        });
        clearDetails();
    }

    function clearDetails() {
        $(".to_clear").html("");
    }
</script>

<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../plugins/angularjs/angular.min.js"></script>
<!-- 分页组件 -->
<script src="../../plugins/angularjs/pagination.js"></script>
<script type="text/javascript" src="../../js/base/Base_pagination.js"></script>
<script type="text/javascript" src="../../js/base/BaseService.js"></script>
<script type="text/javascript" src="../../js/base/BaseController.js"></script>
<script type="text/javascript" src="../../js/service/SellerService.js"></script>
<script type="text/javascript" src="../../js/controller/SellerController.js"></script>

</html>