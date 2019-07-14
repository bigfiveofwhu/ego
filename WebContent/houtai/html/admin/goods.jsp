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
    <title>商品管理</title>
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
        <h3 class="box-title">商品审核</h3>
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
                            <option value="01">未审核</option>
                            <option value="02">审核通过</option>
                            <option value="03">审核未通过</option>
                            <option value="04">已下架</option>
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
                    <th class="sorting">序号</th>
                    <th class="sorting_asc">商品ID</th>
                    <th class="sorting">商品名称</th>
                    <th class="sorting">商品价格</th>
                    <th class="sorting">一级分类</th>
                    <th class="sorting">二级分类</th>
                    <th class="sorting">三级分类</th>
                    <th class="sorting">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- 显示查到的数据 -->
                <c:forEach items="${goodslist}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.aab203}</td>
                        <td>${ins.aab202}</td>
                        <td>${ins.aab205}</td>
                        <td>${ins.aab204_1}</td>
                        <td>${ins.aab204_2}</td>
                        <td>${ins.aab204_3}</td>
                        <td>${ins.cnaab212}</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail(${ins.aab203})">详情
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
                            <a href="#shop" data-toggle="tab">店铺详细信息</a>
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
                                    <td>店铺状态</td>
                                    <td id="aab107" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>库存</td>
                                    <td id="aab206" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品描述</td>
                                    <td id="aab207" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>展示页面</td>
                                    <td id="aab208" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品规格</td>
                                    <td id="aab209" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>售后类型</td>
                                    <td id="aab211" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品状态</td>
                                    <td id="aab212" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="shop">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>店铺id</td>
                                    <td id="aab102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>店铺名称</td>
                                    <td id="aab103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>店铺信用积分</td>
                                    <td id="aab104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>店铺地址</td>
                                    <td id="aab105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>认证信息</td>
                                    <td id="aab106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>保证金</td>
                                    <td id="aab108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>物流评分</td>
                                    <td id="aab109" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>服务评分</td>
                                    <td id="aab110" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>商品评分</td>
                                    <td id="aab111" class="to_clear"></td>
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
                        下架
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
    function getGoodDetail(id) {
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab203": id,
                "type": '3'
            },
            success: function (res) {
                var map = res.map;
                if (typeof (map) !== "undefined") {
                    $("#aab202").html(map.aab202);
                    $("#aab203").html(map.aab203);
                    $("#aab204").html(map.cnaab204);
                    $("#aab205").html(map.aab205);
                    $("#aab206").html(map.aab206);
                    $("#aab207").html(map.aab207);
                    $("#aab208").html(map.aab208);
                    $("#aab209").html(map.aab209);
                    $("#aab211").html(map.aab211);
                    $("#aab212").html(map.cnaab212);

                    $("#aab102").html(map.aab102);
                    $("#aab103").html(map.aab103);
                    $("#aab104").html(map.aab104);
                    $("#aab105").html(map.aab105);
                    $("#aab106").html(map.aab106);
                    $("#aab108").html(map.aab108);
                    $("#aab109").html(map.aab109);
                    $("#aab110").html(map.aab110);
                    $("#aab111").html(map.aab111);

                    $("#aad802").html(map.aad802);

                    $("#aad801").html(map.aad801);
                    $("#aad102").html(map.aad102);
                    $("#aad104").html(map.aad104);
                    $("#aad804").html(map.cnaad804);
                    $("#aad806").html(map.aad806);

                    console.log("获取商品详细信息成功")
                }
            },
            error: function () {
                console.log("商品详细信息异步加载错误");
            }
        });
    }

    function updateState(state) {
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab203": $("#aab203").text(),
                "aab212": state,
                "aad102": '7001',
                "aad801": $("#aad801").text(),
                "aad804": state,
                "type": '4'
            },
            success: function () {
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