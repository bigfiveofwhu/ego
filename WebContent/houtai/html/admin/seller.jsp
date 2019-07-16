<%@ page pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <!-- ҳ��meta -->
    ����
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>�̼����</title>
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
        <h3 class="box-title">�̼ҹ���</h3>
    </div>

    <div class="box-body">

        <!-- ���ݱ�� -->
        <div class="table-box">

            <!--������-->
            <form action="queryShop.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        ״̬��
                        <select name="qaab107">
                            <option value="">ȫ��</option>
                            <option value="01">δ���</option>
                            <option value="02">���ͨ��</option>
                            <option value="03">���δͨ��</option>
                            <option value="04">�ر�</option>
                        </select>
                        �������ƣ� <input name="qaab103">
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
                    <th class="sorting">���</th>
                    <th class="sorting_asc">�̼�ID</th>
                    <th class="sorting">��������</th>
                    <th class="sorting">��ϵ������</th>
                    <th class="sorting">��ϵ�˵绰</th>
                    <th class="sorting">״̬</th>
                    <th class="text-center">����</th>
                </tr>
                </thead>
                <tbody>
                <!-- ��ʾ�鵽������ -->
                <c:forEach items="${shoplist}" var="ins" varStatus="vs">
                    <tr id="tr-${ins.aab102}">
                        <td>${vs.count}</td>
                        <td>${ins.aab102}</td>
                        <td>${ins.aab103}</td>
                        <td>${ins.aaa109}</td>
                        <td>${ins.aaa108}</td>
                        <td class="status">${ins.cnaab107}</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getShopDetail(${ins.aab102})">����
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

    <!-- �̼����� -->
    <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">��
                    </button>
                    <h3 id="myModalLabel">�̼�����</h3>
                </div>
                <div class="modal-body">

                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#shop" data-toggle="tab">������ϸ��Ϣ</a>
                        </li>
                        <li>
                            <a href="#shopper" data-toggle="tab">�û���ϸ��Ϣ</a>
                        </li>
                        <li>
                            <a href="#content" data-toggle="tab">�������</a>
                        </li>
                        <li>
                            <a href="#detail" data-toggle="tab">�������</a>
                        </li>
                    </ul>

                    <!-- ѡ���ʼ -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="shop">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>����id</td>
                                    <td id="aab102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��������</td>
                                    <td id="aab103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>���̵�ַ</td>
                                    <td id="aab105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��֤��Ϣ</td>
                                    <td id="aab106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>����״̬</td>
                                    <td id="aab107" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��֤��</td>
                                    <td id="aab108" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="shopper">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>�û�id</td>
                                    <td id="aaa102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�û���</td>
                                    <td id="aaa103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�û�����</td>
                                    <td id="aaa104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>ע������</td>
                                    <td id="aaa105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�û�����</td>
                                    <td id="aaa106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�ֻ�����</td>
                                    <td id="aaa108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��ʵ����</td>
                                    <td id="aaa109" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="content">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>�������</td>
                                    <td id="aad802" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="detail">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>�����ˮ��</td>
                                    <td id="aad801" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�����</td>
                                    <td id="aad102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>Ȩ�޼���</td>
                                    <td id="aad104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>���״̬</td>
                                    <td id="aad804" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>���ʱ��</td>
                                    <td id="aad806" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- ѡ����� -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="updateState('02')">
                        ���ͨ��
                    </button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('03')">
                        ���δͨ��
                    </button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="updateState('04')">
                        �ر��̼�
                    </button>
                    <button class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="clearDetails()">�ر�
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    function getShopDetail(id) {
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab102": id,
                "type": '1'
            },
            success: function (res) {
                var map = res.map;
                if (typeof (map) !== "undefined") {
                    $("#aab102").html(map.aab102);
                    $("#aab103").html(map.aab103);
                    $("#aab105").html(map.aab105);
                    $("#aab106").html(map.aab106);
                    $("#aab107").html(map.cnaab107);
                    $("#aab108").html(map.aab108);

                    $("#aaa102").html(map.aaa102);
                    $("#aaa103").html(map.aaa103);
                    $("#aaa104").html(map.aaa104);
                    $("#aaa105").html(map.aaa105);
                    $("#aaa106").html(map.aaa106);
                    $("#aaa108").html(map.aaa108);
                    $("#aaa109").html(map.aaa109);

                    $("#aad802").html(map.aad802);

                    $("#aad801").html(map.aad801);
                    $("#aad102").html(map.aad102);
                    $("#aad104").html(map.aad104);
                    $("#aad804").html(map.cnaad804);
                    $("#aad806").html(map.aad806);

                    console.log("��ȡ������ϸ��Ϣ�ɹ�")
                }
            },
            error: function () {
                console.log("������ϸ��Ϣ�첽���ش���");
            }
        });
    }

    function updateState(state) {
        var aab102 = $("#aab102").text();
        var val = '';
        switch (state) {
            case '02':
                val = '���ͨ��';
                break;
            case '03':
                val = '���δͨ��';
                break;
            case '04':
                val = '�ر�';
                break;
            default:
                val = 'δ���';
        }
        $.ajax({
            url: "<%=basePath%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab102": aab102,
                "aab107": state,
                "aad102": '7001',
                "aad801": $("#aad801").text(),
                "aad804": state,
                "type": '2'
            },
            success: function () {
                $('#tr-' + aab102).find('.status').html(val);
                alert('�����ɹ�')
            },
            error: function () {
                alert('����ʧ�ܣ�������')
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
<!-- ��ҳ��� -->
<script src="../../plugins/angularjs/pagination.js"></script>
<script type="text/javascript" src="../../js/base/Base_pagination.js"></script>
<script type="text/javascript" src="../../js/base/BaseService.js"></script>
<script type="text/javascript" src="../../js/base/BaseController.js"></script>
<script type="text/javascript" src="../../js/service/SellerService.js"></script>
<script type="text/javascript" src="../../js/controller/SellerController.js"></script>

</html>