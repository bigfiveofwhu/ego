<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�������</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

	</head>

	<body>
		
					<!--���� -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�������</strong> / <small>Suggest</small></div>
					</div>
					<hr/>
					<div class="suggestmain">
						<p>���������ı��������</p>
						<div class="suggestlist">
							<select data-am-selected>
								<option value="a" selected>��ѡ���������</option>
								<option value="b">��Ʒ����</option>
								<option value="c">��������</option>
								<option value="d">֧������</option>
								<option value="e">�˿�����</option>
								<option value="f">��������</option>
								<option value="g">�ۺ�����</option>
								<option value="h">��Ʊ����</option>
								<option value="o">�˻���</option>
								<option value="m">����</option>
							</select>
						</div>
						<div class="suggestDetail">
							<p>�������⣺</p>
							<blockquote class="textArea">
								<textarea name="opinionContent" id="say_some" cols="60" rows="5" autocomplete="off" placeholder="�ڴ��������������������"></textarea>
								<div class="fontTip"><i class="cur">0</i> / <i>200</i></div>
							</blockquote>
						</div>
						<div class="am-btn am-btn-danger anniu">�ύ</div>
						<p class="suggestTel"><i class="am-icon-phone"></i>�ͷ��绰��400-007-1234</p>
					</div>
				
	</body>

</html>