<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    　　
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>服务商审核</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
    <link rel="stylesheet" href="<%=path%>/houtai/plugins/angularjs/pagination.css">
</head>

<body class="hold-transition skin-red sidebar-mini" ng-controller="SellerController">
<!-- .box-body -->
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">服务商管理</h3>
    </div>

    <div class="box-body">

        <!-- 数据表格 -->
        <div class="table-box">

            <!--工具栏-->
            <form action="queryServiceProvider.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        状态：
                        <select name="qaac108">
                            <option value="">全部</option>
                            <option value="01">未审核</option>
                            <option value="02">审核通过</option>
                            <option value="03">审核未通过</option>
                            <option value="04">关闭</option>
                        </select>
                        服务商名称： <input name="qaac103">
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
                    <th class="sorting_asc">服务商ID</th>
                    <th class="sorting">服务商名称</th>
                    <th class="sorting">服务类型</th>
                    <th class="sorting">联系人姓名</th>
                    <th class="sorting">联系人电话</th>
                    <th class="sorting">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 显示查到的数据 -->
                <c:forEach items="${serviceProviderlist}" var="ins" varStatus="vs">
                    <tr id="tr-${ins.aac102}">
                        <td>${vs.count}</td>
                        <td>${ins.aac102}</td>
                        <td>${ins.aac103}</td>
                        <td>${ins.cnaac106}</td>
                        <td>${ins.aaa109}</td>
                        <td>${ins.aaa108}</td>
                        <td class="status">${ins.cnaac108}</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getServiceProviderDetail(${ins.aac102})">详情
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

    <!-- 服务商详情 -->
    <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">×
                    </button>
                    <h3 id="myModalLabel">服务商详情</h3>
                </div>
                <div class="modal-body">

                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#serviceProvider" data-toggle="tab">服务商详细信息</a>
                        </li>
                        <li>
                            <a href="#user" data-toggle="tab">用户详细信息</a>
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
                        <div class="tab-pane active in" id="serviceProvider">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
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
                                    <td>服务商状态</td>
                                    <td id="aac108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>保证金</td>
                                    <td id="aac109" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="user">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>用户id</td>
                                    <td id="aaa102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>用户名</td>
                                    <td id="aaa103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>用户邮箱</td>
                                    <td id="aaa104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>注册日期</td>
                                    <td id="aaa105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>用户积分</td>
                                    <td id="aaa106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>手机号码</td>
                                    <td id="aaa108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>真实姓名</td>
                                    <td id="aaa109" class="to_clear"></td>
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
                        关闭服务商
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
    function getServiceProviderDetail(id) {
        clearDetails();
        $.ajax({
            url: "<%=path%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aac102": id,
                "type": '5'
            },
            success: function (res) {
                var map = res.map;
                if (typeof (map) !== "undefined") {
                    $("#aac102").text(map.aac102);
                    $("#aac103").text(map.aac103);
                    $("#aac104").text(map.aac104);
                    $("#aac105").text(map.cnaac105);
                    $("#aac106").text(map.cnaac106);
                    $("#aac107").text(map.aac107);
                    $("#aac108").text(map.cnaac108);
                    $("#aac109").text(map.aac109);

                    $("#aaa102").text(map.aaa102);
                    $("#aaa103").text(map.aaa103);
                    $("#aaa104").text(map.aaa104);
                    $("#aaa105").text(map.aaa105);
                    $("#aaa106").text(map.aaa106);
                    $("#aaa108").text(map.aaa108);
                    $("#aaa109").text(map.aaa109);

                    $("#aad802").text(map.aad802);

                    $("#aad801").text(map.aad801);
                    $("#aad102").text(map.aad102);
                    $("#aad104").text(map.aad104);
                    $("#aad804").text(map.cnaad804);
                    $("#aad806").text(map.aad806);

                    console.log("获取服务商详细信息成功")
                }
            },
            error: function () {
                console.log("服务商详细信息异步加载错误");
            }
        });
    }

    function updateState(state) {
        var aac102 = $("#aac102").text();
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
            url: "<%=path%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aac102": aac102,
                "aac108": state,
                "aad801": $("#aad801").text(),
                "aad804": state,
                "type": '6',
                "aaa102": $("#aaa102").text(),
                "aaa103": $("#aaa103").text(),
                "aac103": $("#aac103").text(),
                "val": val
            },
            success: function (res) {
                $('#tr-' + aac102).find('.status').text(val);
                alert(res.msg);
            },
            error: function () {
                alert('操作失败，请重试')
            }
        });
        clearDetails();
    }

    function clearDetails() {
        var to_clear = $('.to_clear');
        to_clear.text('');
        to_clear.html('');
    }
</script>

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

</html>