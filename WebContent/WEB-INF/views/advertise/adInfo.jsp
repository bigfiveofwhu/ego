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
    <li class="layui-this">������Ϣ</li>
    <li>���������</li>
    <li>����û�����</li>
  </ul>
  
  <div class="layui-tab-content">
    
    <div class="layui-tab-item layui-show">
      <h1>�ܵ������${total}</h1>
    </div>
    <!----------------------------------------------->
    <div class="layui-tab-item">
		<div id="container-1" style="min-width: 400px; min-height: 600px; margin: 0 auto"></div>
    </div>
    <!----------------------------------------------->
    <div class="layui-tab-item">
    	<div class="layui-inline"> <!-- ע�⣺��һ��Ԫ�ز����Ǳ���� -->
    	<label for="test1">����������鿴������</label>
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
  //��
});
layui.use('table', function(){
	  table = layui.table;
	  //��һ��ʵ��
	  
	  
});
layui.use('laydate', function(){
  var laydate = layui.laydate;
  //ִ��һ��laydateʵ��
  laydate.render({
    elem: '#test1' //ָ��Ԫ��
    ,done:function(value){
    	table.render({
    	    elem: '#demo'
    	    ,height: 312
    	    ,url: 'getUserClickInfo.ajax?aad502='+value+"&aad302=${aad302}" //���ݽӿ�
   	    	,parseData: function(res){ //res ��Ϊԭʼ���ص�����
   	    	    return {
   	    	      "code": res.status, //�����ӿ�״̬
   	    	      "msg": res.message, //������ʾ�ı�
   	    	      "count": res.count, //�������ݳ���
   	    	      "data": res.data //���������б�
   	    	    };
   	    	  }
    	    ,page: true //������ҳ
    	    ,cols: [[ //��ͷ
    	      {field: 'aaa103', title: '�û���', width:200, sort: true, fixed: 'left'}
    	      ,{field: 'aad503', title: '�������', width:200}
    	    ]]
    	  });
    }
  });
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
            text: 'Ԫ',
            rotation: 0
        }
    },
});

Highcharts.chart('container-1', {
    title: {
        text: '���������ˮ'
    },
    subtitle:{
        text:'���30����������${sum} '
    },
    xAxis: {
        tickInterval: 1,
        categories: [
        	<c:forEach items="${recentInfo}" var="item">'${item.aad502}',</c:forEach>
        ]  	
    },
    series: [
        {
            name: '���30����������¼',
            data: [
            	<c:forEach items="${recentInfo}" var="item">${item.sum},</c:forEach>
            ]
        },
    ]
});

</script>
</body>
</html>