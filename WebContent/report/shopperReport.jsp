<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>商铺流水报表</title>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li>流水总览</li>
        <li>本月销售记录</li>
        <li>月度各商品销售量</li>
        <li>月度各商品销售额</li>
        <li>年度总销售量</li>
        <li>年度总销售额</li>
        <li>月度各商品点击量、销售量、销售额</li>
        <li>月度流水</li>
        <li>年度流水</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <label>月度商品收入：${map.shopSumMonth}</label><br><br>
            <label>年度商品收入：${map.shopSumYear}</label><br><br>
            <label>生涯商品收入：${map.shopSumAll}</label><br><br>
        </div>
        <div class="layui-tab-item">
            <table lay-filter="shop-table">
                <thead>
                <tr>
                    <th lay-data="{field:'id', sort: true}">序号</th>
                    <th lay-data="{field:'time', sort: true}">交易时间</th>
                    <th lay-data="{field:'name', sort: true}">交易商品名称</th>
                    <th lay-data="{field:'sum', sort: true}">交易金额</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${shopMonthlyReportDetail}" var="ins" varStatus="vs">
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
            <table lay-filter="shop-table2">
                <thead>
                <tr>
                    <th lay-data="{field:'id', sort: true}">序号</th>
                    <th lay-data="{field:'name', sort: true}">商品名</th>
                    <th lay-data="{field:'views', sort: true}">点击量</th>
                    <th lay-data="{field:'count', sort: true}">销售量</th>
                    <th lay-data="{field:'sum', sort: true}">销售额</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${shopMonthlyReportDetailForGoods}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.name}</td>
                        <td>${ins.views}</td>
                        <td>${ins.count}</td>
                        <td>${ins.sum}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="layui-btn" id="export2">
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
        var exportData2;
        var table = layui.table;
        table.init('shop-table', {
            page: true,
            id: 'shop-table',
            done: function (res) {
                exportData = res.data;
            }
        });

        table.init('shop-table2', {
            page: true,
            id: 'shop-table2',
            done: function (res) {
                exportData2 = res.data;
            }
        });

        $("#export").click(function () {
            table.exportFile('shop-table', exportData, 'xls');
        });

        $("#export2").click(function () {
            table.exportFile('shop-table2', exportData2, 'xls');
        })
    });

    layui.use('element', function () {
        //Tab的切换功能，切换事件监听等，需要依赖element模块
        var $ = layui.jquery, element = layui.element;
    });

    var month_31 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
    var year_12 = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
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

    Highcharts.chart('container-1', {
        title: {
            text: '月度消费流水'
        },
        xAxis: {
            categories: month_31
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
            text: '月度各商品销售量'
        },
        chart: {
            type: 'column'
        },
        xAxis: {
            categories: month_31
        },
        series: [${monthlyCount}]
    });

    Highcharts.chart('container-4', {
        title: {
            text: '月度各商品销售额'
        },
        chart: {
            type: 'column'
        },
        xAxis: {
            categories: month_31
        },
        series: [${monthlySum}]
    });

    Highcharts.chart('container-5', {
        title: {
            text: '年度总销售量'
        },
        xAxis: {
            categories: year_12
        },
        series: [${yearlyCount}]
    });

    Highcharts.chart('container-6', {
        title: {
            text: '年度总销售额'
        },
        xAxis: {
            categories: year_12
        },
        series: [${yearlySum}]
    });
</script>

</body>
</html>