<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="GBK">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>聊天窗口</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/message/chat.css">
    <%--    <link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/message/chat.css">         <!-- 消息框css -->--%>
    <script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${path}/js/message/websocket.js"></script>
</head>
<body>
<div class="main" style="display: block; top: 38px; left: 124px">
    <div class="top">
        <div class="top-left">
            <div class="header">
            </div>
        </div>
        <div class="top-right" onclick="closeChat()" style="display: none">
            <i class="am-icon-close"></i>
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
                    <button class="sendBtn zyf-tip zyf-tip-left" data-zyf-tip="按Enter键发送消息，按Ctrl+Enter键换行">发送</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/js/message/websocket.js"></script>
<script>
    var curr_from;//当前用户id
    var curr_from_name;//当前用户名字
    var curr_to = '';//当前选中接收者id
    var curr_list = [];//当前列表中接收者
    var news_top = document.querySelector('.news-top');
    var pic_path_current;

    if ('${user_type}' === '2') {
        curr_from = 's${aab102}';
        curr_from_name = '${aab103}';
        pic_path_current = '${path}/images/shop/shop_${aab102}.jpg';
    } else if ('${user_type}' === '3') {
        curr_from = 'S${aac102}';
        curr_from_name = '${aac103}';
        pic_path_current = '${path}/images/service/service_${aac102}.jpg';
    } else {
        curr_from = '';
        curr_from_name = '游客';
    }

    $('.header').html('<img src="' + pic_path_current + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt="" style="border-radius:75px;width: 48px;"/>');

    var ws = null;
    ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
    ws.websocket.onmessage = function (event) {
        createInfo(event.data);
    };

    //发送按钮，向后台发送消息的同时将消息展示在前端
    $('.sendBtn').on('click', function () {
        if (ws == null) return;
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
        if (ws == null) return;
        var jsonObject = JSON.parse(value);
        var from = jsonObject.from_id;
        var to = jsonObject.to_id;
        var datetime = jsonObject.datetime;
        var content = jsonObject.content;
        var fromName = jsonObject.from_name;

        var type = 'self';
        var target;
        var list_box_id;
        var timeout = null;

        var user_type = from.substr(0, 1);
        var user_id = from.substr(1);
        var pic_path, type_name;
        if (user_type === 'u') {
            pic_path = '${path}/images/upload/user_' + user_id + '.jpg';
            type_name = '用户'
        } else if (user_type === 's') {
            pic_path = '${path}/images/shop/shop_' + user_id + '.jpg';
            type_name = '商铺'
        } else if (user_type === 'S') {
            pic_path = '${path}/images/service/service_' + user_id + '.jpg';
            type_name = '服务商'
        } else {
            pic_path = '';
            type_name = '游客';
        }

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
                    '<img class="chat-head" src="' + pic_path + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt="">' +
                    '<div class="chat-rig">' +
                    '<p class="title">' + fromName + '(' + type_name + ')' + '</p>' +
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

                    clearTimeout(timeout);
                    timeout = setTimeout(function () {
                        //修改聊天消息为已读，最多10s执行一次
                        var message = JSON.stringify({
                            "from_id": from,
                            "to_id": to,
                            "type": "01",
                        });
                        ws.send(message);
                    }, 10000)
                });
            }
            target = $('#newsList-' + from);
            list_box_id = from;
        } else {
            target = $('#newsList-' + to);
            list_box_id = to;
        }
        //将头像框名称更正为最新名称
        $('#list-box-' + from).find('.title').text(fromName + '(' + type_name + ')');
        //添加消息
        var str = '<li class="' + type + '"><div class="avatar">' +
            '<img src="' + pic_path + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt=""></div>' +
            '<div class="msg"><p class="msg-time">' + datetime + '</p>' +
            '<p class="msg-text">' + content + '</p></div></li>';
        target.append(str);
        //当消息过多时将最新信息展示在聊天框最下面
        news_top.scrollTop = news_top.scrollHeight;
        //将左侧聊天列表文字改成当前消息
        $('#list-box-' + list_box_id + ' .text').text(content);
    }

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

    var isMousedown = false;
    $(".main .top").mousedown(function () {
        isMousedown = true;
        console.log("鼠标按下");
    });
    $(".main .top").mouseup(function () {
        isMousedown = false;
        console.log("鼠标松开");
    });
    var mouseX = 0;
    var mouseY = 0;
    $(".main .top").mousemove(function (e) {
        if (!isMousedown) {
            mouseX = e.pageX;
            mouseY = e.pageY;
            return;
        }
        var X = e.pageX;
        var Y = e.pageY;
        moveChat(X - mouseX, Y - mouseY);
        mouseX = X;
        mouseY = Y;
    });

    function moveChat(dX, dY) {
        var top = parseInt($(".main").css("top"));
        var left = parseInt($(".main").css("left"));
        $(".main").css("top", (top + dY) + "px");
        $(".main").css("left", (left + dX) + "px");
    }

    function closeChat() {
        $(".main").css("display", "none");
    }

    document.onkeydown = function (event) {
        var e = event || window.event;
        //只按回车就发送消息
        if (e && e.keyCode === 13 && !e.shiftKey) {
            e.cancelBubble = true;
            e.preventDefault();
            e.stopPropagation();
            $(".sendBtn").click();
        }
    };
</script>
</body>
</html>