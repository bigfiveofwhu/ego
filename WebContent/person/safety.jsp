<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��ȫ����</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/infstyle.css" rel="stylesheet" type="text/css">
	</head>

	<body>

					<!--���� -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�˻���ȫ</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--ͷ�� -->
						<div class="user-infoPic">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="<%=path%>/images/upload/user_${aaa102}.jpg" alt="" />
							</div>

							<p class="am-form-help">ͷ��</p>

							<div class="info-m">
								<div><b>�û�����<i>${aaa103}</i></b></div>
                                <div class="safeText">
                                  	<a href="safety.html">���û���:<em style="margin-left:20px ;">${aaa106}</em>��</a>
									<div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
								</div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">��¼����</div>
										<div class="fore2"><small>Ϊ��֤�����ﰲȫ�����������ڸ��������Ա����˻���ȫ��</small></div>
									</div>
									<div class="fore3">
										<a href="<%=path %>/person/password.jsp">
											<div class="am-btn am-btn-secondary">�޸�</div>
										</a>
									</div>
								</li>
								<!-- ֧������
								<li>
									<i class="i-safety-wallet"></i>
									<div class="m-left">
										<div class="fore1">֧������</div>
										<div class="fore2"><small>����֧�����빦�ܣ�Ϊ���ʲ��˻���ȫ�Ӱ�����</small></div>
									</div>
									<div class="fore3">
										<a href="#">
											<div class="am-btn am-btn-secondary">��������</div>
										</a>
									</div>
								</li>
								 -->
								 <!-- �ֻ���֤
								<li>
									<i class="i-safety-iphone"></i>
									<div class="m-left">
										<div class="fore1">�ֻ���֤</div>
										<div class="fore2"><small>����֤���ֻ���186XXXXXXXX ���Ѷ�ʧ��ͣ�ã�����������</small></div>
									</div>
									<div class="fore3">
										<a href="#">
											<div class="am-btn am-btn-secondary">����</div>
										</a>
									</div>
								</li>
								 -->
								<li>
									<i class="i-safety-mail"></i>
									<div class="m-left">
										<div class="fore1">����</div>
										<div class="fore2"><small>����֤����������ʧ,Ϊ�˰�ȫ�ɿ��ٻ���</small></div>
									</div>
									<div class="fore3">
										<a href="<%=path %>/person/email.jsp">
											<div class="am-btn am-btn-secondary">����</div>
										</a>
									</div>
								</li>
								<!-- ʵ����֤ 
								<li>
									<i class="i-safety-idcard"></i>
									<div class="m-left">
										<div class="fore1">ʵ����֤</div>
										<div class="fore2"><small>���������˺ŵİ�ȫ�Ժ����μ�����֤�����޸���֤��Ϣ��</small></div>
									</div>
									<div class="fore3">
										<a href="">
											<div class="am-btn am-btn-secondary">��֤</div>
										</a>
									</div>
								</li>
								-->
								<!-- ��ȫ����
								<li>
									<i class="i-safety-security"></i>
									<div class="m-left">
										<div class="fore1">��ȫ����</div>
										<div class="fore2"><small>�����˻���ȫ����֤����ݵĹ���֮һ��</small></div>
									</div>
									<div class="fore3">
										<a href="">
											<div class="am-btn am-btn-secondary">��֤</div>
										</a>
									</div>
								</li>
								 -->
							</ul>
						</div>

					</div>

	</body>

</html>