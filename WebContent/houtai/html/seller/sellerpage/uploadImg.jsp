<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- ҳ��meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>�̼��޸�ͷ��</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
		<script src="${path}/layui/layui.js"></script>
		<%@include file="/prompt.jsp" %>
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerLoginController" >

		<!-- �������� -->
		<section class="content">

			<div class="box-body">

				<!--tabҳ-->
				<div class="nav-tabs-custom">

					<!--tabͷ-->
					<ul class="nav nav-tabs">

						<li class="active">
							<a href="#home" data-toggle="tab">�ϴ�ͷ��</a>
						</li>
					</ul>
					<!--tabͷ/-->

					<!--tab����-->
					<div class="tab-content">

						<!--������-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">
								<form enctype="multipart/form-data" id="formTag">
								<div class="filePic">
									<input id="pop_file" style="width: 501px;border: 1px solid;" type="file"  class="inputPic" onchange="uploadFile(event)" name="fileTrans" ref="file" value="" allowexts="jpeg,jpg" accept="image/*">
									<img id="preview" style="width: 340px;" class="am-circle am-img-thumbnail" src="<%=basePath%>/images/shop/shop_${aab102}.jpg" alt="" />
									<br>
									<%--
									<button class="am-btn" onclick="">����ͷ��</button> --%>
								</div>
								</form>
							</div>
						</div>
					</div>
					<!--tab����/-->
					<!--������/-->
				</div>
			</div>
		</section>
		<!-- �������� /-->

	</body>
    <script type="text/javascript">
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
    		url:"<%=basePath%>/fileUpload.ajax?type=shop&id=${aab102}",
    		type:"post",
    		dataType:"json",
    		processData : false,
    		contentType : false,
    		timeout : 20000,
    		data : formdata,
    		success:function(res,status){
    			if(res.status=='200'){
        			promptGlobal("�޸�Ĭ��ͷ��ɹ�");
    			}else{
    				promptGlobal("�޸�Ĭ��ͷ��ʧ��");
    			}
    		},
    		error:function(res,status){
    			promptGlobal("�޸�Ĭ��ͷ��ʧ��");
    		}
    	 });

    }
    </script>
	<script src="<%=path%>/houtai/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="<%=path%>/houtai/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService_Seller.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/SellerService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/SellerLoginController.js"></script>

</html>