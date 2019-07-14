<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�ҵ��㼣</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/footstyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
		<!--ͷ -->
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

					<div class="user-foot">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�ҵ��㼣</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>

						<!--�㼣�б� -->

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<span><i class="month-lite">12</i>.<i class="day-lite">21</i><i class="date-desc">����</i></span>
								<del class="am-icon-trash"></del>
								<s class="line"></s>
							</div>

							<div class="goods-box first-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>						
						<div class="clear"></div>
						<div class="goods">
							<div class="goods-date" data-date="2015-12-17">
								<span><i class="month-lite"></i><i class="day-lite"></i>	<i class="date-desc">һ����</i></span>
								<del class="am-icon-trash"></del>
								<s class="line"></s>
							</div>
							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ">
											<img src="<%=path%>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">�������¼�</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">����������޽���ʳƷ�ɿ�����ʳ24��  �����ɿ���ʳƷ</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>$</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>$</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">������</a>
											<a href="#" class="match-recom-item">�Ҵ���</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
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