<%@ page pageEncoding="GBK" %>
<%@include file="/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="GBK">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>���촰��</title>
    <link rel="stylesheet" type="text/css" href="${path}/css/message/chat.css">
    <%--    <link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/message/chat.css">         <!-- ��Ϣ��css -->--%>
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
                <div class="nav-top"><p>�ҵ���Ϣ</p></div>
                <div class="news-top"></div>
            </div>
            <div class="sendto">
                <div class="but-text">
                    <p id='chatHint' class="chat-hint">
                        <span class="chat-hint-icon">!</span>
                        <span class="chat-hint-text">�������ݲ���Ϊ��</span>
                    </p>
                    <label for="inputTextarea"></label>
                    <textarea id="inputTextarea" class="inputTextarea"></textarea>
                    <button class="sendBtn zyf-tip zyf-tip-left" data-zyf-tip="��Enter��������Ϣ����Ctrl+Enter������">����</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/js/message/websocket.js"></script>
<script>
    var curr_from;//��ǰ�û�id
    var curr_from_name;//��ǰ�û�����
    var curr_to = '';//��ǰѡ�н�����id
    var curr_list = [];//��ǰ�б��н�����
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
        curr_from_name = '�ο�';
    }

    $('.header').html('<img src="' + pic_path_current + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt="" style="border-radius:75px;width: 48px;"/>');

    var ws = null;
    ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
    ws.websocket.onmessage = function (event) {
        createInfo(event.data);
    };

    //���Ͱ�ť�����̨������Ϣ��ͬʱ����Ϣչʾ��ǰ��
    $('.sendBtn').on('click', function () {
        if (ws == null) return;
        var inputTextarea = $('#inputTextarea');
        var content = inputTextarea.val();
        if (content === '') {
            chatHintNull($('#chatHint'));
        } else {
            if (curr_to === '') {
                alert("��ѡ�������");
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

    /*��������Ϣ��*/
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
            type_name = '�û�'
        } else if (user_type === 's') {
            pic_path = '${path}/images/shop/shop_' + user_id + '.jpg';
            type_name = '����'
        } else if (user_type === 'S') {
            pic_path = '${path}/images/service/service_' + user_id + '.jpg';
            type_name = '������'
        } else {
            pic_path = '';
            type_name = '�ο�';
        }

        //�ж��Ƿ�Ϊ��ǰ�û����͵���Ϣ
        if (from !== curr_from) {
            type = 'other';
            //��������߲����б��У�������б�
            if (curr_list.indexOf(from) === -1) {
                curr_list.push(from);

                //��Ϣ���տ�
                var newsList_str = '<ul class="newsList" id="newsList-' + from + '" style="display:none;"></ul>';
                $('.news-top').append(newsList_str);

                //���ͷ���
                var listBox_str = '<div class="list-box" id="list-box-' + from + '">' +
                    '<img class="chat-head" src="' + pic_path + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt="">' +
                    '<div class="chat-rig">' +
                    '<p class="title">' + fromName + '(' + type_name + ')' + '</p>' +
                    '<p class="text">' + '���' + '</p></div></div>';
                $('.chat-list').prepend(listBox_str);

                //ѡ�����ͷ��򴥷��¼�
                $('#list-box-' + from).on('click', function () {
                    // ѡ�е�ǰԪ�������'select'��ѡ�У���ͬʱȥ��ͬ��Ԫ�ص�'select'��
                    $(this).addClass('select').siblings().removeClass('select');
                    //��headName����Ϊ��ǰ������������
                    $('.nav-top p').text(fromName);
                    //����ǰ��Ϣ����������Ϊfrom
                    curr_to = from;
                    //����Ӧ�������ʾΪ�ɼ���������������򣬲���������
                    $('.newsList').css({display: "none"});
                    $('#newsList-' + from).css({display: ""});
                    news_top.scrollTop = news_top.scrollHeight;

                    clearTimeout(timeout);
                    timeout = setTimeout(function () {
                        //�޸�������ϢΪ�Ѷ������10sִ��һ��
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
        //��ͷ������Ƹ���Ϊ��������
        $('#list-box-' + from).find('.title').text(fromName + '(' + type_name + ')');
        //�����Ϣ
        var str = '<li class="' + type + '"><div class="avatar">' +
            '<img src="' + pic_path + '" onerror="this.src=\'${path}/images/no-img_mid_.jpg\';" alt=""></div>' +
            '<div class="msg"><p class="msg-time">' + datetime + '</p>' +
            '<p class="msg-text">' + content + '</p></div></li>';
        target.append(str);
        //����Ϣ����ʱ��������Ϣչʾ�������������
        news_top.scrollTop = news_top.scrollHeight;
        //����������б����ָĳɵ�ǰ��Ϣ
        $('#list-box-' + list_box_id + ' .text').text(content);
    }

    var timer, timerId;

    //��������ʾ
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

    /*��ť��Ч*/
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
        console.log("��갴��");
    });
    $(".main .top").mouseup(function () {
        isMousedown = false;
        console.log("����ɿ�");
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
        //ֻ���س��ͷ�����Ϣ
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