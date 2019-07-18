<%--<%@ page pageEncoding="GBK" %>--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>聊天窗口</title>
    <link rel="stylesheet" type="text/css" href="chat.css">
</head>
<body>

<div class="qqBox">
    <div class="BoxHead">
        <div class="headImg">
            <img src="" alt="">
        </div>
        <div class="internetName">我的消息</div>
    </div>
    <div class="context">
        <div class="conLeft">
            <ul>
                <li class="bg">
                    <div class="liLeft"><img src="" alt=""></div>
                    <div class="liRight">
                        <span class="interName">用户1</span>
                        <span class="info">1001</span>
                    </div>
                </li>
                <%--<li>
                    <div class="liLeft"><img src="" alt=""></div>
                    <div class="liRight">
                        <span class="interName">web交流群</span>
                        <span class="info">[流泪]</span>
                    </div>
                </li>--%>
            </ul>
        </div>
        <div class="conRight">
            <div class="RightHead">
                <div class="headName"></div>
            </div>
            <div class="RightCont">
               <%-- <ul class="newsList" id="newsList-1001" style="">
                    <li>
                        <div class="newsHead"><img src="" alt=""></div>
                        <div class="news">
                            <div style="height: 25%;">
                                2019
                            </div>
                            <div>
                                水电费
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="answersHead"><img src="" alt=""></div>
                        <div class="answers">asd</div>
                    </li>
                </ul>--%>
                <%--<ul class="newsList" id="newsList-1001">
                </ul>--%>
                <%--                <ul class="newsList">--%>
                <%--                </ul>--%>
            </div>
            <div class="RightFoot">
                <div class="inputBox">
                    <p id='chatHint' class="chat-hint">
                        <span class="chat-hint-icon">!</span>
                        <span class="chat-hint-text">发送内容不能为空</span>
                    </p>
                    <label for="content"></label>
                    <textarea id="content" class="content"></textarea>
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
    var curr_to = '1001';//当前选中接收者id
    var curr_list = [];//当前列表中接收者
    var RightCont = document.querySelector('.RightCont');

    var ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
    ws.websocket.onmessage = function (event) {
        createInfo(event.data);
    };

    /*    $('.conLeft li').on('click', function () {
            // 选中当前元素添加类'bg'（加阴影），同时去除同胞元素的'bg'类
            $(this).addClass('bg').siblings().removeClass('bg');
            //将headName设置为当前聊天对象的interName
            var interName = $(this).find('.interName').text();
            $('.headName').text(interName);
        });*/

    //发送按钮，向后台发送消息的同时将消息展示在前端
    $('.sendBtn').on('click', function () {
        var content = $('#content');
        var news = content.val();
        if (news === '') {
            chatHintNull($('#chatHint'));
        } else {
            var message = JSON.stringify({
                "from": curr_from,
                // "to": $('.bg').find('.info').text(),
                "to": curr_to,
                "content": news,
            });
            ws.send(message);
            createInfo(message);
            content.val('');
            content.focus();
            // $('.conLeft').find('li.bg').children('.liRight').children('.info').text(news);
        }
    });

    /*创建新消息框*/
    function createInfo(value) {
        var jsonObject = JSON.parse(value);
        var content = jsonObject.content;
        var from = jsonObject.from;
        var to = jsonObject.to;
        var name = 'answers';
        var target;
        //判断是否为当前用户发送的消息
        if (from !== curr_from) {
            name = 'news';

            //如果发送者不在列表中，则加入列表
            if (curr_list.indexOf(from) === -1) {
                curr_list.push(from);

                //消息接收框
                var newsList_str = '<ul class="newsList" id="newsList-' + from + '" style="display:none;"></ul>';
                $('.RightCont').append(newsList_str);

                //左侧头像框
                // $('.conLeft li').removeClass('bg');
                var conLeft_str = '<li id="li-' + from + '"><div class="liLeft"><img src="" alt=""></div><div class="liRight">' +
                    '<span class="interName">' + 'name' + '</span>' +
                    '<span class="info">' + from + '</span></div></li>';
                $('.conLeft').find('ul').prepend(conLeft_str);

                //选中左侧头像框触发事件
                $('#li-' + from).on('click', function () {
                    // 选中当前元素添加类'bg'（加阴影），同时去除同胞元素的'bg'类
                    $(this).addClass('bg').siblings().removeClass('bg');
                    //将headName设置为当前聊天对象的interName
                    // var interName = $(this).find('.interName').text();
                    $('.headName').text('name');
                    //将当前消息接收者设置为from
                    curr_to = from;
                    //将对应聊天框显示为可见，隐藏其他聊天框，并拉到最下
                    $('.newsList').css({display: "none"});
                    $('#newsList-' + from).css({display: ""});
                    RightCont.scrollTop = RightCont.scrollHeight;
                    //修改聊天消息为已读
                    var message = JSON.stringify({
                        "from": from,
                        "to": to,
                        "type": "01",
                    });
                    ws.send(message);
                });
            }
            target = $('#newsList-' + from);
        } else {
            target = $('#newsList-' + to);
        }
        var str = '<li><div class=' + name +
            'Head><img src="" alt=""/></div><div class=' +
            name + '>' + content + '</div></li>';
        target.append(str);

        //当消息过多时将最新信息展示在聊天框最下面
        RightCont.scrollTop = RightCont.scrollHeight;
        // $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight);
    }

    var timer, timerId;

    function chatHintNull(chatHint) {//空输入提示
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
