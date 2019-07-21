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
</head>

<body class="hold-transition skin-red sidebar-mini" ng-controller="SellerController">
<!-- .box-body -->
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">��Ʒ���</h3>
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
                            <option value="01">δ���</option>
                            <option value="02">���ͨ��</option>
                            <option value="03">���δͨ��</option>
                            <option value="04">���¼�</option>
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
                    <th class="sorting">���</th>
                    <th class="sorting_asc">��ƷID</th>
                    <th class="sorting">��Ʒ����</th>
                    <th class="sorting">��Ʒ�۸�</th>
                    <th class="sorting">����</th>
                    <th class="sorting">״̬</th>
                    <th class="text-center">����</th>
                </tr>
                </thead>
                <tbody>
                <!-- ��ʾ�鵽������ -->
                <c:forEach items="${goodslist}" var="ins" varStatus="vs">
                    <tr id="tr-${ins.aab203}">
                        <td>${vs.count}</td>
                        <td>${ins.aab203}</td>
                        <td>${ins.aab202}</td>
                        <td>${ins.aab205}</td>
                        <td>${ins.aab204}</td>
                        <td class="status">${ins.cnaab212}</td>
                        <td class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                    data-target="#sellerModal" onclick="getGoodDetail(${ins.aab203})">����
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

    <!-- ��Ʒ���� -->
    <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">��
                    </button>
                    <h3 id="myModalLabel">��Ʒ����</h3>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#goods" data-toggle="tab">��Ʒ��ϸ��Ϣ</a>
                        </li>
                        <li>
                            <a href="#shop" data-toggle="tab">������ϸ��Ϣ</a>
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
                                    <td>��Ʒ�۸�</td>
                                    <td id="aab205" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>����״̬</td>
                                    <td id="aab107" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>���</td>
                                    <td id="aab206" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ����</td>
                                    <td id="aab207" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>չʾҳ��</td>
                                    <td id="aab208" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ���</td>
                                    <td id="aab209" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�ۺ�����</td>
                                    <td id="aab211" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ״̬</td>
                                    <td id="aab212" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="shop">
                            <br>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <td>����id</td>
                                    <td id="aab102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��������</td>
                                    <td id="aab103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>�������û���</td>
                                    <td id="aab104" class="to_clear"></td>
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
                                    <td>��֤��</td>
                                    <td id="aab108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��������</td>
                                    <td id="aab109" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��������</td>
                                    <td id="aab110" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��Ʒ����</td>
                                    <td id="aab111" class="to_clear"></td>
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
                        �¼�
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
    function getGoodDetail(id) {
        $.ajax({
            url: "<%=path%>/adminReview.ajax",
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

                    console.log("��ȡ��Ʒ��ϸ��Ϣ�ɹ�")
                }
            },
            error: function () {
                console.log("��Ʒ��ϸ��Ϣ�첽���ش���");
            }
        });
    }

    function updateState(state) {
        var aab203 = $("#aab203").text();
        var val = '';
        switch (state) {
            case '02':
                val = '���ͨ��';
                break;
            case '03':
                val = '���δͨ��';
                break;
            case '04':
                val = '���¼�';
                break;
            default:
                val = 'δ���';
        }
        $.ajax({
            url: "<%=path%>/adminReview.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aab203": aab203,
                "aab212": state,
                "aad102": '7001',
                "aad801": $("#aad801").text(),
                "aad804": state,
                "type": '4'
            },
            success: function () {
                $('#tr-' + aab203).find('.status').html(val);
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

</html>