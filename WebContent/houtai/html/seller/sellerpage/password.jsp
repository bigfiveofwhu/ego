<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<!-- 页面meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>商家修改密码</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/adminLTE/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="<%=path%>/houtai/css/style.css">
	</head>

	<body class="hold-transition skin-red sidebar-mini" ng-app="shopping" ng-controller="SellerLoginController" >

		<!-- 正文区域 -->
		<section class="content">

			<div class="box-body">

				<!--tab页-->
				<div class="nav-tabs-custom">

					<!--tab头-->
					<ul class="nav nav-tabs">

						<li class="active">
							<a href="#home" data-toggle="tab">修改密码</a>
						</li>
					</ul>
					<!--tab头/-->

					<!--tab内容-->
					<div class="tab-content">

						<!--表单内容-->
						<div class="tab-pane active" id="home">
							<div class="row data-type">

								<div class="col-md-2 title">原密码</div>
								<div class="col-md-10 data">
									<input type="password" id="user-origin-password" class="form-control" placeholder="原密码" value="" ng-model="pojo.oldPassword">
								</div>

								<div class="col-md-2 title">新密码</div>
								<div class="col-md-10 data">
									<input type="password" id="user-now1-password" class="form-control" placeholder="新密码" value="" ng-model="pojo.newPassword">
								</div>

								<div class="col-md-2 title">确认新密码</div>
								<div class="col-md-10 data">
									<input type="password" id="user-confirm-password" class="form-control" placeholder="确认新密码" value="" ng-model="newPassword">
								</div>
							</div>
						</div>

					</div>
					<!--tab内容/-->
					<!--表单内容/-->
				</div>
			</div>
			<div class="btn-toolbar list-toolbar">
				<button type="button" class="btn btn-primary" onclick="changepwd()"><i class="fa fa-save" >保存</i></button><span id="success_icon" style="color:red;display:none">修改成功!</span>
			</div>

		</section>
		<!-- 正文区域 /-->

	</body>
    <script type="text/javascript">
    function changepwd()
    {

   	 console.log($("#user-origin-password").val());
   	 console.log($("#user-now1-password").val());
   	 console.log($("#user-confirm-password").val());
   	 if($("#user-now1-password").val()  == "" || $("#user-origin-password").val()== "" || $("#user-confirm-password" ).val() == "")
   	 {
   		 alert("密码不能为空");
   		 return;
   	 }
   	 
   	 if($("#user-now1-password").val() != $("#user-confirm-password").val() )
   	 {
   		 alert("密码不一致");
   		 return;
   	 }
   	 
   	 var oaaa107 = $("#user-origin-password").val();
   	 var naaa107 = $("#user-now1-password").val();
   	 $.ajax({
   			url:"${path}/modifyPwd.ajax",
   			type:"post",
   			dataType:"json",
   			timeout:20000,
   			data:{
   				"oaaa107":oaaa107,
   				"naaa107":naaa107
   			},
   			success:function(res,status){
   				if(res.bigtag == 0)
   				{
   					 alert("原密码错误,修改失败!");
   					 location.reload();			
   				}
   				else
   				{
   	                 $("#success_icon").css("display","inline");
   	               	 $("#user-origin-password").val("");
   	            	 $("#user-now1-password").val("");
   	            	 $("#user-confirm-password").val("");
   				}
   			},
   			error:function(res,status){
   				alert("网络错误");
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