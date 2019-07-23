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

//发送消息
WS.prototype.send = function (message) {
    this.websocket.send(message);
};

//获取当前时间，格式化为datetime
function getNowFormatDate() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var hour = date.getHours();
    var minutes = date.getMinutes();
    var second = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (hour >= 0 && hour <= 9) {
        hour = "0" + hour;
    }
    if (minutes >= 0 && minutes <= 9) {
        minutes = "0" + minutes;
    }
    if (second >= 0 && second <= 9) {
        second = "0" + second;
    }
    return year + "-" + month + "-" + strDate
        + " " + hour + ":" + minutes
        + ":" + second;
}