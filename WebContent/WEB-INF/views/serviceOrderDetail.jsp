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
		<link href="<%=path%>/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

		<script type="text/javascript">
			
			function checkService(vaac402)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/checkService.html?aac402="+vaac402;
				vform.submit();
			}
			function goComment(vaac402)
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/goCommentService.html?aac402="+vaac402;
				vform.submit();
			}
			function showComment()
			{
				var vform = document.getElementById("myform");
				vform.action="<%=path%>/showServiceComment.html";
				vform.submit();
			}
		</script>
	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post">
		<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102") %>">
		</form>
		
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-orderinfo">

						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--������-->
						<div class="m-progress">
							<div class="m-progress-list">
								<span class="step-1 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                   <p class="stage-name">Ԥ����</p>
                                </span>
                                
								<span class="step-1 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                   <p class="stage-name">������</p>
                                </span>
								<span class="
										<c:choose>
											<c:when test="${ins.aac408 eq '02' }">
												step-1 step
											</c:when>
											<c:otherwise>
												step-3 step
											</c:otherwise>
										</c:choose>
											">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                   <p class="stage-name">�������</p>
                                </span>
								<span class="u-progress-placeholder"></span>
							</div>
							<div class="u-progress-bar total-steps-2">
								<div class="u-progress-bar-inner"></div>
							</div>
						</div>
						
						
						
						<div class="order-infomain">
							
								<div class="order-title"">
										<div class="dd-num">������ţ�<a href="javascript:;">${ins.aac402 }</a></div><br/><br/><br/><br/>
										<span style="font-size:18px;color:orange;">����ʱ��:</span><br/>
										<p>${ins.aac403 }</p>
										<span style="font-size:18px;color:orange;">��������:</span><br/>
										<p>${ins.type }</p>
										<span style="font-size:18px;color:orange;">�����������:</span><br/>
										<p>${ins.aac411 }</p>
										<span style="font-size:18px;color:orange;">��������ַ:</span><br/>
										<p>${ins.aac409 }</p>
										<span style="font-size:18px;color:orange;">Ԥ����:</span><br/>
										<p>&yen;${ins.aac406 }</p>
										<span style="font-size:18px;color:orange;">�ܷ���:</span><br/>
										<p>&yen;${ins.aac407 }</p>
										<span style="font-size:18px;color:orange;">������:</span><br/>
										<p>${ins.aac103 }</p>
								</div>
	
								<hr/><br/><br/><br/><br/><br/>
								<span>Ԥ��ʱ�䣺${ins.aac404 }</span><br/>
								<span>�깤ʱ�䣺${ins.aac405 }</span><br/>
		
								<div style="text-align:right;">
								<c:choose>
									<c:when test="${ins.aac408 eq '01' }">
									<div style="float:center;" class="am-btn am-btn-danger anniu" onclick="checkService(${ins.aac402})">
											ȷ�Ϸ����깤
									</div>
									</c:when>
									<c:when test="${ins.aac408 eq '02' }">
									<div style="float:center;" class="am-btn am-btn-danger anniu" onclick="goComment(${ins.aac402})">
											ȥ����
									</div>
									</c:when>
									<c:when test="${ins.aac408 eq '03' }">
									<div style="float:center;" class="am-btn am-btn-danger anniu" onclick="showComment()">
											�鿴����
									</div>
									</c:when>
								</c:choose>
								</div>
									
						</div>
					</div>

				</div>
				

			</div>
			
		</div>

	</body>

</html>