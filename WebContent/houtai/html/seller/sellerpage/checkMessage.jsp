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
	<link rel="stylesheet" type="text/css" href="<%=path %>/houtai/css/message/bbb.css">         <!-- ��Ϣ��css -->
	<script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${path}/js/message/websocket.js"></script>
</head>
<body>
<div class="main">
    <div class="top">
        <div class="top-left">
            <div class="header">
            <img src="${path}/images/upload/user_${aaa102}.jpg" alt="${aaa103}" style="border-radius:75px;width: 48px;"/>
            </div>
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
                    <button class="sendBtn">����</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/js/message/websocket.js"></script>
<script>
    var curr_from = '${aaa102}';//��ǰ�û�id
    var curr_from_name = '${aaa103}';//��ǰ�û�����
    var curr_to = '';//��ǰѡ�н�����id
    var curr_list = [];//��ǰ�б��н�����
    var news_top = document.querySelector('.news-top');

    var ws=null;
	ws = new WS("ws://" + location.host + "${pageContext.request.contextPath}" + "/websocket/" + curr_from);
    ws.websocket.onmessage = function (event) {
        createInfo(event.data);
    };
	function openChart(){
		var id='${aaa102}';
		if(id==''){
			alert("���ȵ�¼!");
			return;
		}
		$.ajax({
			url:"${path}/initChat.ajax",
			type:"post",
			timeout:20000,
			dataType:"json",
			data:{
				"from_id":'${from_id}',
				"to_id":'${aaa102}',
				"datetime":getNowFormatDate(),
				"content":"���!",
				"from_name":'${from_name}'
			},
			success:function(res,status){
				if(res.status=='200'){
					send101();
					setTimeout(()=>{
						$(".main").css("display","inline");
					},1000);
				}
			},
			error:function(res,status){
				console.log("��Ϣ���ʹ���!");
			}
		});
	}
    //���Ͱ�ť�����̨������Ϣ��ͬʱ����Ϣչʾ��ǰ��
    $('.sendBtn').on('click', function () {
    	if(ws==null) return;
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
    	if(ws==null) return;
        var jsonObject = JSON.parse(value);
        var from = jsonObject.from_id;
        var to = jsonObject.to_id;
        var datetime = jsonObject.datetime;
        var content = jsonObject.content;
        var fromName = jsonObject.from_name;

        var type = 'self';
        var target;
        var list_box_id;
        var pic_id=curr_from;
        //�ж��Ƿ�Ϊ��ǰ�û����͵���Ϣ
        if (from !== curr_from) {
            type = 'other';
			pic_id=from;
            //��������߲����б��У�������б�
            if (curr_list.indexOf(from) === -1) {
                curr_list.push(from);

                //��Ϣ���տ�
                var newsList_str = '<ul class="newsList" id="newsList-' + from + '" style="display:none;"></ul>';
                $('.news-top').append(newsList_str);

                //���ͷ���
                var listBox_str = '<div class="list-box" id="list-box-' + from + '">' +
                    '<img class="chat-head" src="${path}/images/upload/user_'+from+'.jpg" alt="">' +
                    '<div class="chat-rig">' +
                    '<p class="title">' + fromName + '(' + from + ')' + '</p>' +
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
                    //�޸�������ϢΪ�Ѷ�
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
        //�����Ϣ
        var str = '<li class="' + type + '"><div class="avatar">' +
            '<img src="${path}/images/upload/user_'+pic_id+'.jpg" alt=""></div>' +
            '<div class="msg"><p class="msg-time">' + datetime + '</p>' +
            '<p class="msg-text">' + content + '</p></div></li>';
        target.append(str);
        //����Ϣ����ʱ��������Ϣչʾ�������������
        news_top.scrollTop = news_top.scrollHeight;
        //����������б����ָĳɵ�ǰ��Ϣ
        $('#list-box-' + list_box_id + ' .text').text(content);
    }

    //������ɺ��Զ�ѡ�е�һ��
    setTimeout(function () {
        $('.list-box:first').click();
    }, 1000);

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
</script>
</body>
</html>