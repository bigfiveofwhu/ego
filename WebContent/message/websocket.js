var WS = function (url) {
    this.url = url;
    console.log(this.url);
    this.websocket = null;
    this.initWebSocket()
};

//初始化websocket连接
WS.prototype.initWebSocket = function () {
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        this.websocket = new WebSocket(this.url);
    } else {
        alert('当前浏览器 Not support websocket')
    }

    //连接成功建立的回调方法
    this.websocket.onopen = function () {
        console.log('WebSocket连接成功');
    };

    //接收到消息的回调方法
    this.websocket.onmessage = function (event) {
    };

    //连接发生错误的回调方法
    this.websocket.onerror = function () {
        console.log('WebSocket连接发生错误');
    };

    //连接关闭的回调方法
    this.websocket.onclose = function () {
        console.log('WebSocket连接关闭');
    };
};

//关闭WebSocket连接
WS.prototype.closeWebSocket = function () {
    if (this.websocket != null) {
        this.websocket.close();
        this.websocket = null;
    }
};

//发送消息
WS.prototype.send = function (message) {
    this.websocket.send(message);
};