<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@include file="/taglib.jsp" %>


<!DOCTYPE html>
<html>

	<head>

		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��������</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>			
	</head>

	<body>
		<!--ͷ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--���������� -->
<<<<<<< HEAD
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

=======
					<%@ include file="/navigate.jsp" %>
						<!--����������-->
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
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

					<div class="user-info">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>
						<!--ͷ�� -->
						<div class="user-infoPic">
							<form enctype="multipart/form-data" id="formTag">
							<div class="filePic">
								<input id="pop_file" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img id="preview" class="am-circle am-img-thumbnail" src="<%=basePath%>/images/upload/${imgName }.jpg" alt="" />
							</div>
							</form>
					

							<p class="am-form-help">ͷ��</p>

							<div class="info-m">
								<div><b>�û�����<i>С����</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">��Աר��</a>
								</div>
							</div>
						</div>

						<!--������Ϣ -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" action="modifyUserInfo.html?imgName=${imgName}" method="post">

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">�û���</label>
									<div class="am-form-content">
										<input type="text" name="aaa103" "id="user-name" value="${user.aaa103}">
                                          <small>�ǳƳ��Ȳ��ܳ���40������</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">��ʵ����</label>
									<div class="am-form-content">
										<input type="text" name="aaa109"id="user-realname" value="${user.aaa109}">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">�Ա�</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="1" data-am-ucheck > ��
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="2" data-am-ucheck> Ů
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="3" data-am-ucheck checked> ����
										</label>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">����</label>
									<div class="am-form-content">
										    <input type="date" name="aaa110"  value="${user.aaa110 }"> 
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">�绰</label>
									<div class="am-form-content">
										<input id="user-phone" name="aaa108" value=" ${user.aaa108 }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">�����ʼ�</label>
									<div class="am-form-content">
										<input id="user-email" name="aaa104"  value="${user.aaa104 }" placeholder="Email" type="email">

									</div>
								</div>
								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">�ջ���ַ</label>
									<div class="am-form-content address">
										<a href="address.html">
											<p class="new-mu_l2cw">
												<span class="province">����</span>ʡ
												<span class="city">�人</span>��
												<span class="dist">��ɽ</span>��
												<span class="street">�۳����666��(���ϲƾ�������ѧ)</span>
												<span class="am-icon-angle-right"></span>
											</p>
										</a>

									</div>
								</div>
								<div class="am-form-group safety">
									<label for="user-safety" class="am-form-label">�˺Ű�ȫ</label>
									<div class="am-form-content safety">
										<a href="safety.html">

											<span class="am-icon-angle-right"></span>

										</a>

									</div>
								</div>
								<div class="info-btn">
								   <input type="submit" class="am-btn am-btn-danger" value="�����޸�"></input>
								</div>
                             <span>${msg }</span>
				             </form>
						</div>
					</div>
				</div>
				<!--�ײ�-->
<<<<<<< HEAD
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
							<em>? 2015-2025 Hengwang.com ��Ȩ����. ����ģ�� <a href="http://www.cssmoban.com/" target="_blank" title="ģ��֮��">ģ��֮��</a> - Collect from <a href="http://www.cssmoban.com/" title="��ҳģ��" target="_blank">��ҳģ��</a></em>
						</p>
					</div>
				</div>
=======
				<%@ include file="/footer.jsp" %>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
<<<<<<< HEAD
						<a href="index.jsp"><i class="am-icon-user"></i>��������</a>
=======
						<a href="index.html"><i class="am-icon-user"></i>��������</a>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
					<ul>
<<<<<<< HEAD
						<li> <a href="showUserInfo.html">������Ϣ</a></li>
							<li> <a href="<%=path%>/person/safety.jsp">��ȫ����</a></li>
							<li> <a href="showAddress.html">��ַ����</a></li>
=======
							<li> <a href="showUserInfo.html">������Ϣ</a></li>
							<li> <a href="<%=path%>/person/safety.jsp">��ȫ����</a></li>
							<li> <a href="<%=path%>/person/address.jsp">��ַ����</a></li>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
							<li> <a href="<%=path%>/person/cardlist.jsp">���֧��</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>�ҵĽ���</p>
						<ul>
<<<<<<< HEAD
							<li><a href="order.jsp">��������</a></li>
							<li> <a href="change.jsp">�˿��ۺ�</a></li>
							<li> <a href="comment.jsp">������Ʒ</a></li>
=======
							<li><a href="order.html">��������</a></li>
							<li> <a href="change.html">�˿��ۺ�</a></li>
							<li> <a href="comment.html">������Ʒ</a></li>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>�ҵ��ʲ�</p>
						<ul>
<<<<<<< HEAD
							<li> <a href="points.jsp">�ҵĻ���</a></li>
							<li> <a href="coupon.jsp">�Ż�ȯ </a></li>
							<li> <a href="bonus.jsp">���</a></li>
							<li> <a href="walletlist.jsp">�˻����</a></li>
							<li> <a href="bill.jsp">�˵���ϸ</a></li>
=======
							<li> <a href="points.html">�ҵĻ���</a></li>
							<li> <a href="coupon.html">�Ż�ȯ </a></li>
							<li> <a href="bonus.html">���</a></li>
							<li> <a href="walletlist.html">�˻����</a></li>
							<li> <a href="bill.html">�˵���ϸ</a></li>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>�ҵ��ղ�</p>
						<ul>
<<<<<<< HEAD
							<li> <a href="collection.jsp">�ղ�</a></li>
							<li> <a href="foot.jsp">�㼣</a></li>														
=======
							<li> <a href="collection.html">�ղ�</a></li>
							<li> <a href="foot.html">�㼣</a></li>														
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-qq"></i>���߿ͷ�</p>
						<ul>
<<<<<<< HEAD
							<li> <a href="consultation.jsp">��Ʒ��ѯ</a></li>
							<li> <a href="suggest.jsp">�������</a></li>							
							
							<li> <a href="news.jsp">�ҵ���Ϣ</a></li>
=======
							<li> <a href="consultation.html">��Ʒ��ѯ</a></li>
							<li> <a href="suggest.html">�������</a></li>							
							
							<li> <a href="news.html">�ҵ���Ϣ</a></li>
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>
<script>
function uploadFile(ev){
    var that = this;
    const file = document.getElementById('pop_file');
    const fileObj = file.files[0];
    const windowURL = window.URL || window.webkitURL;
    const img = document.getElementById('preview');
    if(file && fileObj) {
        const dataURl = windowURL.createObjectURL(fileObj);
        console.log(dataURl);
        img.setAttribute('src',dataURl);
    }
    
   // var ftype = "user_${user.aaa102}";
    var formdata = new FormData();
    formdata.append("file",fileObj);
    
    $.ajax({
		url:"<%=basePath%>/fileUpload.ajax?type=user&id=${user.aaa102}",
		type:"post",
		dataType:"json",
		processData : false,
		contentType : false,
		timeout : 20000,
		data : formdata,
		success:function(res,status){
            console.log("�޸�Ĭ��ͷ��ɹ�");
			//img.setAttribute('src',"<%=basePath%>/images/upload/user_1.jpg")
<<<<<<< HEAD
            console.log("�޸�Ĭ��ͷ��ɹ�");
=======
>>>>>>> 471dc8a5fea1d6f4c59ec48eb34b0e43f907a2a9
			},
			error:function(res,status){
				console.log("�޸�Ĭ��ͷ��ʧ��");
			}
	 });

}
</script>
</html>