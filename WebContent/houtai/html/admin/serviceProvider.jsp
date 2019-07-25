<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <!-- ҳ��meta -->
    ����
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>���������</title>
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
        <h3 class="box-title">�����̹���</h3>
    </div>

    <div class="box-body">

        <!-- ���ݱ�� -->
        <div class="table-box">

            <!--������-->
            <form action="queryServiceProvider.html" method="post">
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        ״̬��
                        <select name="qaac108">
                            <option value="">ȫ��</option>
                            <option value="01">δ���</option>
                            <option value="02">���ͨ��</option>
                            <option value="03">���δͨ��</option>
                            <option value="04">�ر�</option>
                        </select>
                        ���������ƣ� <input name="qaac103">
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
                    <th class="sorting_asc">������ID</th>
                    <th class="sorting">����������</th>
                    <th class="sorting">��������</th>
                    <th class="sorting">��ϵ������</th>
                    <th class="sorting">��ϵ�˵绰</th>
                    <th class="sorting">״̬</th>
                    <th class="text-center">����</th>
                </tr>
                </thead>
                <tbody>
                <!-- ��ʾ�鵽������ -->
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
                                    data-target="#sellerModal" onclick="getServiceProviderDetail(${ins.aac102})">����
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

    <!-- ���������� -->
    <div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            onclick="clearDetails()">��
                    </button>
                    <h3 id="myModalLabel">����������</h3>
                </div>
                <div class="modal-body">

                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#serviceProvider" data-toggle="tab">��������ϸ��Ϣ</a>
                        </li>
                        <li>
                            <a href="#user" data-toggle="tab">�û���ϸ��Ϣ</a>
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
                        <div class="tab-pane active in" id="serviceProvider">
                            <br>
                            <table class="table table-bordered table-striped" width="800px">
                                <tr>
                                    <td>������id</td>
                                    <td id="aac102" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>����������</td>
                                    <td id="aac103" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��ַ</td>
                                    <td id="aac104" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>����</td>
                                    <td id="aac105" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��������</td>
                                    <td id="aac106" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��֤��Ϣ</td>
                                    <td id="aac107" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>������״̬</td>
                                    <td id="aac108" class="to_clear"></td>
                                </tr>
                                <tr>
                                    <td>��֤��</td>
                                    <td id="aac109" class="to_clear"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="user">
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
                        �رշ�����
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

                    console.log("��ȡ��������ϸ��Ϣ�ɹ�")
                }
            },
            error: function () {
                console.log("��������ϸ��Ϣ�첽���ش���");
            }
        });
    }

    function updateState(state) {
        var aac102 = $("#aac102").text();
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
                alert('����ʧ�ܣ�������')
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
<!-- ��ҳ��� -->
<script src="<%=path%>/houtai/plugins/angularjs/pagination.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/Base_pagination.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/service/SellerService.js"></script>
<script type="text/javascript" src="<%=path%>/houtai/js/controller/SellerController.js"></script>

</html>