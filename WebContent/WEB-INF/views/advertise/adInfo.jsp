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

 
<div class="layui-tab">
  
  <ul class="layui-tab-title">
    <li class="layui-this">基本信息</li>
    <li>点击量报表</li>
    <li>点击用户详情</li>
  </ul>
  
  <div class="layui-tab-content">
    
    <div class="layui-tab-item layui-show">
      <h1>总点击量：${total}</h1>
    </div>
    <!----------------------------------------------->
    <div class="layui-tab-item">
		<div id="container-1" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
    </div>
    <!----------------------------------------------->
    <div class="layui-tab-item">
    	<div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
    	<label for="test1">请输入您想查看的日期</label>
		 <input type="text" class="layui-input" id="test1">
		</div>
		 <table id="demo" lay-filter="test"></table>
    </div>
    
  </div>
</div>


<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
<script src="/ego/js/highcharts.js"></script>
<script src="/ego/js/exporting.js"></script>
<script src="/ego/js/export-data.js"></script>
<!-- insert your javascript here-->
<script>
layui.use('element', function(){
  var element = layui.element;
  //…
});
layui.use('table', function(){
	  table = layui.table;
	  //第一个实例
	  
	  
});
layui.use('laydate', function(){
  var laydate = layui.laydate;
  //执行一个laydate实例
  laydate.render({
    elem: '#test1' //指定元素
    ,done:function(value){
    	table.render({
    	    elem: '#demo'
    	    ,height: 312
    	    ,url: 'getUserClickInfo.ajax?aad502='+value+"&aad302=${aad302}" //数据接口
   	    	,parseData: function(res){ //res 即为原始返回的数据
   	    	    return {
   	    	      "code": res.status, //解析接口状态
   	    	      "msg": res.message, //解析提示文本
   	    	      "count": res.count, //解析数据长度
   	    	      "data": res.data //解析数据列表
   	    	    };
   	    	  }
    	    ,page: true //开启分页
    	    ,cols: [[ //表头
    	      {field: 'aaa103', title: '用户名', width:200, sort: true, fixed: 'left'}
    	      ,{field: 'aad503', title: '点击次数', width:200}
    	    ]]
    	  });
    }
  });
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
        text: '广告点击量流水'
    },
    subtitle:{
        text:'最近30天点击总量：${sum} '
    },
    xAxis: {
        tickInterval: 1,
        categories: [
        	<c:forEach items="${recentInfo}" var="item">'${item.aad502}',</c:forEach>
        ]  	
    },
    series: [
        {
            name: '最近30天点击次数记录',
            data: [
            	<c:forEach items="${recentInfo}" var="item">${item.sum},</c:forEach>
            ]
        },
    ]
});

</script>
</body>
</html>