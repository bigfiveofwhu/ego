<%@ page pageEncoding="GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/ego/css/bootstrap.css">
    <link rel="stylesheet" href="/ego/layui/css/layui.css">
    <meta charset="GBK">
    <title></title>
</head>
<body>

<form>
    <div class="form-group row ml-5 mt-5">
        <label for="input-header" class="col-sm-1 col-form-label">标题:</label>
        <div class="col-sm-11">
            <input type="text" class="form-control w-50" id="input-header" placeholder="请输入标题" name="aae105">
        </div>
    </div>

    <div class="form-group row ml-5 mt-5">
        <label for="input-body" class="col-sm-1 col-form-label">内容:</label>
        <div class="col-sm-11">
            <textarea class="form-control w-50" id="input-body" rows="5" placeholder="请输入正文" name="aae102"></textarea>
        </div>
    </div>

    <div class="input-group w-25 mt-5 ml-5">
        <select class="custom-select" aria-label="" name="aae302">
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
        </select>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary ml-3" type="submit">发送</button>
        </div>
    </div>
    <%--发送者id，测试阶段为默认from--%>
    <input type="hidden" name="aae103" value="from">
    <%--type--%>
    <input type="hidden" name="type" value="2">
</form>

<script>
</script>
<script src="/ego/js/jquery-3.2.0.min.js"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
</body>
</html>