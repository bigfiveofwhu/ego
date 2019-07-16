<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>

		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��ַ����</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>
	<body>
		
					<div class="user-address">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��ַ����</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                               <c:forEach items="${addrlist }" var="ins" varStatus="vs">
							   <c:choose>
							   <c:when test="${ins.aaa407 > 0 }">
							   	<li class="user-addresslist defaultAddr">
							   </c:when>
							   <c:otherwise>
							   <li   class="user-addresslist">
							   </c:otherwise>
							    </c:choose>
								<span class="new-option-r" value="${ins.aaa401 }"><i class="am-icon-check-circle"></i>Ĭ�ϵ�ַ</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${ins.aaa405 }</span>
									<span class="new-txt-rd2">${ins.aaa406}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">��ַ:</span>
										<span class="province">${ins.aaa402 }</span>
										<span class="street">${ins.aaa403 }</span>
									</p>
								</div>
								<div class="new-addr-btn">
									<a onclick="window.location.href='editAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);"><i class="am-icon-edit"></i>�༭</a>
									<span class="new-addr-bar">|</span>
									<a onclick="window.location.href='deleteAddress.html?aaa401=${ins.aaa401}';return false;"   href="javascript:void(0);" ><i class="am-icon-trash"></i>ɾ��</a>
								</div>
							</li>
							</c:forEach>

						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">����µ�ַ</a>
						<!--����-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--���� -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">������ַ</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form  action="addAddress.html" class="am-form am-form-horizontal">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">�ջ���</label>
											<div class="am-form-content">
												<input type="text" name="aaa405"  id="user-name" required="required" placeholder="�ջ���">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone"  class="am-form-label">�ֻ�����</label>
											<div class="am-form-content">
												<input  name= "aaa406" placeholder="�ֻ��ű���" required="required" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">���ڵ�</label>
											<!-- ��ַ��� -->
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
											<label  class="am-form-label">��ע</label>
											<div class="am-form-content">
												<input name="aaa404" placeholder="��ע" type="text">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">��ϸ��ַ</label>
											<div class="am-form-content">
												<textarea name="aaa403" class="" rows="3" id="user-intro" placeholder="������ϸ��ַ" required="required"></textarea>
												<small>100������д�������ϸ��ַ...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit"  value = "����"class="am-btn am-btn-danger"></input>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>ȡ��</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
								$.ajax({
									url:"<%=basePath%>/setDefAddr.ajax",
									type:"post",
									dataType:"json",
									timeout:20000,
									data:{
										"aaa401":$(this).attr("value")
									},
									success:function(res,status){
		                              console.log("�޸�Ĭ�ϵ�ַ�ɹ�");
									},
									error:function(res,status){
										console.log("�޸�Ĭ�ϵ�ַʧ��");
									}
								});
							});
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						});
						
					
						
			
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
			
			<%-- ��ַ��ʼ�����첽����--%>
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
						if(n>0){
							html="<option value='"+addrs[0].areaname+"' A_id='"+addrs[0].areaid+"' selected='selected'>"+addrs[0].areaname+"</option>";
							for(var i=1;i<n;i++){
								html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
							}
						}
						$("#addr_"+index).html(html);
						loadAddr(addrs[0].areaid,++index);
					},
					error:function(res,status){
						console.log("#addr_"+index+"��ַ�첽���ش���");
					}
				});
			}
			loadAddr("-1",1);
					</script>
	</body>

</html>