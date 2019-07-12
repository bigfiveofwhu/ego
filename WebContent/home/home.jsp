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
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/skin.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>
<body>
	<div class="hmtop">
		<%--���������� --%>
		<%@include file="/navigate.jsp" %>
		<%--���������� --%>
		<div class="nav white">
		<div class="logo">
			<img src="<%=path%>/images/logo.png" />
		</div>
		<div class="logoBig">
			<li>
			<img src="<%=path%>/images/logobig.png" />
			</li>
		</div>
		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="<%=path %>/search.html">
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="����" autocomplete="off"> 
				<input id="ai-topsearch" class="submit am-btn" value="����" index="1" type="submit">
			</form>
		</div>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="banner">
		<!--�ֲ� -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
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
			</li></ul> 
			<script type="text/javascript">
			    $(function (){
			    	$.ajax({
			    		url:"",
			    		data:"",
			    		dataType:"",
			    		success:function (){
			    			
			    		},
			    		error:function(){
			    			
			    		}
			    	});
			    	console.log($(".am-slides").html());
			    })
			</script>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<div class="long-title">
				<span class="all-goods">ȫ������</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">��ҳ</a>
					</li>
					<li class="qc"><a href="#">����</a>
					</li>
					<li class="qc"><a href="#">��ʱ��</a>
					</li>
					<li class="qc"><a href="#">�Ź�</a>
					</li>
					<li class="qc last"><a href="#">���װ</a>
					</li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>�ҵĸ���
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--��ߵ��� -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul class="category-list" id="js_climit_li">
							</ul>
						</div>
					</div>
				</div>
			</div>
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
						   <c:when test="${session_uid!=null}">
				   				<div class="m-baseinfo">
								<a href="<%=path%>/person/information.jsp"> 
								<img src="<%=path%>/images/getAvatar.do.jpg"> </a> 
								<em> Hi,<span class="s-name">${session_username}</span> <a href="#"><p>��������Żݻ</p> </a> </em>
								</div>
							</c:when>
							<c:otherwise>
								<div class="m-baseinfo">
									<a href="#"> 
									<img src="<%=path%>/images/getAvatar.do.jpg"> 
									</a> 
									<em> Hi,<span class="s-name">С����</span> <a href="#"><p>��������Żݻ</p> </a> </em>
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
   <%--  <iframe id="google_ads_frame3" name="google_ads_frame3" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1341152667756824&amp;output=html&amp;h=90&amp;slotname=5754098212&amp;adk=1811165632&amp;adf=3847671124&amp;w=728&amp;lmt=1562068081&amp;guci=2.2.0.0.2.2.0.0&amp;format=728x90&amp;url=https%3A%2F%2Fconvertio.co%2Fzh%2Fpng-svg%2F&amp;flash=0&amp;wgl=1&amp;dt=1562068081169&amp;bpp=17&amp;bdt=307&amp;fdt=18&amp;idt=18&amp;shv=r20190626&amp;cbv=r20190131&amp;saldr=aa&amp;abxe=1&amp;prev_fmts=728x90%2C728x90&amp;correlator=7564648527725&amp;frm=20&amp;pv=1&amp;ga_vid=1553896000.1562067597&amp;ga_sid=1562068081&amp;ga_hid=2108996575&amp;ga_fc=0&amp;iag=0&amp;icsg=41130&amp;dssz=13&amp;mdo=0&amp;mso=0&amp;u_tz=480&amp;u_his=3&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=588&amp;ady=926&amp;biw=1903&amp;bih=888&amp;scr_x=0&amp;scr_y=0&amp;eid=21060853%2C368226351%2C368226361%2C633794000%2C633794002&amp;oid=3&amp;ref=https%3A%2F%2Fconvertio.co%2Fzh%2Fimage-converter%2F&amp;rx=0&amp;eae=0&amp;fc=656&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1920%2C888&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=24&amp;bc=31&amp;osw_key=2046013984&amp;ifi=3&amp;uci=3.8obyei4cvcy4&amp;fsb=1&amp;xpc=njCIeAerN8&amp;p=https%3A//convertio.co&amp;dtd=27" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="3.8obyei4cvcy4" data-google-query-id="CPrY4YiVluMCFdMlrQYd1s4Msg" data-load-complete="true"></iframe>
           --%> 
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--�����Ƽ� -->
			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
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
			<%-- 	<%
					//���������
					
					//�����������session��
					request.getSession().setAttribute("TOKEN_IN_SESSION", ${list4 });
				%> --%>
				<c:forEach items="${list4 }" varStatus="" var="item3">

					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>${item3.name }</h3>
							<h4>${item3.price }</h4>
						</div>
						<div class="recommendationMain one">
							<a href="${url}/intrServlet?goodId=${item3.id}"><img src="${item3.path }"></img>
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
					<span class="more "> <a href="# ">ȫ���<i
							class="am-icon-angle-right" style="padding-left:10px ;"></i> </a> </span>
				</div>
				<div class="am-g am-g-fixed ">

					<div class="am-u-sm-3 ">
						<div class="icon-sale one"></div>
						<h4>��ֵ</h4>
						<div class="activityMain ">
							<img src="<%=path%>/images/activity.jpg "></img>
						</div>
						<div class="info ">
							<h3>����������ѡ</h3>
						</div>													
					</div>

					<c:forEach items="${sessionScope.list1}" var="item" varStatus="">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>
							<h4>��ɱ</h4>
							<div class="activityMain ">
							    <!--  ���ͼƬ��ʾͼƬ��ϸ -->
								<%-- <a href="${item.website}"><img src="${item.path }"></img> </a> --%>
								<a href="${url}/intrServlet?goodId=${item.id}"><img src="${item.path }"></img> </a>
							</div>
							<div class="info ">
								<h3>����������ѡ</h3>
							</div>
						</div>

					</c:forEach>

				</div>

				<div class="clear "></div>
				<div id="f1">
					<!--���-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>��Ʒ</h4>
							<h3>ÿһ����Ʒ����һ������</h3>
							<div class="today-brands ">
								<a href="# ">�𻨸�</a> 
								<a href="# ">��Ƥ��</a> 
								<a href="# ">���Ӹ�</a>
								<a href="# ">����</a>
								<a href="# ">ͭ����</a>
								<a href="# ">�㶹��</a>
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
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b> 
								    </span> 
								</a>
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b>
								    </span> 
								</a>
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b>
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b> 
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b>
								     </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b>
								    </span> 
								</a>
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

						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">ѩ֮���ͷ��</div>
								<div class="sub-title ">&yen;13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="<%=path%>/images/2.jpg" /> </a>
						</div>
						
						<div class="am-u-sm-7 am-u-md-4 text-two">
							<div class="outer-con ">
								<div class="title ">ѩ֮���ͷ��</div>
								<div class="sub-title ">&yen;13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
							<a href="# "><img src="<%=path%>/images/2.jpg" /> </a>
						</div>

						<c:forEach items="${sessionScope.list2}" var="item1" varStatus="">

							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">${item1.name }</div>
									<div class="sub-title ">&yen;${item1.price }</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div>
								<!-- ��Ʒ -->
								<%-- <a href="${item1.website }"><img src="${item1.path }" /> </a> --%>
								<a href="${url}/intrServlet?goodId=${item1.id}"><img src="${item1.path }" /> </a>
							</div>

						</c:forEach>
					</div>
					<div class="clear "></div>
				</div>
				<div id="f2">
					<!--���-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>���</h4>
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
								<a class="outer" href="#">
								    <span class="inner">
								        <b class="text">����</b> 
								    </span> 
								</a> 
								<a class="outer" href="#">
								    <span class="inner">
								         <b class="text">����</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">����</b>
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">����</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">����</b> 
								     </span> 
								 </a> 
								 <a class="outer" href="#">
								     <span class="inner">
								         <b class="text">����</b>
								     </span> 
								 </a>
							</div>
							<a href="# "> 
							    <img src="<%=path%>/images/act1.png " />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
								</div> 
							</a>
							<div class="triangle-topright"></div>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="<%=path%>/images/6.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> </a>
						</div>
						<c:forEach items="${sessionScope.list3}" var="item2" varStatus="">

							<div class="am-u-sm-4 text-four">
							<!-- �����Ϣ -->
								<%-- <a href="${item2.website }"> <img src="${item2.path }" /> --%>
								<a href="${url}/intrServlet?goodId=${item2.id}">
								    <img src="${item2.path }" />
									<div class="outer-con ">
										<div class="title ">${item2.name }</div>
										<div class="sub-title ">&yen;${item2.price }</div>
										<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
									</div>
								</a>
							</div>
						</c:forEach>

						<div class="am-u-sm-4 text-four">
							<a href="# "> <img src="<%=path%>/images/7.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>

						<div class="am-u-sm-4 text-four ">
							<a href="# "> 
							<img src="<%=path%>/images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div> 

						<div class="am-u-sm-4 text-four ">
							<a href="# ">
							 <img src="<%=path%>/images/8.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> 
							    <img src="<%=path%>/images/9.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="# "> 
							    <img src="<%=path%>/images/10.jpg" />
								<div class="outer-con ">
									<div class="title ">ѩ֮���ͷ��</div>
									<div class="sub-title ">&yen;13.8</div>
									<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
								</div> 
							</a>
						</div>
					</div>
					<div class="clear "></div>
				</div>
				<%@include file="/footer.jsp" %>
			</div>
		</div>
	</div>
	<!--���� -->
	<div class="navCir">
		<li class="active"><a href="home.html"><i class="am-icon-home "></i>��ҳ</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>����</a></li>
		<li><p onclick="javascript:window.open('/shoppingPro/shoppingCart?cmd=showCart')">���ﳵ</p></li>
		<li><a href="<%=path%>/person/index.html"><i class="am-icon-user"></i>�ҵ�</a></li>
	</div>
	<!--�˵� -->
	<%@include file="/rMenu.jsp" %>
	<script>
		window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="<%=path %>/basic/js/quick_links.js "></script>
</body>
</html>