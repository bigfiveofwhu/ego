<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function checkForm(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var rePassWord=$("#rePassWord").val();
		var mobile=$("#mobile").val();
		var address=$("#address").val();
		
		if(userName==""){
			$("#error").html("�û�������Ϊ�գ�");
			return false;
		}
		if(password==""){
			$("#error").html("���벻��Ϊ�գ�");
			return false;
		}
		if(rePassWord==""){
			$("#error").html("ȷ�����벻��Ϊ�գ�");
			return false;
		}
		if(password!=rePassWord){
			$("#error").html("ȷ����������벻һ�£����������룡");
			return false;
		}
		if(mobile==""){
			$("#error").html("�ֻ����벻��Ϊ�գ�");
			return false;
		}
		if(address==""){
			$("#error").html("�ջ���ַ����Ϊ�գ�");
			return false;
		}
		return true;
	}

	function checkUserName(userName){
		if($("#userName").val()==""){
			$("#userErrorInfo").html("�û�������Ϊ�գ�");
			$("#userName").focus();
			return;
		}
		$.post("user_existUserWithUserName.action",{userName:userName},
				function(result){
					var result=eval('('+result+')');
					if(result.exist){
						$("#userErrorInfo").html("�û����Ѵ��ڣ����������룡");
						$("#userName").focus();
					}else{
						$("#userErrorInfo").html("");
					}
				}
		);
	}
</script>
</head>
<body>
<center>
<%-- <div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div> --%>

<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>��ӭע�ὡ������ϵͳ</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>��дע����Ϣ</li>
				<li class="last"><em></em>ע��ɹ�</li>
			</ul>
			<form id="regForm" method="post" action="user_register.action" onsubmit="">
				<table>				
					
					<tr>
						<td class="field">�û���(*)��</td>
						<td><input class="text" type="text" id="userName" name="user.userName" onblur="checkUserName(this.value)" />&nbsp;<font id="userErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">��¼����(*)��</td>
						<td><input class="text"  type="password" id="password" name="user.password"   /></td>
					</tr>
					<tr>
						<td class="field">ȷ������(*)��</td>
						<td><input class="text" type="password"  id="rePassWord"  name="rePassWord" /></td>
					</tr>
					
					<tr>
						<td class="field">�Ա�(*)��</td>
						<td>
					    <input type="radio"   name="user.sex" value="��" checked="checked"/>��&nbsp;&nbsp;
					    <input type ="radio" name="user.sex" value="Ů"/>Ů					    					    
					    </td>						
					</tr>
					<tr>
						<td class="field">�������ڣ�</td>
						<td>
							<input  type="text"  id="birthday"  name="user.birthday"  class="Wdate" onClick="WdatePicker()"/>	
						</td> 
					</tr>
					<tr>
						<td class="field">���֤�ţ�</td>
						<td><input class="text" type="text" id="dentityCode" name="user.dentityCode"  /></td>
					</tr>
					<tr>
						<td class="field">Email��</td>
						<td><input class="text" type="text" id="email" name="user.email"  /></td>
					</tr>
					<tr>
						<td class="field">�ֻ�����(*)��</td>
						<td><input class="text" type="text" id="mobile" name="user.mobile" /></td>
					</tr>
					<tr>
						<td class="field">�ջ��ַ(*)��</td>
						<td><input class="text" type="text" id="address" name="user.address" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="�ύע��" /></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><font id="error" color="red"></font> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<%-- <div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div> --%>
</center>
</body>
</html>