<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�޸�����</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�޸�����</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--������-->
				
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">ԭ����</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" placeholder="������ԭ��¼����">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">������</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="�����֡���ĸ���">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">ȷ������</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" onblur="checkPwd()" placeholder="���ٴ��������������">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger">�����޸�</div>
						</div>	
				</form>
				</body>	
</html>
<script type="text/javascript">
 function checkPwd()
 {
	 
 }


</script>	