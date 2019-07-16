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
		<link href="<%=path%>/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#comment1 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab409"]').val(p);
					$("#point1").text(p);
				});
				
				$("#comment2 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab411"]').val(p);
					$("#point2").text(p);
				});
				
				$("#comment3 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab410"]').val(p);
					$("#point3").text(p);
					
				});
	    	 })
	    	function sendComment(vaab302)
			{
				var vform = document.getElementById("myform");
				$('input[name="aab403"]').val($("#comment_text").val());
				vform.action="<%=path%>/makeComment.html?aab302="+vaab302;
				vform.submit();
			}
		</script>
		
	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post" >
		<!-- input name="aaa102"  value="<%=session.getAttribute("aaa102") %>" type="hidden"/-->
		<input name="aab409" type="hidden"/>
		<input name="aab411" type="hidden"/>
		<input name="aab410" type="hidden"/>
		<input name="aab403" type="hidden"/>
		<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		<input name="aab412" value="02" type="hidden"/>
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
									<a href="#" target="_top" class="h">session���û�id:${aaa102 }</a>
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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��������</p>
										</a>
									</div>
								</div>
								<div id="comment1" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point1" >0</span>��</div>
								</div> 
								
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��������</p>
										</a>
									</div>
								</div>
								<div id="comment2" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point2" >0</span>��</div>
								</div>
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��Ʒ����</p>
										</a>
									</div>
								</div>
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="<%=path%>/images/comment.jpg_400x400.jpg" class="itempic">
									</a>
								</div>
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">��Ʒid:${ins.aab203 }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>������:${ins.aab302 }</span>
											<span>����2:����</span>
										</div>
										<div class="item-price">
											�۸�<strong>${ins.aab314 }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<hr/>
								
								
								
								
								<div class="item-comment">
									<textarea id="comment_text" placeholder="��д�¶Ա����ĸ��ܰɣ������˰����ܴ�Ŷ��"></textarea>
								</div>
								<div class="filePic">
									<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*" >
									<span>ɹ��Ƭ(0/5)</span>
									<img src="<%=path%>/images/image.jpg" alt="">
								</div>
								
								<div id="comment3" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point3" >0</span>��</div>
								</div> 

							</div>

							<div class="info-btn" onclick="sendComment(${ins.aab302})">
								<div class="am-btn am-btn-danger">��������</div>
							</div>
							<%int point=0; %>
														
										
					
												
							
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