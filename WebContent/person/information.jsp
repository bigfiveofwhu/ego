<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>	
		<meta charset="utf-8">
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
					<%@ include file="/navigate.jsp" %>
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
								<img id="preview" class="am-circle am-img-thumbnail" src="<%=path%>/images/upload/${user.imgName }.jpg" alt="" />
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
							<form class="am-form am-form-horizontal" action="modifyUserInfo.html" method="post">

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
				<%@ include file="/footer.jsp" %>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>��������</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>��������</p>
					<ul>
							<li> <a href="showUserInfo.html">������Ϣ</a></li>
							<li> <a href="<%=path%>/person/safety.jsp">��ȫ����</a></li>
							<li> <a href="<%=path%>/person/address.jsp">��ַ����</a></li>
							<li> <a href="<%=path%>/person/cardlist.jsp">���֧��</a></li>
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
							<li> <a href="<%=path%>/discount/getCustomerCoupons.html">�Ż�ȯ </a></li>
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
			},
			error:function(res,status){
				console.log("�޸�Ĭ��ͷ��ʧ��");
			}
	 });

}
</script>
</html>