<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<link rel="stylesheet" href="/ego/layui/css/layui.css">
<meta charset="GBK">
<title></title>
</head>
<body>
<!-- insert your code-->

<div id="container-1" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
<div id="container-2" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
<script src="/ego/report/highcharts.js"></script>
<script src="/ego/report/exporting.js"></script>
<script src="/ego/report/export-data.js"></script>
<!-- insert your javascript here-->
<script>
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
            text: 'Ԫ',
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
			text: '���Ͷ��ͳ��'
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
				        '<td style="text-align: right"><b><br>��{point.y},{point.percentage}%</b></td></tr>',
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
			text: '�������ͳ��'
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
			name: '�����',
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
				 headerFormat: '<small>{point.key}</small><table>',
				    pointFormat: '<tr><td style="color: {series.color}">: </td>' +
				        '<td style="text-align: right"><b><br>{point.y}��,{point.percentage}%</b></td></tr>',
				    footerFormat: '</table>',
			    valueDecimals: 0
			}
	}]
});


</script>
</body>
</html>