<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="UTF-8">
    <title>流水报表</title>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>月度流水</li>
        <li>年度流水</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div id="container-1" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
        </div>
        <div class="layui-tab-item">
            <div id="container-2" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
        </div>
    </div>
</div>

<script src="/ego/layui/layui.js"></script>
<script src="highcharts.js"></script>
<script src="exporting.js"></script>
<script src="export-data.js"></script>
<script type="text/javascript">
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
                text: '元',
                rotation: 0
            }
        },
    });

    Highcharts.chart('container-1', {
        title: {
            text: '月度消费流水'
        },
        // subtitle:{
        //     text:'上个月汇总：800 这个月汇总:900'
        // },
        xAxis: {
            tickInterval: 2,
            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
        },
        series: [${monthly}]
    });

    Highcharts.chart('container-2', {
        title: {
            text: '年度消费流水'
        },
        // subtitle:{
        //     text:'去年汇总：800 今年汇总:900'
        // },
        xAxis: {
            categories: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        },
        series: [${yearly}]
    });
</script>
</body>
</html>