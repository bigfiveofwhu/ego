<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>编辑地址</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<body>


								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">编辑地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form  action="editAddressBack.html" class="am-form am-form-horizontal">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" name="aaa405"  value="${address.aaa405}"id="user-name" required="required" placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone"  class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input  name= "aaa406" value="${address.aaa406 }" placeholder="手机号必填" required="required" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<!-- 地址插件 -->
											<div class="am-form-content address">
												<select name="addr_1" id="addr_1" >
												</select>
												<select name="addr_2" id="addr_2" class="childs" >
												</select>
												<select name="addr_3" id="addr_3" class="childs" >
												</select>
											</div>
										  </div>
                                      <div class="am-form-group">
											<label  class="am-form-label">备注</label>
											<div class="am-form-content">
												<input name="aaa404" value="${address.aaa404 }" placeholder="备注" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea name="aaa403" class="" rows="3" id="user-intro" placeholder="输入详细地址" required="required">${address.aaa403 }</textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit"  value = "保存"class="am-btn am-btn-danger"></input>
												<a href="javascript: void(0)" onclick="window.location.href='showAddress.html';return false;"   href="javascript:void(0);"class="am-close am-btn am-btn-danger" data-am-modal-close>退出</a>
											</div>
											<P>${msg }</P>
										</div>
										<input type="hidden" value="${address.aaa401 }" name="aaa401"></input>
									</form>
								</div>
</body>
<script type="text/javascript">


$("#addr_1").change(function(){
	var A_id=$(this).children("option:selected").attr("A_id");
	$("#addr_2").html("");
	$("#addr_3").html("");
	loadAddr(A_id,2);
});
$("#addr_2").change(function(){
	var A_id=$(this).children("option:selected").attr("A_id");
	$("#addr_3").html("");
	loadAddr(A_id,3);
});

<%-- 地址初始化的异步加载--%>
function loadAddr(type,index){
	if(index>3) return;
	$.ajax({
		url:"<%=basePath%>/getAddr.ajax",
		type:"post",
		timeout:20000,
		dataType:"json",
		data:{
			"type":type
		},
		success:function(res,status){
			var addrs=res.addrs;
			var n=addrs.length;
			var html="";
			var p=0;
			if(n>0){
				for(var i=0;i<n;i++){
					var kk;
					switch(index){
					case 1:
						kk= addrs[i].areaname=='${address.addr_1}'
						break;
					case 2:
						kk= addrs[i].areaname=='${address.addr_2}'
						break;
					case 3:
						kk= addrs[i].areaname=='${address.addr_3}'
						break;
					}
					if(kk){
						html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"' selected='selected'>"+addrs[i].areaname+"</option>";
						p=i;
					}else{
						html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
					}
				}
			}
			$("#addr_"+index).html(html);
			loadAddr(addrs[p].areaid,++index);
		},
		error:function(res,status){
			console.log("#addr_"+index+"地址异步加载错误");
		}
	});
}
loadAddr("-1",1);
</script>
</html>