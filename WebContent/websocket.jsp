<%@ page pageEncoding="gbk" %>
<html>
<head>
    <title>websocket demo</title>
</head>
<body>
��Ϣ:<label for="text1"></label><input id="text1" type="text"/>
<button onclick="WebSocketSend('1')">������Ϣ</button>
<br>
����:<label for="text2"></label><input id="text2" type="text"/>
<button onclick="WebSocketSend('2')">���͹���</button>
<hr/>
������:<label for="from"></label><input type="text" id="from">
<button onclick="openWebSocket()">��WebSocket����</button>
<br>
������:<label for="to"></label><input type="text" id="to">
<button onclick="closeWebSocket()">�ر�WebSocket����</button>
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

    //����Ϣ��ʾ����ҳ��
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

    //������Ϣ
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