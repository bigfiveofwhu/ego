<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>�����̳���Ӫ�̹����̨</title>
		<link rel="icon" href="../assets/img/favicon.ico">
		<link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/webbase.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/houtai/css/pages-login-manage.css" />
		<link rel="stylesheet" href="<%=path%>/houtai/plugins/jquery-front-end-verify/css/verify.css" />

	</head>

	<body ng-app="shopping" ng-controller="AdminUserController">
		<div class="loginmanage">
			<div class="py-container">
				<h4 class="manage-title">��Ӫ�̹����̨</h4>
				<div class="loginform">

					<ul class="sui-nav nav-tabs tab-wraped">
						<li>
							<a href="#index" data-toggle="tab">
								<h3>ɨ���¼</h3>
							</a>
						</li>
						<li class="active">
							<a href="#profile" data-toggle="tab">
								<h3>�˻���¼</h3>
							</a>
						</li>
					</ul>
					<div class="tab-content tab-wraped">
						<div id="index" class="tab-pane">
							<p>��ά���¼</p>
							<img src="" />
						</div>
						<div id="profile" class="tab-pane  active">
							<form class="sui-form" name="myForm">
								<div class="input-prepend"><span class="add-on loginname"></span>
									<input ng-model="entity.username" type="text" placeholder="�û���" class="span2 input-xfat" required>
								</div>
								<div class="input-prepend"><span class="add-on loginpwd"></span>
									<input ng-model="entity.password" type="password" placeholder="����������" class="span2 input-xfat" required>
								</div>
								<div class="setting">
									<div id="mpanel4" >
									
									</div>
								</div>
								<div id="loginBtn" class="logined" hidden="true">
									<a class="sui-btn btn-block btn-xlarge btn-danger" ng-disabled="!myForm.$valid" ng-click="login(entity)" >��&nbsp;&nbsp;¼</a>
								</div>
							</form>

						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<!--foot-->
		<div class="py-container copyright">
			<ul>
				<li>��������</li>
				<li>��ϵ����</li>
				<li>��ϵ�ͷ�</li>
				<li>�̼���פ</li>
				<li>Ӫ������</li>
				<li>�ֻ�App</li>
				<li>��������</li>
				<li>�̼�����</li>
			</ul>
			<div class="address">��ַ�����ݷ�خְҵ����ѧԺ �ʱࣺ515644 �绰��110-100-110 </div>
			<div class="beian">���ݷ�خ��
			</div>
		</div>
	</body>

	
	<script src="<%=path%>/houtai/plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/Base.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/base/BaseController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/service/AdminUserService.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/controller/AdminUserController.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/sui/sui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/js/pages/jquery.slideunlock.js"></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/jquery-front-end-verify/js/jquery.min.js" ></script>
	<script type="text/javascript" src="<%=path%>/houtai/plugins/jquery-front-end-verify/js/verify.js" ></script>
	<script>
		$('#mpanel4').slideVerify({
			type : 2,		//����
			vOffset : 4,	//������������������е���
			vSpace : 5,	//���
			imgName : ['<%=path%>/houtai/img/1.jpg', '<%=path%>/houtai/img/2.jpg'],
			imgSize : {
				width: '335px',
				height: '100px',
			},
			blockSize : {
				width: '40px',
				height: '40px',
			},
			barSize : {
				width : '335px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				 $("#loginBtn").show();
			},
			error : function() {
			     
			}
		});
	</script>

</html>