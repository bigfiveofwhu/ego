<%@ page language="java" pageEncoding="GBK" %>

<link rel="stylesheet" type="text/css" href="${path}/css/message/chat.css">
<!-- ��Ϣ��css -->
<!--�˵� -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="# "> <span class="setting "></span> </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox ">
                            <c:if test="${aaa102!=null }">
                                <img src="${path}/images/upload/user_${aaa102}.jpg "/>
                            </c:if>
                            <c:if test="${aaa102==null }">
                                <img src="${path}/images/no-img_mid_.jpg "/>
                            </c:if>
                        </p>
                        <ul class="user_info ">
                            <c:if test="${aaa102!=null }">
                                <li>�û���${aaa103 }</li>
                                <li>&nbsp;��ͨ��Ա</li>
                            </c:if>
                            <c:if test="${aaa102==null }">
                                <li>�ο�״̬</li>
                                <li>&nbsp;���ȵ�¼</li>
                            </c:if>
                        </ul>
                    </div>
                    <c:if test="${aaa102!=null }">
                        <div class="login_btnbox ">
                            <a href="# " class="login_order ">�ҵĶ���</a>
                            <a href="${path}/person/index.jsp?iframe=${path}/person/showCollection.html"
                               class="login_favorite ">�ҵ��ղ�</a>
                        </div>
                    </c:if>
                    <c:if test="${aaa102==null }">
                        <div class="login_btnbox ">
                            <a href="# " class="login_order ">ϵͳ��Ϣ</a>
                            <a href="${path}/home/login.jsp" class="login_favorite ">��¼</a>
                        </div>
                    </c:if>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>
            <div id="shopCart " class="item " onclick="location.href='${path}/home/shopCart.html'">
                <a href="# "> <span class="message "></span> </a>
                <p>���ﳵ</p>
                <p class="cart_num ">${shopCartCount}</p>
            </div>
            <div id="asset " class="item ">
                <a href="# "> <span class="view "></span> </a>
                <div class="mp_tooltip ">
                    �ҵ��ʲ� <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="# "> <span class="zuji "></span> </a>
                <div class="mp_tooltip ">
                    �ҵ��㼣 <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="${path}/person/index.jsp?iframe=${path}/person/showCollection.html"> <span class="wdsc "><img
                        src="${path}/images/wdsc.png "/> </span> </a>
                <div class="mp_tooltip ">
                    �ҵ��ղ� <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="# "> <span class="chongzhi "><img
                        src="${path}/images/chongzhi.png "/> </span> </a>
                <div class="mp_tooltip ">
                    ��Ҫ��ֵ <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <li class="qtitem " onclick="openChart()"><a href="# "><span class="kfzx "></span>
                </a>
                    <div class="mp_tooltip ">
                        �ͷ�����<i class="icon_arrow_right_black "></i>
                    </div>
                </li>
                <!--��ά�� -->
                <li class="qtitem "><a href="#none "><span
                        class="mpbtn_qrcode "></span> </a>
                    <div class="mp_qrcode " style="display:none; ">
                        <img src="${path}/images/weixin_code_145.png "/><i
                            class="icon_arrow_white "></i>
                    </div>
                </li>
                <li class="qtitem "><a href="#top " class="return_top ">
                    <span class="top "></span> </a></li>
            </div>

            <!--�ص����� -->
            <div id="quick_links_pop" class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>��</div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>���ﳵ</div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>�ʲ�</div>

        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">�Ż�ȯ</div>
            </a> <a href="# " target="_blank "
                    class="pl ">
            <div class="num ">0</div>
            <div class="text ">���</div>
        </a> <a href="# " target="_blank "
                class="pl money ">
            <div class="num ">��0</div>
            <div class="text ">���</div>
        </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>�㼣</div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>�ղ�</div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>��ֵ</div>
    </div>
</div>

<!-- ��Ϣ�� -->
<div class="main" style="display:none;">
    <div class="top">
        <div class="top-left">
            <div class="header">
                <img src="${path}/images/upload/user_${aaa102}.jpg" onerror="this.src='${path}/images/no-img_mid_.jpg';"
                     alt=""
                     style="border-radius:75px;width: 48px;margin-bottom: 13px;"/>
            </div>
        </div>
        <div class="top-right" onclick="closeChat()">
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
    var curr_from = 'u${aaa102}';//��ǰ�û�id
    var curr_from_name = '${aaa103}';//��ǰ�û�����
    var curr_to = '';//��ǰѡ�н�����id
    var curr_list = [];//��ǰ�б��н�����
    var news_top = document.querySelector('.news-top');

    var ws = null;

    function openWebsocket() {
        ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
        ws.websocket.onmessage = function (event) {
            createInfo(event.data);
        };
    }

    function openChart() {
        if (curr_from === '' || curr_from === 'u') {
            alert("���ȵ�¼!");
            return;
        }
        if (curr_from === '${from_id}') {
            alert("���ܺ��Լ�����!");
            return;
        }
        $.ajax({
            url: "${path}/initChat.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "from_id": '${from_id}',
                "to_id": curr_from,
                "datetime": getNowFormatDate(),
                "content": "${from_name}�ͷ� �߳�Ϊ������!",
                "from_name": '${from_name}'
            },
            success: function (res) {
                if (res.status === '200') {
                    if (ws == null)
                        openWebsocket();
                    setTimeout(() => {
                        $(".main").css("display", "block");
                    }, 100);
                }
            },
            error: function () {
                console.log("��Ϣ���ʹ���!");
            }
        });
    }

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