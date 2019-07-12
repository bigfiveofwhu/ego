<%@ page language="java" pageEncoding="GBK"%>
<%@include file="../framework/bootstrapHeader.jsp" %>

<style>
        .demo {
            width: 410px;
        }

        .stamp * {
            padding: 0;
            margin: 0;
            list-style: none;
            font-family: "Microsoft YaHei",'Source Code Pro', Menlo, Consolas, Monaco, monospace;
        }

        .stamp {
            width: 387px;
            height: 140px;
            padding: 0 10px;
            margin-bottom: 50px;
            position: relative;
            overflow: hidden;
        }

            .stamp:before {
                content: '';
                position: absolute;
                top: 0;
                bottom: 0;
                left: 10px;
                right: 10px;
                z-index: -1;
            }

            .stamp:after {
                content: '';
                position: absolute;
                left: 10px;
                top: 10px;
                right: 10px;
                bottom: 10px;
                box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.5);
                z-index: -2;
            }

            .stamp i {
                position: absolute;
                left: 20%;
                top: 45px;
                height: 190px;
                width: 390px;
                background-color: rgba(255,255,255,.15);
                transform: rotate(-30deg);
            }

            .stamp .par {
                float: left;
                padding: 16px 15px;
                width: 220px;
                border-right: 2px dashed rgba(255,255,255,.3);
                text-align: left;
            }

                .stamp .par p {
                    color: #fff;
                    font-size: 16px;
                    line-height: 21px;
                }

                .stamp .par span {
                    font-size: 50px;
                    color: #fff;
                    margin-right: 5px;
                    line-height: 65px;
                }

                .stamp .par .sign {
                    font-size: 34px;
                }

                .stamp .par sub {
                    position: relative;
                    top: -5px;
                    color: rgba(255,255,255,.8);
                }

            .stamp .copy {
                display: inline-block;
                padding: 21px 14px;
                width: 100px;
                vertical-align: text-bottom;
                font-size: 30px;
                color: rgb(255,255,255);
                text-align: center;
                line-height: initial;
            }

                .stamp .copy p {
                    font-size: 16px;
                    margin-top: 15px;
                }

        .stamp01 {
            background: #F39B00;
            background: radial-gradient(rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 5px, #F39B00 5px);
            background-size: 15px 15px;
            background-position: 9px 3px;
        }

            .stamp01:before {
                background-color: #F39B00;
            }

        .stamp02 {
            background: #D24161;
            background: radial-gradient(transparent 0, transparent 5px, #D24161 5px);
            background-size: 15px 15px;
            background-position: 9px 3px;
        }

            .stamp02:before {
                background-color: #D24161;
            }

        .stamp03 {
            background: #7EAB1E;
            background: radial-gradient(transparent 0, transparent 5px, #7EAB1E 5px);
            background-size: 15px 15px;
            background-position: 9px 3px;
        }

            .stamp03:before {
                background-color: #7EAB1E;
            }

            .stamp03 .copy {
                padding: 10px 6px 10px 12px;
                font-size: 24px;
            }

                .stamp03 .copy p {
                    font-size: 14px;
                    margin-top: 5px;
                    margin-bottom: 8px;
                }

                .stamp03 .copy a {
                    background-color: #fff;
                    color: #333;
                    font-size: 14px;
                    text-decoration: none;
                    padding: 5px 10px;
                    border-radius: 3px;
                    display: block;
                }


        .stamp04 {
            width: 390px;
            background: #50ADD3;
            background: radial-gradient(rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 4px, #50ADD3 4px);
            background-size: 12px 8px;
            background-position: -5px 10px;
        }

            .stamp04:before {
                background-color: #50ADD3;
                left: 5px;
                right: 5px;
            }

            .stamp04 .copy {
                padding: 10px 6px 10px 12px;
                font-size: 24px;
            }

                .stamp04 .copy p {
                    font-size: 14px;
                    margin-top: 5px;
                    margin-bottom: 8px;
                }

                .stamp04 .copy a {
                    background-color: #fff;
                    color: #333;
                    font-size: 14px;
                    text-decoration: none;
                    padding: 5px 10px;
                    border-radius: 3px;
                    display: block;
                }
    </style>
<div class="demo">
		<div class="stamp stamp01">
            <div class="par"><p>XXXXXX�ۿ۵�</p><sub class="sign">��</sub><span>50.00</span><sub>�Ż�ȯ</sub><p>������100.00Ԫ</p></div>
            <div class="copy">��ȯ<p>2015-08-13<br>2016-08-13</p></div>
            <i></i>
        </div>
        
        <div class="stamp stamp01">
            <div class="par"><p>XXXXXX�ۿ۵�</p><sub class="sign">��</sub><span>50.00</span><sub>�Ż�ȯ</sub><p>������100.00Ԫ</p></div>
            <div class="copy">��ȯ<p>2015-08-13<br>2016-08-13</p></div>
            <i></i>
        </div>

        <div class="stamp stamp02">
            <div class="par"><p>XXXXXX�ۿ۵�</p><sub class="sign">��</sub><span>50.00</span><sub>�Ż�ȯ</sub><p>������100.00Ԫ</p></div>
            <div class="copy">��ȯ<p>2015-08-13<br>2016-08-13</p></div>
            <i></i>
        </div>

        <div class="stamp stamp03">
            <div class="par"><p>XXXXXX�ۿ۵�</p><sub class="sign">��</sub><span>50.00</span><sub>�Ż�ȯ</sub><p>������100.00Ԫ</p></div>
            <div class="copy">��ȯ<p>2015-08-13<br>2016-08-13</p><a href="#">����ʹ��</a></div>
            <i></i>
        </div>

        <div class="stamp stamp04">
            <div class="par"><p>XXXXXX�ۿ۵�</p><sub class="sign">��</sub><span>50.00</span><sub>�Ż�ȯ</sub><p>������100.00Ԫ</p></div>
            <div class="copy">��ȯ<p>2015-08-13<br>2016-08-13</p><a href="#">����ʹ��</a></div>
            <i></i>
        </div>
    </div>





<%@include file="../framework/bootstrapFootter.jsp"%>