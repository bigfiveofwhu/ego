<%@ page pageEncoding="GBK" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title>消息发送记录</title>
</head>
<body>
<table lay-filter="message-table">
    <thead>
    <tr>
        <th lay-data="{field:'id', sort: true}">序号</th>
        <th lay-data="{field:'aae104', sort: true}">时间</th>
        <th lay-data="{field:'aae105', sort: true}">标题</th>
        <th lay-data="{field:'aae102', sort: true}">内容</th>
        <th lay-data="{field:'count', sort: true}">接收人数</th>
        <th lay-data="{field:'see', sort: true}">查看人数</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${messageList}" var="ins" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${ins.aae104}</td>
            <td>${ins.aae105}</td>
            <td>${ins.aae102}</td>
            <td>${ins.count}</td>
            <td>${ins.see}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<button class="layui-btn" id="export">
    <i class="iconfont icon-export"></i> 导出
</button>

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
        table.init('message-table', {
            id: 'message-table',
            page: true,
            done: function (res) {
                exportData = res.data;
            }
        });

        $("#export").click(function () {
            table.exportFile('message-table', exportData, 'xls');
        });
    });
</script>

</body>
</html>