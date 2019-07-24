<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<%
	if(request.getAttribute("isSendRedirect") ==null)
	{
		response.sendRedirect(basePath+"/home/home.html");
	}
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>eGo��ҳ</title>
<%@include file="/head.jsp" %>
<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/skin.css" rel="stylesheet" type="text/css" />
<c:if test="${msg!=null }">
	<script type="text/javascript">
	$(function(){
		alert('${msg}');
	});
	</script>
</c:if>
</head>
<body>
	<div class="hmtop">
		<%--���������� --%>
		<%@include file="/navigate.jsp" %>
		<%--���������� --%>
		<%@ include file="/navSearch.jsp" %>
		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--�ֲ� -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
			<c:forEach items="${loopShow }" var="Img">
				<li class="banner4">
				<%--��Ʒ���� --%>
				<c:if test="${Img.aad303=='00' }">
				<a href="<%=path%>/shop/detail.html?aId=${Img.aad302 }&productId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad307 }" /></a>
				</c:if>
				<%--�������� --%>
				<c:if test="${Img.aad303=='01' }">
				<a href="<%=path%>/shop/home.html?aId=${Img.aad302 }&shopId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad307 }" /></a>
				</c:if>
				</li>
			</c:forEach>
			<%-- 
				<li class="banner1">
				<a href="introduction.html"><img src="<%=path%>/images/ad1.jpg" /></a>
				</li>
				<li class="banner2">
				<a><img src="<%=path%>/images/ad2.jpg" /> </a>
				</li>
				<li class="banner3">
				<a><img src="<%=path%>/images/ad3.jpg" /> </a>
				</li>
				<li class="banner4">
				<a><img src="<%=path%>/images/ad4.jpg" /> </a>
				</li>
				<li class="banner4">
				<a><img src="<%=path%>/images/ad4.jpg" /> </a>
				</li>--%>
			</ul> 
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<!-- �������ർ�� -->
			<%@include file="/navClassify.jsp" %>
			<!--��ߵ��� -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul class="category-list" id="js_climit_li">
							<%@include file="/home/productType.jsp" %>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(".productType").click(function(){
					var id=$(this).attr("ptype_id");
					location.href="<%=path%>/search.html?type="+id;
				});
			</script>
			<!--�ֲ�-->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document).ready(function() {
					$("li").hover(function() {
						$(".category-content .category-list li.first .menu-in").css("display","none");
						$(".category-content .category-list li.first").removeClass("hover");
					    $(this).addClass("hover");
						$(this).children("div.menu-in").css("display","block")
					},
					function() {
						$(this).removeClass("hover")
						$(this).children("div.menu-in").css("display","none")
				    });
				});
			</script>
			<!--С���� -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html">
					    <img src="<%=path%>/images/navsmall.jpg" />
						<div class="title">��Ʒ����</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
					    <img src="<%=path%>/images/huismall.jpg" />
						<div class="title">��ۻ�</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
						<img src="<%=path%>/images/mansmall.jpg" />
						<div class="title">��������</div> 
					</a>
				</div>
				<div class="am-u-sm-3">
					<a href="#">
						<img src="<%=path%>/images/moneysmall.jpg" />
						<div class="title">Ͷ�����</div>
					</a>
				</div>
			</div>

			<!--����� -->
			<div class="marqueen">
				<span class="marqueen-title">�̳�ͷ��</span>
				<div class="demo">
					<ul>
						<li class="title-first">
							<a target="_blank" href="#">
								<img src="<%=path%>/images/TJ2.jpg"/> 
								<span>[�ػ�]</span>�̳Ǳ�Ʒ1���� 
							</a>
						</li>
						<li class="title-first">
							<a target="_blank" href="#"> 
								<span>[����]</span>�̳��������ǩ��ս�Ժ���Э��
								<img src="<%=path%>/images/TJ.jpg"/>
								<p>XXXXXXXXXXXXXXXXXX</p> 
							</a>
						</li>
						<div class="mod-vip">
						<c:choose>
						   <c:when test="${aaa102!=null}">
				   				<div class="m-baseinfo">
								<a href="<%=path%>/person/index.jsp"> 
								<img src="<%=path%>/images/upload/user_${aaa102 }.jpg"> </a> 
								<em> Hi,<span class="s-name">${aaa103}</span> <a href="#"><p>��������Żݻ</p> </a> </em>
								</div>
							</c:when>
							<c:otherwise>
								<div class="m-baseinfo">
									<a href="#"> 
									<img src="<%=path%>/images/getAvatar.do.jpg"> 
									</a> 
									<em> Hi,<span class="s-name">��ӭ</span> <a href="#"><p>��������Żݻ</p> </a> </em>
								</div>
								<div class="member-logout">
									<a class="am-btn-warning btn" href="login.jsp">��¼</a>
									<a class="am-btn-warning btn" href="register.jsp">ע��</a>
								</div>
							</c:otherwise>
						</c:choose>
							<div class="member-login">
								<a href="#"><strong>0</strong>���ջ�</a> <a href="#"><strong>0</strong>������</a>
								<a href="#"><strong>0</strong>������</a> <a href="#"><strong>0</strong>������</a>
							</div>
							<div class="clear"></div>
						</div>
						<li>
						    <a target="_blank" href="#">
						    	<span>[�ػ�]</span>�����ĩ��٣�������������
						    </a>
						</li>
						<li>
							<a target="_blank" href="#">
							    <span>[����]</span>���������в��ֵ��������ӳ�
							</a>
						</li>
						<li>
						    <a target="_blank" href="#">
						        <span>[�ػ�]</span>�ҵ��ǧ����ȯ ��1��1��
						    </a>
						</li>
					</ul>
					<div class="advTip">
						<img src="<%=path%>/images/advTip.jpg" />
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--�����Ƽ� -->
			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3">
					<img src="<%=path%>/images/2016.png "/>
					<p>
						����<br>�Ƽ�
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>�������</h3>
						<h4>���긣��ƪ</h4>
					</div>
					<div class="recommendationMain one">
						<a href="introduction.html"><img src="<%=path%>/images/tj.png "></img>
						</a>
					</div>
				</div>
				<c:forEach items="${list4 }" varStatus="" var="item3">

					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>${item3.name }</h3>
							<h4>${item3.price }</h4>
						</div>
						<div class="recommendationMain one">
							<a href="<%=path %>/shop/detail.html?productId=${item3.id}"><img src="${item3.path }"></img>
							</a>
						</div>
					</div>

				</c:forEach>
			</div>
			<div class="clear "></div>
			<!--���Ż -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>�</h4>
					<h3>ÿ�ڻ �Ż���ͣ</h3>
					<span class="more "> 
						<a href="# ">ȫ���<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${activityList}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>��ɱ</h4>
							<div class="activityMain ">
							    <!--  ���ͼƬ��ʾͼƬ��ϸ -->
								<a href="<%=path %>/shop/detail.html?productId=${item.aab203}"><img src="${item.aab603 }"></img></a>
							</div>
							<div class="info ">
								<h3>${item.aab604 }</h3>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear "></div>
				<%--���ŵ��� --%>
				<div class="shopTitle ">
					<h4>���ŵ���</h4>
					<h3>���ŵ��� �Ż���ͣ</h3>
					<span class="more "> 
						<a href="# ">ȫ������<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${hotShop}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>ʵ��</h4>
							<div class="activityMain ">
							    <!--  ���ͼƬ��ʾͼƬ��ϸ -->
								<a href="<%=path %>/shop/home.html?aId=${item.aad302 }&shopId=${item.aad306}">
								<img src="<%=path%>/images/advertise/${item.aad307 }"></img></a>
							</div>
							<div class="info ">
								<h3>${item.aab103 }</h3>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear "></div>
				
				<div id="f1">
					<!--������Ʒ-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>������Ʒ</h4>
							<h3>���շ�������Ʒ</h3>
							<div class="today-brands ">
							<!--
								<a href="# ">�𻨸�</a> 
								<a href="# ">��Ƥ��</a> 
								<a href="# ">���Ӹ�</a>
								<a href="# ">����</a>
								<a href="# ">ͭ����</a>
								<a href="# ">�㶹��</a>
							-->
							</div>
							<span class="more ">
								<a href="# ">������ζ
									<i class="am-icon-angle-right" style="padding-left:10px ;"></i> 
								</a>
							</span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
							<c:forEach begin="0" end="5">
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b> 
								    </span> 
								</a>
							</c:forEach>
							</div>
							<a href="# ">
								<div class="outer-con ">
									<div class="title ">��������</div>
									<div class="sub-title ">��ʳ�����</div>
								</div> 
								<img src="<%=path%>/images/act1.png" /> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<c:forEach items="${hotProduct}" var="item1" varStatus="">
							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">${item1.aab202 }</div>
									<div class="sub-title ">&yen;${item1.aab205 }</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<!-- ��Ʒ -->
								<a href="<%=path %>/shop/detail.html?aId=${item1.aad302 }&productId=${item1.aab203}">
								<img src="<%=path %>/images/advertise/${item1.aad307 }" alt="${item1.aab202 }" /> 
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>
				<div id="f2">
					<!--��Ʒ�Ƽ�-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>������Ʒ</h4>
							<h3>���ִ�࣬��ζ����</h3>
							<div class="today-brands ">
								<a href="# ">����</a> 
								<a href="# ">����</a> 
								<a href="# ">�����Ĺ�</a> 
								<a href="# ">�̸���</a>
								<a href="# ">���Ĺ�</a> 
								<a href="# ">������</a>
							</div>
							<span class="more "> 
							    <a href="# ">������ζ
							        <i class="am-icon-angle-right" style="padding-left:10px ;"></i> 
							    </a> 
							</span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
							<c:forEach begin="0" end="5">
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b> 
								    </span> 
								</a>
							</c:forEach>
							</div>
							<a href="# "> 
							    <img src="<%=path%>/images/act1.png " />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
								</div> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<c:forEach items="${productList}" var="item2" varStatus="vs">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?productId=${item2.aab203}">
								    <img id="pro${vs.count}" src="<%=path %>${item2.aab208}" />
								    <script type="text/javascript">
								    	$(function(){
								    		var img${vs.count}='${item2.aab208}';
								    		$("#pro${vs.count}").attr("src","<%=path %>"+img${vs.count}.split(";")[0]);
								    	});
								    </script>
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>
				<div id="f3">
					<!-- ����ϲ�� -->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>����ϲ��</h4>
							<h3>���շݲ���ϲ��</h3>
							<div class="today-brands ">
								<a href="# ">����</a> 
								<a href="# ">����</a> 
								<a href="# ">�����Ĺ�</a> 
								<a href="# ">�̸���</a>
								<a href="# ">���Ĺ�</a> 
								<a href="# ">������</a>
							</div>
							<span class="more "> 
							    <a href="# ">������ζ
							        <i class="am-icon-angle-right" style="padding-left:10px ;"></i> 
							    </a> 
							</span>
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
							<c:forEach begin="0" end="5">
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">ˮ����</b> 
								    </span> 
								</a>
							</c:forEach>
							</div>
							<a href="# "> 
							    <img src="<%=path%>/images/act1.png " />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
								</div> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<c:forEach items="${guessProduct}" var="item2" varStatus="">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?aId=${item2.aad302 }&productId=${item2.aad306}">
								    <img src="<%=path %>/images/advertise/${item2.aad307}" />
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
						<%--
						<c:forEach items="${productList}" var="item2" varStatus="">
							<div class="am-u-sm-4 text-four">
								<a href="<%=path %>/shop/detail.html?productId=${item2.aab203}">
								    <img src="${productImg }" />
									<div class="outer-con ">
										<div class="title ">${item2.aab202 }</div>
										<div class="sub-title ">&yen;${item2.aab205 }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>
						 --%>
					</div>
					<div class="clear "></div>
				</div>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	</div>
	<!--���� -->
	<%@include file="/bottomGuide.jsp" %>
	<!--�˵� -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="<%=path %>/basic/js/quick_links.js "></script>

</body>
</html>