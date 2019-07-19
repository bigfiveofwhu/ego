<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>${info.aac203 }-��������</title>
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="<%=path%>/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/localCity/style.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/localCity/serviceDetail.css" rel="stylesheet" />
		<link href="${path }/css/localCity/navigate.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="<%=path%>/basic/js/quick_links.js"></script>
		<script type="text/javascript" src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="<%=path%>/js/list.js"></script>
	</head>
	<body>
		<!--���������� -->
		<%@include file="/localCity/navigate.jsp" %>
		<!--����������-->
		<%@include file="/localCity/navSearch.jsp" %>
		<div class="clear"></div>
        <b class="line"></b>
			<div class="listMain">
				<!--����-->
			<div class="nav-table">
			   <div class="long-title"><span class="all-goods">ȫ������</span></div>
			   <div class="nav-cont">
					<ul>
						<li class="index"><a href="#">��ҳ</a></li>
                              <li class="qc"><a href="#">����</a></li>
                              <li class="qc"><a href="#">��ʱ��</a></li>
                              <li class="qc"><a href="#">�Ź�</a></li>
                              <li class="qc last"><a href="#">���װ</a></li>
					</ul>
				    <div class="nav-extra">
				    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>�ҵĸ���
				    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				    </div>
				</div>
			</div>
			<ol class="am-breadcrumb am-breadcrumb-slash">
				<li><a href="/localCity/home.heml">��ҳ</a></li>
				<li><a href="/localCity/search.html">����</a></li>
				<li class="am-active">${info.servicetype}</li>
			</ol>
			<script type="text/javascript">
				$(function() {
					$('.flexslider').flexslider({
						animation: "slide",
						start: function(slider) {
							$('body').removeClass('loading');
						}
					});
				});
				$(window).load(function() {
					
				});
			</script>
			<div class="scoll">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
						<%-- 
							<li>
								<img src="<%=path%>/images/01.jpg" title="pic" />
							</li>
							<li>
								<img src="<%=path%>/images/02.jpg" />
							</li>
							<li>
								<img src="<%=path%>/images/03.jpg" />
							</li>--%>
						<c:forEach items="${imgList }" var="img" varStatus="i">
						<c:if test="${i.count==1 }">
						    <li>
								<img src="<%=path%>${img}" title="pic" />
							</li>
						</c:if>
						<c:if test="${i.count!=1 }">
						    <li>
								<img src="<%=path%>${img}" />
							</li>
						</c:if>
						</c:forEach>
						</ul>
					</div>
				</section>
			</div>
				<!--�Ŵ�-->
				<div class="item-inform">
					<div class="clearfixRight">
						<!--�������-->
						<!--����-->
						<div class="tb-detail-hd">
							<h1>${info.aac203 }</h1>
						</div>
						<div class="tb-detail-list">
							<!--�۸�-->
							<div class="service-info">
								<div class="itemInfo">
									<p class="item_title">��&emsp;��:</p>
									<p class="pname"><b class="item_info">${info.servicetype }</b> </p>                                 
								</div>
								<div class="itemInfo">
									<p class="item_title">����ʽ:</p>
									<p class="pname"><b class="item_info">${info.servicemethod }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">��ϵ��ʽ:</p>
									<p class="pname"><b class="item_info">�绰:${info.aac209 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">��&emsp;ַ:</p>
									<p class="pname"><b class="item_info">${info.aac104 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">��������:</p>
									<p class="pname"><b class="item_info">${info.aac207 }</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">����۸�:</p>
									<p><b class="item_info">${info.aac206 }Ԫ</b></p>									
								</div>
								<div class="itemInfo">
									<p class="item_title">��˾����:</p>
									<p style="margin-right: 20px;"><b class="item_info">${info.aac103 }</b></p>	
									<p onclick="location.href='<%=path %>/localCity/companyDetail.html?id=${info.aac102}'" class="item_pag">���빫˾��ҳ</p>								
								</div>
								<div class="itemInfo">
									<p class="item_title">�ۺ�����:</p>
									<p><b class="item_info">${info.aac110 }</b></p>									
								</div>
								<div class="clear"></div>
							</div>
							<!--����-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">������</span><span class="tm-count">1015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">�ۼ�����</span><span class="tm-count">6015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">�ۼ�����</span><span class="tm-count">640</span></div>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
						<div class="pay">
							<div class="pay-opt">
							<a href="home.html"><span class="am-icon-home am-icon-fw">��ҳ</span></a>
							<a><span class="am-icon-heart am-icon-fw">�ղ�</span></a>
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="��˰�ť����һ��ȷ�Ϲ�����Ϣ" onclick="">�����µ�</a>
								</div>
							</li>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<!-- introduce-->
				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>		    
						     	<div class="mt">
						            <h2>�����ֿ�</h2>        
					            </div>
							      <li class="first">
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		����ֻ����_�������ӡ���ʳ����ز���������������ԭζ
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>��35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                 
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		����ֻ����_�������ӡ���ʳ����ز���������������ԭζ
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>��35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		����ֻ����_�������ӡ���ʳ����ز���������������ԭζ
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>��35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		����ֻ����_�������ӡ���ʳ����ز���������������ԭζ
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>��35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="<%=path%>/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		����ֻ����_��������218g����ʳ����ز���������������ԭζ
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>��35.90</strong></div>
							      </li>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#"><span class="index-needs-dt-txt">ȫ������</span></a>
								</li>
								<li>
									<a href="#"><span class="index-needs-dt-txt">����ϲ��</span></a>
								</li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active">
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>${grade*10000/100.0 }<span>%</span></strong><br> <span>������</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>���ӡ��</dt>                    
                                            <dd class="p-bfc">
                                       			<q class="comm-tags"><span>ζ������</span><em>(2177)</em></q>
                                       			<q class="comm-tags"><span>��������</span><em>(1860)</em></q>
                                       			<q class="comm-tags"><span>�ڸк�</span><em>(1823)</em></q>
                                       			<q class="comm-tags"><span>��Ʒ����</span><em>(1689)</em></q>
                                       			<q class="comm-tags"><span>���ɿ�</span><em>(1488)</em></q>
                                       			<q class="comm-tags"><span>��������</span><em>(1392)</em></q>
                                       			<q class="comm-tags"><span>�۸����</span><em>(1119)</em></q>
                                       			<q class="comm-tags"><span>�ؼ����</span><em>(865)</em></q>
                                       			<q class="comm-tags"><span>Ƥ�ܱ�</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>ȫ������</span>
													<span class="tb-tbcr-num">(${AllComment })</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>����</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>����</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>����</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>
									<ul class="am-comments-list am-comments-list-flip">
									<%-- 
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">l***4 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��10��28�� 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															û��ɫ���ů�͡���������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ������&nbsp;&nbsp;���룺2XL
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">h***n (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��25�� 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															ʽ������������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺L
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">l***4 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��10��28�� 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															û��ɫ���ů�͡���������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ������&nbsp;&nbsp;���룺2XL
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">h***n (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��25�� 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															ʽ������������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺L
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">l***4 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��10��28�� 11:33</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															û��ɫ���ů�͡���������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ������&nbsp;&nbsp;���룺2XL
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">b***1 (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��02�� 17:46</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															������˿����������ûɫ���ɫ�ÿ���������·����ӵ�թƭ�绰���Һܺ�����������ô֪������������·������һ�֪���ҵĵ绰�ģ�
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺S
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										<li class="am-comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/hwbn40x40.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">h***n (����)</a>
														<!-- ������ -->
														������
														<time datetime="">2015��11��25�� 12:48</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															ʽ������������
														</div>
														<div class="tb-r-act-bar">
															��ɫ���ࣺ���ʻ�&nbsp;&nbsp;���룺L
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>--%>
										<c:forEach items="${comments }" var="comment">
											<!-- �������� -->
											<a href="">
												<img class="am-comment-avatar" src="<%=path%>/images/no-img_mid_.jpg" />
												<!-- ������ͷ�� -->
											</a>
											<div class="am-comment-main">
												<!-- ������������ -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">���۱���</h3>-->
													<div class="am-comment-meta">
														<!-- ����Ԫ���� -->
														<a href="#link-to-user" class="am-comment-author">${comment.aaa103} (����)</a>
														<!-- ������ -->
														������
														<time datetime="">${comment.aac505 }</time>
													</div>
												</header>
												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${comment.aac503 }
														</div>
														<div class="tb-r-act-bar">
															�������֣�${comment.aac507}
														</div>
													</div>
												</div>
												<!-- �������� -->
											</div>
										</li>
										</c:forEach>
									</ul>
									<div class="clear"></div>
									<!--��ҳ -->
									<ul class="am-pagination am-pagination-right">
										<c:if test="${AllComment==0}">	
											<li class="am-disabled"><a href="#">&laquo;</a></li>
											<li class="am-active"><a href="#">1</a></li>	
											<li><a href="#">&raquo;</a></li>
										</c:if>
										<c:if test="${AllComment!=0}">
											<li class="am-disabled"><a href="#">&laquo;</a></li>
										<c:forEach begin="1" end="${(AllComment-1)/12+1}" varStatus="i">
										<c:if test="${i.count==1 }">
											<li class="am-active"><a href="#">1</a></li>
										</c:if>
										<c:if test="${i.count!=1 }">
											<li><a href="#">${i.count}</a></li>
										</c:if>
										</c:forEach>
											<li><a href="#">&raquo;</a></li>
										</c:if>
										<%-- 
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>--%>
									</ul>
									<div class="clear"></div>
									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">����ǰ��鿴����Ʒ�� <a href="#" target="_blank">���ﱣ��</a>����ȷ�����ۺ���Ȩ�档</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="<%=path%>/images/imgsearch1.jpg" />
													<p>����Ʒ����_�������ӡ���ʳ����ز�����
														<span>��������������ζ</span></p>
													<p class="price fl">
														<b>&yen;</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<!--��ҳ -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<%@include file="/footer.jsp" %>
					</div>

				</div>
			</div>
			<!--�˵� -->
			<%@include file="/rMenu.jsp" %>
	</body>
</html>