<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>服务商流水报表</title>
</head>
<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>流水总览</li>
        <li>本月销售记录</li>
        <li>月度流水</li>
        <li>年度流水</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <label>月度服务收入：${map.serviceSumMonth}</label><br><br>
            <label>年度服务收入：${map.serviceSumYear}</label><br><br>
            <label>生涯服务收入：${map.serviceSumAll}</label><br><br>
        </div>
        <div class="layui-tab-item">
            <table lay-filter="service-table">
                <thead>
                <tr>
                    <th lay-data="{field:'id', sort: true}">序号</th>
                    <th lay-data="{field:'time', sort: true}">交易时间</th>
                    <th lay-data="{field:'name', sort: true}">交易服务名称</th>
                    <th lay-data="{field:'sum', sort: true}">交易金额</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${serviceMonthlyDetail}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.time}</td>
                        <td>${ins.name}</td>
                        <td>${ins.sum}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="layui-btn" id="export">
                <i class="iconfont icon-export"></i> 导出
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
        table.init('service-table', {
            id: 'service-table',
            done: function (res) {
                exportData = res.data;
            }
        });

        $("#export").click(function () {
            table.exportFile('service-table', exportData, 'xls');
        })
    });

    layui.use('element', function () {
        //Tab的切换功能，切换事件监听等，需要依赖element模块
        var $ = layui.jquery, element = layui.element;
    });

    Highcharts.setOptions({
        lang: {
            contextButtonTitle: "图表导出菜单",
            decimalPoint: ".",
            downloadJPEG: "下载JPEG图片",
            downloadPDF: "下载PDF文件",
            downloadPNG: "下载PNG文件",
            downloadSVG: "下载SVG文件",
            drillUpText: "返回 {series.name}",
            loading: "加载中",
            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            noData: "没有数据",
            numericSymbols: ["千", "兆", "G", "T", "P", "E"],
            printChart: "打印图表",
            resetZoom: "恢复缩放",
            resetZoomTitle: "恢复图表",
            shortMonths: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            thousandsSep: ",",
            weekdays: ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期天"]
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
            text: '月度消费流水'
        },
        xAxis: {
            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
        },
        series: [${monthly}]
    });

    Highcharts.chart('container-2', {
        title: {
            text: '年度消费流水'
        },
        xAxis: {
            categories: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        },
        series: [${yearly}]
    });
</script>

</body>
</html>