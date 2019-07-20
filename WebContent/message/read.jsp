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
<div class="list-group justify-content-center">
    <c:forEach items="${messages}" var="ins" varStatus="vs">
        <a data-toggle="modal" data-target=".bd-modal-lg-${ins.aae301}" onclick="updateState(${ins.aae301})"
           class="list-group-item list-group-item-action mb-4 w-75 shadow rounded p-3">
            <div class="d-flex justify-content-between" id="message-${ins.aae301}">
                <div>
                    <div class="d-flex justify-content-left mt-2">
                        <h5 class="mb-2 ml-4"><strong>${ins.aae105}</strong></h5>
                        <small class="text-muted ml-4">${ins.aae104}</small>
                    </div>
                    <p class="mb-2 ml-5">${ins.aae106}(${ins.aae103})</p>
                </div>
                <p class="mt-3 mr-4">
                    <c:choose>
                        <c:when test="${ins.aae303=='01'}">未读</c:when>
                        <c:when test="${ins.aae303=='02'}">已读</c:when>
                        <c:otherwise>未读</c:otherwise>
                    </c:choose>
                </p>
            </div>
        </a>

        <div class="modal fade bd-modal-lg-${ins.aae301}" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title h4" aria-hidden="true">${ins.aae105}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            ${ins.aae102}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    function updateState(id) {
        $.ajax({
            url: "<%=basePath%>/updateState.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "aae301": id
            },
            success: function () {
                $('#message-' + id).find('.mt-3.mr-4').html('已读');
            },
        });
    }
</script>

<script src="/ego/js/jquery-3.2.0.min.js"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>
</body>
</html>