<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
							  
								<input id="pop_file" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="jpeg,jpg" accept="image/*">
								<img id="preview" class="am-circle am-img-thumbnail" src="<%=basePath%>/images/upload/${imgName }.jpg" alt="" />
								<button class="am-btn">����ͷ��</button>
							</div>
							</form>

							<p class="am-form-help">ͷ��</p>

							<div class="info-m">
								<div><b>�û�����<i>${aaa103 }</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">��Աר��</a>
								</div>
							</div>
						</div>

						<!--������Ϣ -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" id="submithhh" action="<%=path %>/person/modifyUserInfo.html?imgName=${imgName}" method="post">

								<div class="am-form-group">
									<label for="user-name3" class="am-form-label">�û���</label>
									<div class="am-form-content">
										<input type="text" name="naaa103" id="user-name" value="${user.aaa103}">
                                          <small>�ǳƳ��Ȳ��ܳ���40������</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">��ʵ����</label>
									<div class="am-form-content">
										<input type="text" name="aaa109" id="user-realname" value="${user.aaa109}">
                                         
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
											<input type="radio" name="aaa113" value="3" data-am-ucheck > ����
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
										<input id="user-phonehhh" name="aaa108" value="${user.aaa108 }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">�����ʼ�</label>
									<div class="am-form-content">
										<input id="user-email" name="aaa104"  value="${user.aaa104 }" placeholder="Email" type="email" readonly>

									</div>
								</div>
						
								<div class="info-btn">
								   <input type="button"  class="am-btn am-btn-danger" onclick="checkSubmit()" value="�����޸�"></input>
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
  		alert("��������ȷ��ʽ�绰");
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