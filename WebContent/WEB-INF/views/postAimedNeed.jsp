<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>提交需求</title>

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
			$("#province").change(function() {	
				var p = $(this).val();
				$('input[name="provinceTmp"]').val(p);
			});
			$("#city").change(function() {	
				var p = $(this).val();
				$('input[name="cityTmp"]').val(" "+p+" ");
			});
			$("#area").change(function() {	
				var p = $(this).val();
				$('input[name="areaTmp"]').val(p);
			});
		})
		
		function sendNeed(vaaa102)
		{
			var vform = document.getElementById("myform");
			$('input[name="aac605"]').val($("#description").val());
			$('input[name="aac607"]').val($("#address").val());
			vform.action="<%=path%>/postAimedNeed.html?aaa102="+vaaa102;
			vform.submit();
			
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
			<input name="aac611" type="hidden" value="" />
			<input name="provinceTmp" type="hidden" value="浙江省" />
			<input name="cityTmp" type="hidden" value="温州市" />
			<input name="areaTmp" type="hidden" value="瑞安区" />
		</form>
		

		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap" style="margin-left:0px;">

					<div class="user-address">
						
						<div class="clear"></div>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增需求</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal">
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">服务商</label>
											<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:16px;">${ins.aac203 }</span><br/><br/>
											<label for="user-address" class="am-form-label">所在城市</label>
											<div class="am-form-content address">
												<select id="province" data-am-selected>
													<option value="浙江省" selected>浙江省</option>
													<option value="湖北省">湖北省</option>
												</select>
												<select id="city" data-am-selected>
													<option value="温州市" selected>温州市</option>
													<option value="武汉市" >武汉市</option>
												</select>
												<select id="area" data-am-selected>
													<option value="瑞安区" selected>瑞安区</option>
													<option value="洪山区">洪山区</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="address" placeholder="输入详细地址(非必须)"></textarea>
												<small>50字以内写出你的详细地址...</small>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">服务类型</label>
											<div class="am-form-content address">
												<select id="service-type" data-am-selected>
												<option value="01"  selected>${ins.type }</option>
													
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">服务方式</label>
											<div class="am-form-content address">
												<select id="service-method" data-am-selected>
													<option value="01" selected>${ins.method	 }</option>
													
												</select>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">需求说明</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="description" placeholder="输入详细说明" required="required"></textarea>
												<small>描述你的具体需求...</small>
											</div>
										</div>

										

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" onclick="sendNeed(1)">保存</a>
												<a href="javascript:;" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
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