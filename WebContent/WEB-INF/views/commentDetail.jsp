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
		<link href="<%=path%>/css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
			function sendComment2(vaab302)
			{
				var vform = document.getElementById("myform");
				if($("#comment2_text").val()==""){
						alert("��û����д׷��Ŷ");
					}
				else{
					$('input[name="aab404"]').val($("#comment2_text").val());
					vform.action="<%=path%>/makeComment2.html?aab302="+vaab302;
					vform.submit();
				}
			}
			
			function delComment(vaab302)
			{
				var message=confirm("ȷ��Ҫɾ��������?�⽫��Զ�޷��ָ�!")
				if(message==true){
					var vform = document.getElementById("myform");
					vform.action="<%=path%>/delComment.html?aab302="+vaab302;
					vform.submit();
				}
				
			}
			
		</script>
	</head>

	<body>
		<form id="myform" method="post">
			<input name="aab404" value="" type="hidden"/>
			<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		</form>
		
		
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-comment">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Comment&nbsp;Detail</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
					
							<div class="comment-main">
								<div class="comment-list">
									<ul class="item-list">

										
										<div class="comment-top">
											<div class="th th-price">
												<td class="td-inner">��������</td>
											</div>
											<div class="th th-item">
												<td class="td-inner">��Ʒ</td>
											</div>													
										</div>
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint">
														<img src="<%=path%>/images/kouhong.jpg_80x80.jpg" class="itempic">
													</a>
												</div>
											</li>											
											
											<li class="td td-comment">
												<div class="item-title">
													
													<div class="item-name">
														<a href="#">
															<p class="item-basic-info" align="center">${ins.aab202 }</p>
														</a>
													</div>
												</div>
												<div class="item-comment">
													<a href="javascript:;" onclick="goCommentDetail(${ins.aab302})">${ins.aab403 }</a>
													<br/>
													<div class="item-opinion" style="width:60%">��������:${ins.aab409 }��</div>
													<div class="item-opinion" style="width:60%">��������:${ins.aab411 }��</div>
													<div class="item-opinion" style="width:60%">��Ʒ����:${ins.aab410 }��</div>
													<c:choose>
													<c:when test="${ins.aab412 eq '01' }">
														<div class="filePic"><img src="<%=path%>/images/image.jpg" alt=""></div>	
													</c:when>
													</c:choose>
												
												</div>

												<div class="item-info">
													<div>
														<p class="info-little">
														<span>������:<br/>${ins.aab302 }</span> 
														</p>
														<p class="info-time">${ins.aab406 }</p>

													</div>
												</div>
											</li>

									</ul>

								</div>
							</div>
							<hr/>
							<br/><br/>
							
							
							<c:choose>
								<c:when test="${ins.aab404!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">�ҵ�׷��</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
													${ins.aab404 }
													<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab407 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose>
								<c:when test="${ins.aab405!=null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">�̼һظ�</td>
													</div>										
												</div>								
												<li class="td td-comment">
													<div class="item-comment">
														�̼һظ�:<br/>${ins.aab405 }
														<br/>
													</div>
													<div class="item-info">
														<div>
															<p class="info-time">${ins.aab408 }</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							
							<c:choose> 
								<c:when test="${ins.aab404==null }">
									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">
		
												
												<div class="comment-top" >
													<div class="th th-price" style="text-align:left;font-size:16px;margin:0px 30px;">
														<td class="td-inner">׷������</td>
													</div>										
												</div>
												
																			
													
													<li class="td td-comment" style="position:relative;">
													<textarea style="width:80%;height:200px;left:0;" id="comment2_text" placeholder="��������������׷������!"></textarea>			
													<br/><br/>
													<a href="#" onclick="sendComment2(${ins.aab302})">
													<div class="am-btn am-btn-danger anniu" style="position:absolute;right:50px;bottom:5px;">
														׷������		
													</div>
													</a>
													</li>
		
											</ul>
		
										</div>
										<hr/>
									</div>
								</c:when>
							</c:choose>
							<a href="#" onclick="delComment(${ins.aab302})">
							<div class="am-btn am-btn-danger anniu" style="float:right;">
								ɾ������							
							</div>
							</a>
						</div>

					</div>

				</div>
				
			</div>

			
		</div>

	</body>

</html>