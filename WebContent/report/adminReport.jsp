<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>平台流水报表</title>
</head>
<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>平台每月销售量</li>
        <li>平台每月销售额</li>
        <li>商品销售量排行</li>
        <li>商品销售额排行</li>
        <li>平台每月点击量</li>
        <li>月度流水</li>
        <li>年度流水</li>
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
            type: 'line',
            events: {
                beforePrint: function () {
                    var height = this.options.exporting.chartOptions.chart.height;
                    if (height) {
                        this.oldhasUserSize = this.hasUserSize;
                        this.resetParams = [this.chartWidth, this.chartHeight, false];
                        this.setSize(this.chartWidth, height, false);
                    }
                },
                afterPrint: function () {
                    if (this.options.exporting.chartOptions.chart.height) {
                        this.setSize.apply(this, this.resetParams);
                        this.hasUserSize = this.oldhasUserSize;
                    }
                }
            }
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
            maxHeight: 400,
            labelFormatter: function () {
                return (this.name + '(点击)').replace(/(.{15})/g, '$1<br>');
            },
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

    var year_12 = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
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
            categories: year_12
        },
        series: [${yearly}]
    });

    Highcharts.chart('container-3', {
        title: {
            text: '平台每月销售量'
        },
        xAxis: {
            categories: year_12
        },
        series: [${shopCount}${serviceCount}${allCount}]
    });

    Highcharts.chart('container-4', {
        title: {
            text: '平台每月销售额'
        },
        xAxis: {
            categories: year_12
        },
        series: [${shopSum}${serviceSum}${allSum}]
    });

    Highcharts.chart('container-5', {
        title: {
            text: '商品销售量排行'
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
            text: '商品销售额排行'
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
            text: '平台点击量'
        },
        xAxis: {
            categories: year_12
        },
        series: [${clickCount}]
    });
</script>

</body>
</html>