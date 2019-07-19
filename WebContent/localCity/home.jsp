<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<%
	if(request.getAttribute("isSendRedirect") ==null)
	{
		response.sendRedirect(basePath+"/localCity/home.html");
	}
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>eGoͬ��</title>
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/skin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/home.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=path %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
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
		<%@include file="/localCity/navigate.jsp" %>
		<%--���������� --%>
		<%@ include file="/localCity/navSearch.jsp" %>
		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--�ֲ� -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
			<%--
			<c:forEach items="${loopShow }" var="Img">
				<li class="banner1">
				<!--��Ʒ���� -->
				<c:if test="${Img.aad303=='00' }">
				<a href="<%=path%>/shop/detail.html?aId=${Img.aad302 }&productId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad302 }.jpg" /></a>
				</c:if>
				<!--�������� -->
				<c:if test="${Img.aad303=='01' }">
				<a href="<%=path%>/shop/home.html?aId=${Img.aad302 }&shopId=${Img.aad306}"><img src="<%=path%>/images/advertise/${Img.aad302 }.jpg" /></a>
				</c:if>
				</li>
			</c:forEach> --%>
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
				</li>
			</ul> 
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
			    })
			</script>
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
							<%-- <%@include file="/home/productType.jsp" %>--%>
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
			<!--�������-->
			<div id="serviceSort" class="am-g am-g-fixed recommendation">
				<%@include file="/localCity/serviceSort.jsp" %>
			</div>
			<!--�����Ƽ�-->
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
					<h4>����������</h4>
					<h3>���������� �Ż���ͣ</h3>
					<span class="more "> 
						<a href="# ">ȫ��������<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a> 
					</span>
				</div>
				<div class="am-g am-g-fixed service-101">
				</div>
				<script type="text/javascript">
				$(function(){
					$.ajax({
						url:"<%=path%>/service.ajax",
						type:"post",
						dataType:"json",
						timeout:20000,
						data:{
							"type":"1",
							"location":myGeoLocation
						},
						success:function(res,status){
							console.log(res.services.toString());
							var services=res.services;
							var n=services.length;
							var html="";
							for(var i=0;i<n;i++){
								var service=services[i]
								html+=  "<div class='service-body'>"+
										"	<div class='am-u-sm-3 '>"+
										"		<div class='icon-sale one'></div>"+
										"		<h4>�Ż�</h4>"+
										"		<div class='activityMain'>"+
										"			<a href='/ego/localCity/companyDetail.html?id="+service.aac102+"'><img src='/ego/images/service/"+service.aac102+".jpg'></img></a>"+
										"		</div>"+
										"		<div class='info'>"+
										"			<h3>"+service.aac103+"</h3>"+
										"		</div>"+
										"	</div>"+
										"	<div class='service-intro'>"+
										"		<div class='service-intro-item'>"+
										"			<p class='title'>����������</p>"+
										"			<P class='value'>"+service.aac103+"</P>"+
										"		</div>"+
										"		<div class='service-intro-item'>"+
										"			<p class='title'>��������</p>"+
										"			<P class='value'>"+service.aac106+"</P>"+
										"		</div>"+
										"		<div class='service-intro-item'>"+
										"			<p class='title'>��˾��ַ</p>"+
										"			<P class='value'>"+service.aac104+"</P>"+
										"		</div>"+
										"		<div class='service-intro-item'>"+
										"			<p class='title'>�ۺ�����</p>"+
										"			<P class='value'>"+service.aac110+"</P>"+
										"		</div>"+
										"		<div class='service-intro-item'>"+
										"			<p class='title'>��˾�绰</p>"+
										"			<P class='value'>"+service.aac111+"</P>"+
										"		</div>"+
										"	</div>"+
										"</div>";
							}
							$(".service-101").html(html);
						},
						error:function(res,status){
							console.log("�������!");
						}
					});
				});
				</script>
				<div class="clear "></div>
				<div id="f1">
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
								    <img src="<%=path %>/images/advertise/${item2.aad302}.jpg" />
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