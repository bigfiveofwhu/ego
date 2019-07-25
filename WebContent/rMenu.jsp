<%@ page language="java" pageEncoding="GBK" %>

<link rel="stylesheet" type="text/css" href="${path}/css/message/chat.css">
<!-- 消息框css -->
<!--菜单 -->
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
                                <li>用户名${aaa103 }</li>
                                <li>&nbsp;普通会员</li>
                            </c:if>
                            <c:if test="${aaa102==null }">
                                <li>游客状态</li>
                                <li>&nbsp;请先登录</li>
                            </c:if>
                        </ul>
                    </div>
                    <c:if test="${aaa102!=null }">
                    <div class="login_btnbox ">
                        <a href="# " class="login_order ">我的订单</a>
                        <a href="${path}/person/index.jsp?iframe=${path}/person/showCollection.html" class="login_favorite ">我的收藏</a>
                    </div>   
                    </c:if>
                    <c:if test="${aaa102==null }">
                    <div class="login_btnbox ">
                        <a href="# " class="login_order ">系统消息</a>
                        <a href="${path}/home/login.jsp" class="login_favorite ">登录</a>
                    </div>
                    </c:if>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>
            <div id="shopCart " class="item " onclick="location.href='${path}/home/shopCart.html'">
                <a href="# "> <span class="message "></span> </a>
                <p>购物车</p>
                <p class="cart_num ">${shopCartCount}</p>
            </div>
            <div id="asset " class="item ">
                <a href="# "> <span class="view "></span> </a>
                <div class="mp_tooltip ">
                    我的资产 <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="# "> <span class="zuji "></span> </a>
                <div class="mp_tooltip ">
                    我的足迹 <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="${path}/person/index.jsp?iframe=${path}/person/showCollection.html"> <span class="wdsc "><img
                        src="${path}/images/wdsc.png "/> </span> </a>
                <div class="mp_tooltip ">
                    我的收藏 <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="# "> <span class="chongzhi "><img
                        src="${path}/images/chongzhi.png "/> </span> </a>
                <div class="mp_tooltip ">
                    我要充值 <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <li class="qtitem " onclick="openChart()"><a href="# "><span class="kfzx "></span>
                </a>
                    <div class="mp_tooltip ">
                        客服中心<i class="icon_arrow_right_black "></i>
                    </div>
                </li>
                <!--二维码 -->
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

            <!--回到顶部 -->
            <div id="quick_links_pop" class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>我</div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>购物车</div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>资产</div>

        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a> <a href="# " target="_blank "
                    class="pl ">
            <div class="num ">0</div>
            <div class="text ">红包</div>
        </a> <a href="# " target="_blank "
                class="pl money ">
            <div class="num ">￥0</div>
            <div class="text ">余额</div>
        </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>足迹</div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>收藏</div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>充值</div>
    </div>
</div>

<!-- 消息框 -->
<div class="main" style="display:none;">
    <div class="top">
        <div class="top-left">
            <div class="header">
                <img src="${path}/images/upload/user_${aaa102}.jpg" alt="${aaa103}"
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
<script type="text/javascript" src="${path}/js/message/websocket.js"></script>
<script>
    var curr_from = '${aaa102}';//当前用户id
    var curr_from_name = '${aaa103}';//当前用户名字
    var curr_to = '';//当前选中接收者id
    var curr_list = [];//当前列表中接收者
    var news_top = document.querySelector('.news-top');

    var ws = null;

    function openWebsocket() {
        ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
        ws.websocket.onmessage = function (event) {
            createInfo(event.data);
        };
    }

    function openChart() {
        var id = '${aaa102}';
        if (id === '') {
            alert("请先登录!");
            return;
        }
        if (id === '${from_id}') {
            alert("不能和自己聊天!");
            return;
        }
        $.ajax({
            url: "${path}/initChat.ajax",
            type: "post",
            timeout: 20000,
            dataType: "json",
            data: {
                "from_id": '${from_id}',
                "to_id": '${aaa102}',
                "datetime": getNowFormatDate(),
                "content": "${from_name}客服 竭诚为您服务!",
                "from_name": '${from_name}'
            },
            success: function (res) {
                if (res.status === '200') {
                    if (ws == null)
                        openWebsocket();
                    setTimeout(() => {
                        $(".main").css("display", "inline");
                    }, 100);
                }
            },
            error: function () {
                console.log("消息发送错误!");
            }
        });
    }

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
        var pic_id = curr_from;
        var timeout = null;
        //判断是否为当前用户发送的消息
        if (from !== curr_from) {
            type = 'other';
            pic_id = from;
            //如果发送者不在列表中，则加入列表
            if (curr_list.indexOf(from) === -1) {
                curr_list.push(from);

                //消息接收框
                var newsList_str = '<ul class="newsList" id="newsList-' + from + '" style="display:none;"></ul>';
                $('.news-top').append(newsList_str);

                //左侧头像框
                var listBox_str = '<div class="list-box" id="list-box-' + from + '">' +
                    '<img class="chat-head" src="${path}/images/upload/user_' + from + '.jpg" alt="">' +
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
        //添加消息
        var str = '<li class="' + type + '"><div class="avatar">' +
            '<img src="${path}/images/upload/user_' + pic_id + '.jpg" alt=""></div>' +
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
</script>