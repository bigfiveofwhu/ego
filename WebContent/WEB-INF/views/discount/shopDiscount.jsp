<%@page import="java.util.Map"%>
<%@page import="java.util.List" %>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<link rel="stylesheet" href="/ego/layui/css/layui.css">
<meta charset="GBK">
<title></title>
</head>
<body>


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

		.stampSize{
			width: 387px;
            height: 140px;
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
    


<div class="container mt-4 ml-4">
	<%--aab501(流水) ,aab502(卡券类型),aab503(优惠值),aab504(条件),aab505(持续时间),aab506(数量) --%>
		<%double discount; 
		int index=0;%>
		<c:choose>
			<c:when test="${empty shopCoupons }">
				<h1>还未添加任何优惠券</h1>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${shopCoupons}" var="item">
				<%String str=((List<Map<String,String>>)request.getAttribute("shopCoupons")).get(index++).get("aab503"); %>
					<%discount=Double.parseDouble(str); %>
					
					<c:choose>
						<c:when test="<%=discount<20 %>">
							<div class="stamp stamp01 w-wuto float-left mr-4" id="${item.aab501}">
						</c:when>
						<c:when test="<%=discount<50 %>">
							<div class="stamp stamp02 w-wuto float-left  mr-4" id="${item.aab501}">
						</c:when>
						<c:when test="<%=discount<100 %>">
							<div class="stamp stamp03 w-wuto float-left mr-4" id="${item.aab501}">
						</c:when>
						<c:otherwise>
							<div class="stamp stamp04 w-wuto float-left mr-4" id="${item.aab501}">
						</c:otherwise>
					</c:choose>
					            <div class=" par  w-auto">
						            <c:if test="${item.aab502=='1'}"><p>无条件红包</p></c:if>
						            <c:if test="${item.aab502=='2'}"><p>满减红包</p></c:if>
						            <sub class="sign">￥</sub><span>${item.aab503}</span>
						            <sub>优惠券</sub>
					            	<c:if test="${item.aab502=='2'}"><p >订单满${item.aab504}元</p></c:if>
					            </div>
					            <div class="copy w-auto mt-4">有效期<p>${item.aab505 }天</p></div>
			       			 </div><!-- stamp结束位置 -->
			     </c:forEach>
			</c:otherwise>
		</c:choose>
       
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>

</body>
</html>
