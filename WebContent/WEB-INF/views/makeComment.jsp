<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
		<link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
		<title>发表评论</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/appstyle.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/ego/layui/css/layui.css">
		<script src="<%=path%>/js/jquery-3.2.0.min.js" ></script>
		<script src="<%=path%>/layui/layui.js" charset="utf-8"></script>
		
		
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
// 	    	function sendComment(vaab302)
// 			{
// 				var vform = document.getElementById("myform");
// 				$('input[name="aab403"]').val($("#comment_text").val());
<%-- 				vform.action="<%=path%>/makeComment.html?aab302="+vaab302; --%>
// 				vform.submit();
// 			}
			
		</script>
							
		
	</head>

	<body>
		<form id="myform" action="<%=path%>/###.html" method="post" >
		<!-- input name="aaa102"  value="<%=session.getAttribute("aaa102") %>" type="hidden"/-->
		<input name="aab302" type="hidden" value="${ins.aab302 }"/>
		<input name="aab409" type="hidden"/>
		<input name="aab411" type="hidden"/>
		<input name="aab410" type="hidden"/>
		<input name="aab203" value="${ins.aab203 }" type="hidden"/>
		<input name="aab412" value="02" type="hidden"/>
		</form>
		
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin:0px;">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">物流评价</p>
										</a>
									</div>
								</div>
								<div id="comment1" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point1" >0</span>分</div>
								</div> 
								
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">服务评价</p>
										</a>
									</div>
								</div>
								<div id="comment2" class="item-opinion">
									<li value="1" ><i class="op1"></i></li>
									<li value="2" ><i class="op1"></i></li>
									<li value="3" ><i class="op1"></i></li>
									<li value="4" ><i class="op1"></i></li>
									<li value="5" ><i class="op1"></i></li>
									<div style="width:50%;float:right;" align="left"><span id="point2" >0</span>分</div>
								</div>
							</div>
							<br/><br/><br/>
							<div class="comment-list">
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info" align="center" style="font-size:18px">商品评价</p>
										</a>
									</div>
								</div>
								<c:set var="url" value="${ins.aab208 }" scope="request"></c:set>
								<% String url=(request.getAttribute("url")).toString();
							  		String[] arr=url.split(";");
								%>
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="<%=path%><%=arr[0] %>" class="itempic">
									</a>
								</div>
								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">商品名:${ins.aab202 }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>订单号:${ins.aab302 }</span>
											
										</div>
										<div class="item-price">
											价格：<strong>&yen;${ins.aab314 }</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<hr/>

								<div class="item-comment">
									<textarea id="comment_text" name="aab403" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								<!-- 文件上传 -->
								<div class="layui-upload" style="width:50%">
								  <button type="button" class="layui-btn" id="test2">图片上传</button> 
								  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
								    预览图：
								    <div class="layui-upload-list" id="demo2"></div>
								 </blockquote>
								</div>
								<!--div class="filePic">
									<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
									  <legend>上传多张图片</legend>
									</fieldset>
									
									<div class="layui-upload">
									  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
									  
									  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
									    预览图：
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
									<div style="width:50%;float:right;" align="left"><span id="point3" >0</span>分</div>
								</div> 

							</div>
							<div class="info-btn">
								<div class="am-btn am-btn-danger" id="submit_comment">发表评论</div>
							</div>
							<% int point=0; %>
							
						</div>

					</div>

				</div>
				
			</div>

			
		</div>

	</body>
			

<script src="<%=path%>/js/bootstrap.bundle.js"></script>
<script>
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;
	  
	//多图片上传
	  upload.render({
	    elem: '#test2'
	    ,url: '/ego/makeComment.ajax'
	    ,multiple: false
	    ,data:{
	    	aab409:function(){return $("[name='aab409']").val()},
	    	aab410:function(){return $("[name='aab410']").val()},
	    	aab411:function(){return $("[name='aab411']").val()},
	    	aab403:function(){return $("[name='aab403']").val()},
	    	aab203:function(){return $("[name='aab203']").val()},
	    	aab302:function(){return $("[name='aab302']").val()},
	    }
	    ,choose: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
	      });
	    }
	    ,done: function(res){
	      	if(res.result==true){
	      		location.replace("/ego/showComment.html")
	      	}else{
	      		alert(res.reason);
	      	}
	    }
	    ,error:function(){
	    	alert("网络错误")
	    }
	    ,auto:false
	    ,bindAction:'#submit_comment'
	  });
});

</script>
</html>