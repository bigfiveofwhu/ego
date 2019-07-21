<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
		<link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
		<title>��������</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=path%>/layui/dist/layui.js" charset="utf-8"></script>
		
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#comment1 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab409"]').val(p);
					$("#point1").text(p);
				});
				
				$("#comment2 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab411"]').val(p);
					$("#point2").text(p);
				});
				
				$("#comment3 li").click(function() {	
					$(this).prevAll().children('i').addClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");	
					var p = $(this).val();
					$('input[name="aab410"]').val(p);
					$("#point3").text(p);
					
				});
	    	 })
	    	function sendComment(vaab302)
			{
				var vform = document.getElementById("myform");
				$('input[name="aab403"]').val($("#comment_text").val());
				vform.action="<%=path%>/makeComment.html?aab302="+vaab302;
				vform.submit();
			}
		</script>
		
		<script src="<%=path%>/js/jquery-3.2.0.min.js" ></script>
		<script src="<%=path%>/js/bootstrap.bundle.js"></script>
		<script src="<%=path%>/layui/layui.js"></script>								
		<script type="text/javascript">
		layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  
		  //��ͼƬ�ϴ�
		  upload.render({
		    elem: '#test2'
		    ,url: 'makeComment.html'
		    ,multiple: true
		    ,before: function(obj){
		      //Ԥ�������ļ�ʾ������֧��ie8
		      obj.preview(function(index, file, result){
		        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
		      });
		    }
		    ,done: function(res){
		      //�ϴ����
		    }
		  });
		
		  
		});
		</script>
		
	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post" >
		<!-- input name="aaa102"  value="<%=session.getAttribute("aaa102") %>" type="hidden"/-->
		<input name="aab409" type="hidden"/>
		<input name="aab411" type="hidden"/>
		<input name="aab410" type="hidden"/>
		<input name="aab403" type="hidden"/>
		<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		<input name="aab412" value="02" type="hidden"/>
		</form>
		
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin:0px;">

					<div class="user-comment">
						<!--���� -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">��������</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��������</p>
										</a>
									</div>
								</div>
								<div id="comment1" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point1" >0</span>��</div>
								</div> 
								
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��������</p>
										</a>
									</div>
								</div>
								<div id="comment2" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point2" >0</span>��</div>
								</div>
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">��Ʒ����</p>
										</a>
									</div>
								</div>
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="<%=path%>/images/comment.jpg_400x400.jpg" class="itempic">
									</a>
								</div>
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">��Ʒ��:${ins.aab202 }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>������:${ins.aab302 }</span>
											<span>����2:����</span>
										</div>
										<div class="item-price">
											�۸�<strong>&yen;${ins.aab314 }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<hr/>

								<div class="item-comment">
									<textarea id="comment_text" placeholder="��д�¶Ա����ĸ��ܰɣ������˰����ܴ�Ŷ��"></textarea>
								</div>
								<!--div class="filePic">
									<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
									  <legend>�ϴ�����ͼƬ</legend>
									</fieldset>
									
									<div class="layui-upload">
									  <button type="button" class="layui-btn" id="test2">��ͼƬ�ϴ�</button> 
									  
									  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
									    Ԥ��ͼ��
									    <div class="layui-upload-list" id="demo2"></div>
									 </blockquote>
									</div>
								</div-->
								
								<div id="comment3" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point3" >0</span>��</div>
								</div> 

							</div>

							<div class="info-btn" onclick="sendComment(${ins.aab302})">
								<div class="am-btn am-btn-danger">��������</div>
							</div>
							<%int point=0; %>
														
										
					
												
							
						</div>

					</div>

				</div>
				
			</div>

			
		</div>

	</body>

</html>