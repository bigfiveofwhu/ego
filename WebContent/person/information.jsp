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
							  
								<input id="pop_file" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="jpeg,jpg" accept="image/*">
								<img id="preview" class="am-circle am-img-thumbnail" src="<%=basePath%>/images/upload/${imgName }.jpg" alt="" />
								<button class="am-btn">更换头像</button>
							</div>
							</form>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${aaa103 }</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" id="submithhh" action="<%=path %>/person/modifyUserInfo.html?imgName=${imgName}" method="post">

								<div class="am-form-group">
									<label for="user-name3" class="am-form-label">用户名</label>
									<div class="am-form-content">
										<input type="text" name="naaa103" id="user-name" value="${user.aaa103}">
                                          <small>昵称长度不能超过40个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">真实姓名</label>
									<div class="am-form-content">
										<input type="text" name="aaa109" id="user-realname" value="${user.aaa109}">
                                         
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
											<input type="radio" name="aaa113" value="3" data-am-ucheck > 保密
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
										<input id="user-phonehhh" name="aaa108" value="${user.aaa108 }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" name="aaa104"  value="${user.aaa104 }" placeholder="Email" type="email" readonly>

									</div>
								</div>
						
								<div class="info-btn">
								   <input type="button"  class="am-btn am-btn-danger" onclick="checkSubmit()" value="保存修改"></input>
								</div>
                             <span>${msg }</span>
				             </form>
						</div>
					</div>
	</body>
<script>
$(document).ready(function(){
	 $("input:radio[value='${user.aaa113}']").attr('checked','true');
});

function ValidatePhone(val){
	if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(val)))
	{ 
		  return false; 
	} 
	return true;
}

function checkSubmit()
{
  	if(ValidatePhone($("#user-phonehhh").val()) == false)
  	{
  		alert("请输入正确格式电话");
  		$("#aaa108").attr("value","");
  		return;
  	}
  	$("#submithhh").submit();
  	
}
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