<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; ">
    <title>ie </title>
    <script type="text/javascript">
    function getParameter(val) {
        var uri = decodeURI(window.location.search);
        var re = new RegExp("" + val + "=([^&?]*)", "ig");
        return ((uri.match(re)) ? (uri.match(re)[0].substr(val.length + 1)) : null);
    }

        var upload_callback = function() {
            var error = getParameter("error");
            error = parseInt(error)
            var dataObject;
            if(error==0){
                var url = getParameter("url");
                dataObject = {"error": error, "url": url};
            }else{
                var message = getParameter("message");
                dataObject = {"error": error, "message": message};
            }
            var data =  JSON.stringify(dataObject)
            document.getElementsByTagName("body")[0].innerHTML = '<pre>' + data + '</pre>';
        }
    </script>
</head>
<body onload="upload_callback();">
</body>
