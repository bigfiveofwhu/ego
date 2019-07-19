<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>


<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		
		<title>个人资料</title>
		
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		
		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>			
	</head>
	
	<body>
					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>
						<!--头像 -->
						<div class="user-infoPic">
							<form enctype="multipart/form-data" id="formTag">
							<div class="filePic">
								<input id="pop_file" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img id="preview" class="am-circle am-img-thumbnail" src="<%=basePath%>/images/upload/${imgName }.jpg" alt="" />
							</div>
							</form>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>小叮当</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" action="modifyUserInfo.html?imgName=${imgName}" method="post">

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">用户名</label>
									<div class="am-form-content">
										<input type="text" name="aaa103" "id="user-name" value="${user.aaa103}">
                                          <small>昵称长度不能超过40个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">真实姓名</label>
									<div class="am-form-content">
										<input type="text" name="aaa109"id="user-realname" value="${user.aaa109}">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="1" data-am-ucheck > 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="2" data-am-ucheck> 女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="aaa113" value="3" data-am-ucheck checked> 保密
										</label>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content">
										    <input type="date" name="aaa110"  value="${user.aaa110 }"> 
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="aaa108" value=" ${user.aaa108 }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" name="aaa104"  value="${user.aaa104 }" placeholder="Email" type="email">

									</div>
								</div>
								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">收货地址</label>
									<div class="am-form-content address">
										<a href="address.html">
											<p class="new-mu_l2cw">
												<span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												<span class="am-icon-angle-right"></span>
											</p>
										</a>

									</div>
								</div>
								<div class="am-form-group safety">
									<label for="user-safety" class="am-form-label">账号安全</label>
									<div class="am-form-content safety">
										<a href="safety.html">

											<span class="am-icon-angle-right"></span>

										</a>

									</div>
								</div>
								<div class="info-btn">
								   <input type="submit" class="am-btn am-btn-danger" value="保存修改"></input>
								</div>
                             <span>${msg }</span>
				             </form>
						</div>
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
            console.log("修改默认头像成功");
			//img.setAttribute('src',"<%=basePath%>/images/upload/user_1.jpg")
			},
			error:function(res,status){
				console.log("修改默认头像失败");
			}
	 });

}
</script>
</html>