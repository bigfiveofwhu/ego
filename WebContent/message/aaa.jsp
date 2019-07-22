<%@ page pageEncoding="GBK" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PC聊天</title>
    <link rel="stylesheet" href="bg.jpg">
    <style>
        * {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 14px;
            text-decoration: none;
            color: black;
            outline: none;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        .main {
            height: 800px;
            width: 1005px;
            margin: auto;
            box-shadow: 0 0 3px 5px #e1e1e1;
        }

        .main .top {
            width: 1005px;
            height: 60px;
            background-color: #3bb4f2;
        }

        .main .top .top-left {
            height: 100%;
            width: 200px;
            float: left;
            position: relative;
        }

        .main .top .top-left .header {
            height: 48px;
            width: 48px;
            border-radius: 50%;
            line-height: 60px;
            display: inline-block;
            margin: 6px;
            border: 1px solid transparent;
        }

        .main .top .top-left .header:hover {
            border: 1px solid white;
        }

        .main .box {
            width: 100%;
            height: 740px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .main .box .chat-list {
            float: left;
            width: 250px;
            height: 100%;
            background-color: #f4f4f4;
            overflow-y: scroll;
        }

        .main .box .chat-list .list-box {
            height: 80px;
            width: 250px;
        }

        .main .box .chat-list .list-box.select {
            background-color: #dbdbdb;
        }

        .main .box .chat-list .list-box:hover {
            background-color: #dbdbdb;
        }

        .main .box .chat-list .list-box img.chat-head {
            height: 50px;
            width: 50px;
            border-radius: 50%;
            border: 1px solid #f4f4f4;
            margin: 15px 10px;
        }

        .main .box .chat-list .list-box .chat-rig {
            float: right;
            height: 50px;
            width: 178px;
            margin: 15px 0;
        }

        .main .box .chat-list .list-box .chat-rig .title {
            font-weight: 600;
            font-size: 17px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .main .box .chat-list .list-box .chat-rig .text {
            font-size: 12px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #6C6C6C;
        }

        .main .box .box-right {
            float: left;
            width: 750px;
            height: 100%;
        }

        .main .box .box-right .receiveBox {
            width: 752px;
            height: 560px;
        }

        .main .box .box-right .receiveBox .nav-top {
            height: 45px;
            width: 100%;
        }

        .main .box .box-right .receiveBox .nav-top p {
            line-height: 45px;
            font-size: 18px;
            font-weight: 600;
            margin-left: 25px;
        }

        .main .box .box-right .receiveBox .news-top {
            height: 510px;
            border-top: 1px solid #6C6C6C;
            border-bottom: 1px solid #6C6C6C;
            overflow-y: scroll;
        }

        .main .box .box-right .receiveBox .news-top ul {
            height: 100%;
            width: 100%;
        }

        .main .box .box-right .receiveBox .news-top ul li {
            margin: 10px;
            min-height: 80px;
            position: relative;
            overflow: hidden;
        }

        .main .box .box-right .receiveBox .news-top ul li .avatar img {
            height: 30px;
            width: 30px;
            border-radius: 50%;
        }

        .main .box .box-right .receiveBox .news-top ul li .msg {
            top: -10px;
            margin: 8px;
            min-height: 80px;
        }

        .main .box .box-right .receiveBox .news-top ul li .msg .msg-text {
            background-color: #eeeeee;
            border-radius: 15px;
            padding: 15px;

            word-break: break-all;
            word-wrap: break-word;
            overflow-wrap: break-word;
            white-space: normal;
        }

        .main .box .box-right .receiveBox .news-top ul li.self .msg .msg-text {
            margin-left: 50px;
        }

        .main .box .box-right .receiveBox .news-top ul li.other .msg .msg-text {
            margin-right: 50px;
        }

        .main .box .box-right .receiveBox .news-top ul li.self .msg .msg-time {
            text-align: right;
        }

        .main .box .box-right .receiveBox .news-top ul li.other .msg .msg-time {
            text-align: left;
        }

        .main .box .box-right .receiveBox .news-top ul li.other .avatar {
            position: absolute;
            left: 0;
            top: 0;
        }

        .main .box .box-right .receiveBox .news-top ul li.other .msg {
            position: absolute;
            left: 40px;
        }

        .main .box .box-right .receiveBox .news-top ul li.self .avatar {
            position: absolute;
            right: 0;
            top: 0;
        }

        .main .box .box-right .receiveBox .news-top ul li.self .msg {
            position: absolute;
            right: 40px;
        }

        .main .box .box-right .sendto {
            width: 752px;
            height: 180px;
        }

        .main .box .box-right .sendto .but-text textarea {
            border: none;
            font-size: 22px;
            margin-left: 20px;
            width: 732px;
            height: 100px;
        }

        .main .box .box-right .sendto .but-text .button {
            float: right;
            padding: 5px 25px;
            background-color: #3bb4f2;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="top">
        <div class="top-left">
            <div class="header"></div>
        </div>
    </div>
    <div class="box">
        <div class="chat-list">
            <div class="list-box">
                <img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig">
                    <p class="title">公众号</p>
                    <p class="text">紧急！！！</p>
                </div>
            </div>
            <div class="list-box select"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">宋温暖</p>
                    <p class="text">在？</p></div>
            </div>
            <div class="list-box"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">安安安</p>
                    <p class="text">你好，我这里有个任务帮我做一下</p></div>
            </div>
            <div class="list-box">
                <img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig">
                    <p class="title">公众号</p>
                    <p class="text">紧急！！！</p>
                </div>
            </div>
            <div class="list-box"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">宋温暖</p>
                    <p class="text">在？</p></div>
            </div>
            <div class="list-box"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">安安安</p>
                    <p class="text">你好，我这里有个任务帮我做一下</p></div>
            </div>
            <div class="list-box">
                <img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig">
                    <p class="title">公众号</p>
                    <p class="text">紧急！！！</p>
                </div>
            </div>
            <div class="list-box"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">宋温暖</p>
                    <p class="text">在？</p></div>
            </div>
            <div class="list-box"><img class="chat-head" src="bg.jpg" alt="">
                <div class="chat-rig"><p class="title">安安安</p>
                    <p class="text">你好，我这里有个任务帮我做一下</p></div>
            </div>
        </div>
        <div class="box-right">
            <div class="receiveBox">
                <div class="nav-top">
                    <p>公众号</p>
                </div>
                <div class="news-top">
                    <ul>
                        <li class="other">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">宋温暖</p>
                                <p class="msg-text">请接下这个活</p>
                            </div>
                        </li>
                        <li class="self">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">安安安</p>
                                <p class="msg-text">你好</p>
                            </div>
                        </li>
                        <li class="other">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">Name</p>
                                <p class="msg-text">你好
                                </p>
                            </div>
                        </li>
                        <li class="self">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">Name</p>
                                <p class="msg-text">请接
                                </p>
                            </div>
                        </li>
                        <li class="other">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">Name</p>
                                <p class="msg-text">hello
                                </p>
                            </div>
                        </li>
                        <li class="other">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">Name</p>
                                <p class="msg-text">abvc
                                </p>
                            </div>
                        </li>
                        <li class="other">
                            <div class="avatar"><img src="bg.jpg" alt=""></div>
                            <div class="msg">
                                <p class="msg-time">Name</p>
                                <p class="msg-text">请接下这个活
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sendto">
                <div class="but-text">
                    <label for=""></label><textarea name="" id="" cols="110" rows="6"></textarea>
                    <a href="#" class="button">发送</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>