<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��������</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
			function sendComment2(vaab302)
			{
				var vform = document.getElementById("myform");
				if($("#comment2_text").val()==""){
						alert("��û����д׷��Ŷ");
					}
				else{
					$('input[name="aab404"]').val($("#comment2_text").val());
					vform.action="<%=path%>/makeComment2.html?aab302="+vaab302;
					vform.submit();
				}
			}
			
			function delComment(vaab302)
			{
				var message=confirm("ȷ��Ҫɾ��������?�⽫��Զ�޷��ָ�!")
				if(message==true){
					var vform = document.getElementById("myform");
					vform.action="<%=path%>/delComment.html?aab302="+vaab302;
					vform.submit();
				}
				
			}
			
		</script>
	</head>

	<body>
		<form id="myform" method="post">
			<input name="aab404" value="" type="hidden"/>
			<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		</form>
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--���������� -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">�ף����¼<%=session.getAttribute("aab102") %></a>
									<a href="#" target="_top">���ע��</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">�̳���ҳ</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>��������</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>���ﳵ</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>�ղؼ�</span></a></div>
						</ul>
						</div>

						<!--����������-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=path%>/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="����" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="����" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
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
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Comment&nbsp;Detail</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
					
							<div class="comment-main">
								<div class="comment-list">
									<ul class="item-list">

										
										<div class="comment-top">
											<div class="th th-price">
												<td class="td-inner">��������</td>
											</div>
											<div class="th th-item">
												<td class="td-inner">��Ʒ</td>
											</div>													
										</div>
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint">
														<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic">
													</a>
												</div>
											</li>											
											
											<li class="td td-comment">
												<div class="item-title">
													
													<div class="item-name">
														<a href="#">
															<p class="item-basic-info" align="center">${ins.aab202 }</p>
														</a>
													</div>
												</div>
												<div class="item-comment">
													<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">${ins.aab403 }</a>
													<br/>
													<div class="item-opinion" style="width:60%">��������:${ins.aab409 }��</div>
													<div class="item-opinion" style="width:60%">��������:${ins.aab411 }��</div>
													<div class="item-opinion" style="width:60%">��Ʒ����:${ins.aab410 }��</div>
													<c:choose>
													<c:when test="${ins.aab412 eq '01' }">
														<div class="filePic"><img src="<%=path%>/images/image.jpg" alt=""></div>	
													</c:when>
													</c:choose>
												
												</div>

												<div class="item-info">
													<div>
														<p class="info-little">
														<span>������:<br/>${ins.aab302 }</span> 
														</p>
														<p class="info-time">${ins.aab406 }</p>

													</div>
												</div>
											</li>

									</ul>

								</div>
							</div>
							<hr/>
							<br/><br/>
							
							
							<c:choose>
								<c:when test="${ins.aab404!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">�ҵ�׷��</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
													${ins.aab404 }
													<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab407 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose>
								<c:when test="${ins.aab405!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">�̼һظ�</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
														${ins.aab405 }
														<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab408 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose> 
								<c:when test="${ins.aab404==null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
		
												
												<div class="comment-top" >
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">׷������</td>
													</div>										
												</div>
												
																			
													
													<li class="td td-comment" style="position:relative;">
													<textarea style="width:80%;height:200px;left:0;" id="comment2_text" placeholder="��������������׷������!"></textarea>			
													<br/><br/>
													<a href="#" onclick="sendComment2(${ins.aab302})">
													<div class="am-btn am-btn-danger anniu" style="position:absolute;right:50px;bottom:5px;">
														׷������		
													</div>
													</a>
													</li>
		
											</ul>
		
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							<a href="#" onclick="delComment(${ins.aab302})">
							<div class="am-btn am-btn-danger anniu" style="float:right;">
								ɾ������							
							</div>
							</a>
						</div>

					</div>

				</div>
				<!--�ײ�-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">�����Ƽ�</a>
							<b>|</b>
							<a href="#">�̳���ҳ</a>
							<b>|</b>
							<a href="#">֧����</a>
							<b>|</b>
							<a href="#">����</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">���ں���</a>
							<a href="#">�������</a>
							<a href="#">��ϵ����</a>
							<a href="#">��վ��ͼ</a>
							<em>&copy; 2015-2025 Hengwang.com ��Ȩ����. ����ģ�� <a href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��">ģ��֮��</a> - Collect from <a href="http://www.cssmoban.com/" title="��ҳģ��" target="_blank">��ҳģ��</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
						<ul>
							<li> <a href="information.html">������Ϣ</a></li>
							<li> <a href="safety.html">��ȫ����</a></li>
							<li> <a href="address.html">��ַ����</a></li>
							<li> <a href="cardlist.html">���֧��</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵĽ���</p>
						<ul>
							<li><a href="order.html">��������</a></li>
							<li> <a href="change.html">�˿��ۺ�</a></li>
							<li> <a href="comment.html">������Ʒ</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>�ҵ��ʲ�</p>
						<ul>
							<li> <a href="points.html">�ҵĻ���</a></li>
							<li> <a href="coupon.html">�Ż�ȯ </a></li>
							<li> <a href="bonus.html">���</a></li>
							<li> <a href="walletlist.html">�˻����</a></li>
							<li> <a href="bill.html">�˵���ϸ</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>�ҵ��ղ�</p>
						<ul>
							<li> <a href="collection.html">�ղ�</a></li>
							<li> <a href="foot.html">�㼣</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>���߿ͷ�</p>
						<ul>
							<li> <a href="consultation.html">��Ʒ��ѯ</a></li>
							<li> <a href="suggest.html">�������</a></li>							
							
							<li> <a href="news.html">�ҵ���Ϣ</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>