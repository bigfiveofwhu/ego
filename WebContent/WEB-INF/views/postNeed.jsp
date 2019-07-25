<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>��������</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			$("#service-type").change(function() {	
				var p = $(this).val();
				$('input[name="aac603"]').val(p);
			});
			$("#service-method").change(function() {	
				var p = $(this).val();
				$('input[name="aac604"]').val(p);
			});
			$("#myaddr_1").change(function(){
				var p = $(this).val();
				$('input[name="provinceTmp"]').val(p);
				var A_id=$(this).children("option:selected").attr("A_id");
				$("#myaddr_2").html("");
				$("#myaddr_3").html("");
				loadAddr(A_id,2);
			});
			$("#myaddr_2").change(function(){
				var p = $(this).val();
				$('input[name="cityTmp"]').val(p);
				var A_id=$(this).children("option:selected").attr("A_id");
				$("#myaddr_3").html("");
				loadAddr(A_id,3);
			});
			$("#myaddr_3").change(function() {	
				var p = $(this).val();
				$('input[name="areaTmp"]').val(p);
			});
			
		})
		
			
		
		<%-- ��ַ��ʼ�����첽����--%>
		function loadAddr(type,index){
			if(index>3) return;
			$.ajax({
				url:"<%=path%>/getAddr.ajax",
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
					$("#myaddr_"+index).html(html);
					loadAddr(addrs[0].areaid,++index);
				},
				error:function(res,status){
					console.log("#myaddr_"+index+"��ַ�첽���ش���");
				}
			});
		}
		loadAddr("-1",1);
		
		function sendNeed()
		{
			var p2 = $("#myaddr_2").val();
			$('input[name="cityTmp"]').val(p2);
			var p3 = $("#myaddr_3").val();
			$('input[name="areaTmp"]').val(p3);
			if($("#address").val()==""){
				alert("��������ϸ��ַ!");
			}
			else if($("#description").val()==""){
				alert("��������������!");
			}
			else{
				var vform = document.getElementById("myform");
				$('input[name="aac605"]').val($("#description").val());
				$('input[name="aac607"]').val($("#address").val());
				vform.action="<%=path%>/postNeed.html";
				vform.submit();
			}
			
			
		}
		</script>
	</head>

	<body>
		
		
		<form id="myform" action="##.html" method="post">
			<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102") %>" />
			<input name="aac603" type="hidden" value="01" />
			<input name="aac604" type="hidden" value="01" />
			<input name="aac605" type="hidden" value="" />
			<input name="aac607" type="hidden" value="" />
			<input name="provinceTmp" type="hidden" value="������" />
			<input name="cityTmp" type="hidden" value="��������" />
			<input name="areaTmp" type="hidden" value="������" />
		</form>
		

		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-address">
						
						<div class="clear"></div>
						<!--����-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--���� -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal">
									
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">���ڳ���</label>
											<div class="am-form-content address">
												<select id="myaddr_1" >
													
												</select>
												<select id="myaddr_2" class="childs">
													
												</select>
												<select id="myaddr_3" class="childs">
													
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">��ϸ��ַ</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="address" placeholder="������ϸ��ַ(�Ǳ���)"></textarea>
												<small>50������д�������ϸ��ַ...</small>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">��������</label>
											<div class="am-form-content address">
												<select id="service-type" data-am-selected>
													<c:choose>
													<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
														<c:choose>
														<c:when test="${ins.fcode eq '01' }">
														<option value="${ins.fcode }"  selected>${ins.fvalue }</option>
														</c:when>
														<c:otherwise>
														<option value="${ins.fcode }" >${ins.fvalue }</option>
														</c:otherwise>
														</c:choose>
													</c:forEach>
													</c:when>
													</c:choose>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">����ʽ</label>
											<div class="am-form-content address">
												<select id="service-method" data-am-selected>
													<option value="01" selected>���ŷ���</option>
													<option value="02" >���Ϸ���</option>
													<option value="03" >�ŵ����</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">����˵��</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="description" placeholder="������ϸ˵��" required="required"></textarea>
												<small>������ľ�������...</small>
											</div>
										</div>

										

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" onclick="sendNeed()">����</a>
												<a href="javascript:;" class="am-close am-btn am-btn-danger" data-am-modal-close>ȡ��</a>
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
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				
			</div>

			
		</div>

	</body>

</html>