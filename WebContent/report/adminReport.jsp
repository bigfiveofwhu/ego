<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>ƽ̨��ˮ����</title>
</head>
<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>ƽ̨ÿ��������</li>
        <li>ƽ̨ÿ�����۶�</li>
        <li>��Ʒ����������</li>
        <li>��Ʒ���۶�����</li>
        <li>ƽ̨ÿ�µ����</li>
        <li>�¶���ˮ</li>
        <li>�����ˮ</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div id="container-3" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-4" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-5" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-6" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-7" style="min-width: 800px; min-height: 600px; margin: 0 auto"></div>
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

    var year_12 = ["һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"];
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
            categories: year_12
        },
        series: [${yearly}]
    });

    Highcharts.chart('container-3', {
        title: {
            text: 'ƽ̨ÿ��������'
        },
        xAxis: {
            categories: year_12
        },
        series: [${shopCount}${serviceCount}${allCount}]
    });

    Highcharts.chart('container-4', {
        title: {
            text: 'ƽ̨ÿ�����۶�'
        },
        xAxis: {
            categories: year_12
        },
        series: [${shopSum}${serviceSum}${allSum}]
    });

    Highcharts.chart('container-5', {
        title: {
            text: '��Ʒ����������'
        },
        chart: {
            type: 'column'
        },
        xAxis: {
            categories: [${count_x}]
        },
        series: [${count}]
    });

    Highcharts.chart('container-6', {
        title: {
            text: '��Ʒ���۶�����'
        },
        chart: {
            type: 'column'
        },
        xAxis: {
            categories: [${sum_x}]
        },
        series: [${sum}]
    });

    Highcharts.chart('container-7', {
        title: {
            text: '��Ʒ���۶�����'
        },
        xAxis: {
            categories: year_12
        },
        series: [${clickCount}]
    });
</script>

</body>
</html>