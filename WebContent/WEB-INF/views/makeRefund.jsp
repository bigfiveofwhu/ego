<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�˻���</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/refstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#type").change(function() {	
				var p = $(this).val();
				$('input[name="aaa804"]').val(p);
				$("#showtype").text(p);
			});
			
			$("#reason").change(function() {	
				var p = $(this).val();
				$('input[name="aaa806"]').val(p);
				$("#showreason").text(p);
			});
		})
		
		function sendRefund(vaab302)
		{
			var vform = document.getElementById("myform");
			$('input[name="aaa805"]').val($("#description").val());
			vform.action="<%=path%>/makeRefund.html?aab302="+vaab302;
			vform.submit();
		}
		
		</script>
	</head>

	<body>
		<form id="myform" action="###.html" method="post">
			<input name="aaa804" type="hidden" value="01" />
			<input name="aaa806" type="hidden" value="01" />
			<input name="aaa805" type="hidden" value="" />
			<input name="aab102" type="hidden" value="${ins.aab102 }" />
			<input name="aab203" type="hidden" value="${ins.aab203 }" />
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
									<a href="#" target="_top" class="h">�ף����¼</a>
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
					<!--���� -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�˻�������</strong> / <small>Apply&nbsp;for&nbsp;returns</small></div>
					</div>
					<hr/>
					<div class="comment-list">
					<!--������-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">��������˿�</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">�̼Ҵ����˿�����</p>
                            </span>
							<span class="step-3 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                <p class="stage-name">����ɹ��˻�</p>
                            </span>                            
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					
					
						<div class="refund-aside">
							<div class="item-pic">
								<a href="#" class="J_MakePoint">
									<img src="<%=path%>/images/comment.jpg_400x400.jpg" class="itempic">
								</a>
							</div>

							<div class="item-title">

								<div class="item-name">
									<a href="#">
										<p class="item-basic-info">${ins.aab202 }</p>
									</a>
								</div>
								<div class="info-little">
									<span>����1:����</span>
									<span>����2:����</span>
								</div>
							</div>
							<div class="item-info">
								<div class="item-ordernumber">
									<span class="info-title">������ţ�</span><a>${ins.aab302 }</a>
								</div>
								<div class="item-price">
									<span class="info-title">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</span><span class="price">${ins.aab314 }Ԫ</span>
									<span class="number">��${ins.aab310 }</span><span class="item-title">(����)</span>
								</div>
								
								<%double total=0; double spend=0;%>
								<c:set var="number" value="${ins.aab310}" scope="request"></c:set>
							    <c:set var="price" value="${ins.aab314}" scope="request"></c:set>
							    <c:set var="transFee" value="${ins.aab313}" scope="request"></c:set>
							    <%  spend=Double.valueOf((String)request.getAttribute("number"))
							    				*Double.valueOf((String)request.getAttribute("price")); 			
							   		total=spend+Double.valueOf((String)request.getAttribute("transFee")); 			
							    %>
								<div class="item-amount">
									<span class="info-title">С&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</span><span class="amount"><%=spend %>Ԫ</span>
								</div>
								<div class="item-pay-logis">
									<span class="info-title">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ѣ�</span><span class="price">${ins.aab313 }Ԫ</span>
								</div>
								<div class="item-amountall">
									<span class="info-title">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</span><span class="amountall"><%=total %>Ԫ</span>
								</div>
								<div class="item-time">
									<span class="info-title">�ɽ�ʱ�䣺</span><br/><span class="time">${ins.aab305 }</span>
								</div>

							</div>
							<div class="clear"></div>
						</div>

						<div class="refund-main">
							<div class="item-comment">
								<div class="am-form-group">
									<label for="refund-type" class="am-form-label">�˿�����</label>
									<div class="am-form-content">
										<select id="type" data-am-selected="">
											<option value="01" selected>���˿�</option>
											<option value="02">�˿�/�˻�</option>
										</select>
									</div>
								</div>
								<p id="showtype">asdfasdfasdfadsfadsfasdf</p>
								<div class="am-form-group">
									<label for="refund-reason" class="am-form-label">�˿�ԭ��</label>
									<div class="am-form-content">
										<select id="reason" data-am-selected="">
											<option value="01" selected>����Ҫ��</option>
											<option value="02">�����</option>
											<option value="03">û�յ���</option>											
											<option value="04">��˵������</option>
										</select>
									</div>
								</div>
								
								<p id="showreason">asdfasdfasdfadsfadsfasdf</p>
								

								<div class="am-form-group">
									<label for="refund-money" class="am-form-label">�˿���<span>�������޸ģ�</span></label>
									<div class="am-form-content">
										<input type="text" id="refund-money" readonly="readonly" placeholder="<%=spend%>">
									</div>
								</div>
								<div class="am-form-group">
									<label for="refund-info" class="am-form-label">�˿�˵��<span>���ɲ��</span></label>
									<div class="am-form-content">
										<textarea id="description" placeholder="�������˿�˵��"></textarea>
									</div>
								</div>

							</div>
							<div class="refund-tip">
								<div class="filePic">
									<input type="file" class="inputPic" value="ѡ��ƾ֤ͼƬ" name="file" max="5" maxsize="5120" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
									<img src="<%=path%>/images/image.jpg" alt="">
								</div>
								<span class="desc">�ϴ�ƾ֤&nbsp;�������</span>
							</div>
							
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" onclick="sendRefund(${ins.aab302})">�ύ����</div>
						</div>
					</div>
					<div class="clear"></div>
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