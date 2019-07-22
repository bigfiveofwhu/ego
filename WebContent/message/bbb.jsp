<%@ page pageEncoding="GBK" %>
<!doctype html>
<html>
<head>
    <meta charset="GBK">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>聊天窗口</title>
    <link rel="stylesheet" type="text/css" href="bbb.css">
</head>
<body>
<div class="main">
    <div class="top">
        <div class="top-left">
            <div class="header"></div>
        </div>
    </div>
    <div class="box">
        <div class="chat-list"></div>
        <div class="box-right">
            <div class="receiveBox">
                <div class="nav-top"><p>我的消息</p></div>
                <div class="news-top"></div>
            </div>
            <div class="sendto">
                <div class="but-text">
                    <p id='chatHint' class="chat-hint">
                        <span class="chat-hint-icon">!</span>
                        <span class="chat-hint-text">发送内容不能为空</span>
                    </p>
                    <label for="inputTextarea"></label>
                    <textarea id="inputTextarea" class="inputTextarea"></textarea>
                    <button class="sendBtn">发送</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="websocket.js"></script>
<script>
    var curr_from = window.location.search.substr(1);//当前用户id
    var curr_from_name = '发送者';//当前用户名字
    var curr_to = '';//当前选中接收者id
    var curr_list = [];//当前列表中接收者
    var news_top = document.querySelector('.news-top');

    var ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
    ws.websocket.onmessage = function (event) {
        createInfo(event.data);
    };

    //发送按钮，向后台发送消息的同时将消息展示在前端
    $('.sendBtn').on('click', function () {
        var inputTextarea = $('#inputTextarea');
        var content = inputTextarea.val();
        if (content === '') {
            chatHintNull($('#chatHint'));
        } else {
            if (curr_to === '') {
                alert("请选择接收人");
                return;
            }
            var message = JSON.stringify({
                "from_id": curr_from,
                "to_id": curr_to,
                "datetime": getNowFormatDate(),
                "content": content,
                "from_name": curr_from_name
            });
            ws.send(message);
            createInfo(message);
            inputTextarea.val('');
            inputTextarea.focus();
        }
    });

    /*创建新消息框*/
    function createInfo(value) {
        var jsonObject = JSON.parse(value);
        var from = jsonObject.from_id;
        var to = jsonObject.to_id;
        var datetime = jsonObject.datetime;
        var content = jsonObject.content;
        var fromName = jsonObject.from_name;

        var type = 'self';
        var target;
        var list_box_id;
        //判断是否为当前用户发送的消息
        if (from !== curr_from) {
            type = 'other';

            //如果发送者不在列表中，则加入列表
            if (curr_list.indexOf(from) === -1) {
                curr_list.push(from);

                //消息接收框
                var newsList_str = '<ul class="newsList" id="newsList-' + from + '" style="display:none;"></ul>';
                $('.news-top').append(newsList_str);

                //左侧头像框
                var listBox_str = '<div class="list-box" id="list-box-' + from + '">' +
                    '<img class="chat-head" src="bg.jpg" alt="">' +
                    '<div class="chat-rig">' +
                    '<p class="title">' + fromName + '(' + from + ')' + '</p>' +
                    '<p class="text">' + '你好' + '</p></div></div>';
                $('.chat-list').prepend(listBox_str);

                //选中左侧头像框触发事件
                $('#list-box-' + from).on('click', function () {
                    // 选中当前元素添加类'select'（选中），同时去除同胞元素的'select'类
                    $(this).addClass('select').siblings().removeClass('select');
                    //将headName设置为当前聊天对象的名字
                    $('.nav-top p').text(fromName);
                    //将当前消息接收者设置为from
                    curr_to = from;
                    //将对应聊天框显示为可见，隐藏其他聊天框，并拉到最下
                    $('.newsList').css({display: "none"});
                    $('#newsList-' + from).css({display: ""});
                    news_top.scrollTop = news_top.scrollHeight;
                    //修改聊天消息为已读
                    var message = JSON.stringify({
                        "from_id": from,
                        "to_id": to,
                        "type": "01",
                    });
                    ws.send(message);
                });
            }
            target = $('#newsList-' + from);
            list_box_id = from;
        } else {
            target = $('#newsList-' + to);
            list_box_id = to;
        }
        //添加消息
        var str = '<li class="' + type + '"><div class="avatar">' +
            '<img src="bg.jpg" alt=""></div>' +
            '<div class="msg"><p class="msg-time">' + datetime + '</p>' +
            '<p class="msg-text">' + content + '</p></div></li>';
        target.append(str);
        //当消息过多时将最新信息展示在聊天框最下面
        news_top.scrollTop = news_top.scrollHeight;
        //将左侧聊天列表文字改成当前消息
        $('#list-box-' + list_box_id + ' .text').text(content);
    }

    //加载完成后自动选中第一个
    setTimeout(function () {
        $('.list-box:first').click();
    }, 1000);

    var timer, timerId;

    //空输入提示
    function chatHintNull(chatHint) {
        setTimeout(function () {
            chatHint.fadeIn();
            clearTimeout(timerId);
            timer = setTimeout(function () {
                chatHint.fadeOut();
            }, 1000);
        }, 10);
        timerId = timer;
    }

    /*按钮特效*/
    var buttons = $('button');
    buttons.each(function (i) {
        $(this).mouseenter(function () {
            buttons.eq(i).fadeTo('slow', 0.8);
        });
    });

    buttons.each(function (i) {
        $(this).mouseleave(function () {
            buttons.eq(i).fadeTo('slow', 1);
        });
    });
</script>
</body>
</html>