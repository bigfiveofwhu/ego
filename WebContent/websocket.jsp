<%@ page pageEncoding="utf-8" %>
<html>
<head>
    <title>websocket demo</title>
</head>
<body>
消息:<label for="text1"></label><input id="text1" type="text"/>
<button onclick="WebSocketSend('1')">发送消息</button>
<br>
公告:<label for="text2"></label><input id="text2" type="text"/>
<button onclick="WebSocketSend('2')">发送公告</button>
<hr/>
发送人:<label for="from"></label><input type="text" id="from">
<button onclick="openWebSocket()">打开WebSocket连接</button>
<br>
接收人:<label for="to"></label><input type="text" id="to">
<button onclick="closeWebSocket()">关闭WebSocket连接</button>
<br>
<a href="index.jsp">next</a>
<hr/>
<div id="notice"></div>
<hr/>
<div id="message"></div>
</body>

<script src="websocket.js"></script>
<script type="text/javascript">
    var ws = null;

    function openWebSocket() {
        if (ws === null) {
            var wsUrl = "ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + document.getElementById('from').value;
            ws = new WS(wsUrl);
            ws.websocket.onmessage = function (event) {
                setMessageInnerHTML(event.data);
            };
        }
    }

    function closeWebSocket() {
        ws.closeWebSocket();
        ws = null;
    }

    //将消息显示在网页上
    function setMessageInnerHTML(value) {
        var jsonObject = JSON.parse(value);
        var from = jsonObject.from;
        var to = jsonObject.to;
        var content = jsonObject.content;
        var type = jsonObject.type;
        var date = jsonObject.date;
        var message = 'from: ' + from + ' to: ' + to + '    content: ' + content + '    ' + date;
        if (type === '1') {
            document.getElementById('message').innerHTML += message + '<br/>';
        } else if (type === '2') {
            document.getElementById('notice').innerHTML += message + '<br/>';
        }
    }

    //发送消息
    function WebSocketSend(type) {
        if (ws == null) return;
        var from = document.getElementById('from').value;
        var to = document.getElementById('to').value;
        var content = document.getElementById('text1').value;
        if (type === '2') {
            content = document.getElementById('text2').value;
        }
        var date = getNowFormatDate();
        var message = JSON.stringify({
            "from": from.toString(),
            "to": to.toString(),
            "content": content.toString(),
            "type": type.toString(),
            "date": date.toString()
        });
        setMessageInnerHTML(message);
        ws.send(message);
    }
</script>
</html>