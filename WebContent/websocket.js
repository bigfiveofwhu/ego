var WS = function (url) {
    this.url = url;
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

//获取当前时间
function getNowFormatDate() {
    var date = new Date();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var second = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (second >= 0 && second <= 9) {
        second = "0" + second;
    }
    return date.getFullYear() + "-" + month + "-" + strDate
        + " " + date.getHours() + ":" + date.getMinutes()
        + ":" + second;
}