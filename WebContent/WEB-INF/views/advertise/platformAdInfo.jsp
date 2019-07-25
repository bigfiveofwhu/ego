<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<link rel="stylesheet" href="/ego/layui/css/layui.css">
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- insert your code-->

<div id="container-1" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
<div id="container-2" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
<script src="/ego/js/highcharts.js"></script>
<script src="/ego/js/exporting.js"></script>
<script src="/ego/js/export-data.js"></script>
<!-- insert your javascript here-->
<script>
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
	chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
	},
	title: {
			text: '广告投资统计'
	},
	tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
			pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
							enabled: false
					},
					showInLegend: true
			}
	},
	series: [{
			name: 'Brands',
			colorByPoint: true,
			data: [
				<c:forEach items="${founds}" var="item" varStatus="index">
				{
					name: "${item.type}",
					y: ${item.total},
					<c:if test="${index.count==1}">
					sliced: true,
					selected: true
					</c:if>
				},
				</c:forEach>
			],
			tooltip: {
				 headerFormat: '<small>{point.key}</small><table>',
				    pointFormat: '<tr><td style="color: {series.color}">: </td>' +
				        '<td style="text-align: right"><b><br>￥{point.y},{point.percentage}%</b></td></tr>',
				    footerFormat: '</table>',
			    valueDecimals: 2
			}
	}]
});

Highcharts.chart('container-2', {
	chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
	},
	title: {
			text: '广告点击量统计'
	},
	tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	},
	plotOptions: {
			pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
							enabled: false
					},
					showInLegend: true
			}
	},
	series: [{
			name: '点击量',
			colorByPoint: true,
			data: [
				<c:forEach items="${clicks}" var="item" varStatus="index">
				{
					name: "${item.type}",
					y: ${item.total},
					<c:if test="${index.count==1}">
					sliced: true,
					selected: true
					</c:if>
				},
				</c:forEach>
			],
			tooltip: {
				valueDecimals:2,
				 headerFormat: '<small>{point.key}</small><table>',
				    pointFormat: '<tr><td style="color: {series.color}">: </td>' +
				        '<td style="text-align: right"><b><br>{point.y}次,{point.percentage}%</b></td></tr>',
				    footerFormat: '</table>',
			    valueDecimals: 0
			}
	}]
});


</script>
</body>
</html>