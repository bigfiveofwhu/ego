<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>�û���ˮ����</title>
</head>
<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>��ˮ����</li>
        <li>�������Ѽ�¼</li>
        <li>�¶���ˮ</li>
        <li>�����ˮ</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <label>�¶���Ʒ���ѣ�${map.shopSumMonth}</label><br>
            <label>�¶ȷ������ѣ�${map.serviceSumMonth}</label><br>
            <label>�¶������ѣ�${map.sumMonth}</label><br><br>
            <label>�����Ʒ���ѣ�${map.shopSumYear}</label><br>
            <label>��ȷ������ѣ�${map.serviceSumYear}</label><br>
            <label>��������ѣ�${map.sumYear}</label><br><br>
            <label>������Ʒ���ѣ�${map.shopSumAll}</label><br>
            <label>���ķ������ѣ�${map.serviceSumAll}</label><br>
            <label>���������ѣ�${map.sumAll}</label><br>
        </div>
        <div class="layui-tab-item">
            <table lay-filter="user-table">
                <thead>
                <tr>
                    <th lay-data="{field:'id', sort: true}">���</th>
                    <th lay-data="{field:'time', sort: true}">����ʱ��</th>
                    <th lay-data="{field:'sum', sort: true}">���׽��</th>
                    <th lay-data="{field:'type', sort: true}">��������</th>
                    <th lay-data="{field:'name', sort: true}">���׶���</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userMonthlyReportDetail}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.time}</td>
                        <td>${ins.sum}</td>
                        <td>${ins.type}</td>
                        <td>${ins.name}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="layui-btn" id="export">
                <i class="iconfont icon-export"></i> ����
            </button>
        </div>
        <div class="layui-tab-item">
            <div id="container-1" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-2" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
    </div>
</div>

<script src="/ego/js/jquery-3.2.0.min.js"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
<script src="../js/highcharts.js"></script>
<script src="../js/exporting.js"></script>
<script src="../js/export-data.js"></script>
<script>
    layui.use('table', function () {
        var exportData;
        var table = layui.table;
        table.init('user-table', {
            id: 'user-table',
            done: function (res) {
                exportData = res.data;
            }
        });

        $("#export").click(function () {
            table.exportFile('user-table', exportData, 'xls');
        })
    });

    layui.use('element', function () {
        //Tab���л����ܣ��л��¼������ȣ���Ҫ����elementģ��
        var $ = layui.jquery, element = layui.element;
    });

    Highcharts.setOptions({
        lang: {
            contextButtonTitle: "ͼ�����˵�",
            decimalPoint: ".",
            downloadJPEG: "����JPEGͼƬ",
            downloadPDF: "����PDF�ļ�",
            downloadPNG: "����PNG�ļ�",
            downloadSVG: "����SVG�ļ�",
            drillUpText: "���� {series.name}",
            loading: "������",
            months: ["һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"],
            noData: "û������",
            numericSymbols: ["ǧ", "��", "G", "T", "P", "E"],
            printChart: "��ӡͼ��",
            resetZoom: "�ָ�����",
            resetZoomTitle: "�ָ�ͼ��",
            shortMonths: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            thousandsSep: ",",
            weekdays: ["����һ", "���ڶ�", "������", "������", "������", "������", "������"]
        },
        chart: {
            type: 'line'
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: true
            }
        },
        yAxis: {
            title: {
                text: '',
                rotation: 0
            }
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'middle',
            navigation: {
                activeColor: '#3E576F',
                animation: true,
                arrowSize: 15,
                inactiveColor: '#CCC',
                style: {
                    fontWeight: 'bold',
                    color: '#333',
                    fontSize: '12px'
                }
            }
        },
    });

    Highcharts.chart('container-1', {
        title: {
            text: '�¶�������ˮ'
        },
        xAxis: {
            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
        },
        series: [${monthly}]
    });

    Highcharts.chart('container-2', {
        title: {
            text: '���������ˮ'
        },
        xAxis: {
            categories: ["һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"]
        },
        series: [${yearly}]
    });
</script>

</body>
</html>