<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>Ԥ��ҳ��</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="<%=path%>/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=path%>/js/address.js"></script>
		
		<script type="text/javascript">
			function prepay(){
				var vform = document.getElementById("myform");
				$('input[name="aac409"]').val($("#address").text());
				vform.action="<%=path%>/prepay.html";
				vform.submit();
			}
			
		</script>

	</head>

	<body>
		<form id="myform" action="###.html" method="post">
			<input name="aaa102" type="hidden" value="<%=session.getAttribute("aaa102") %>" />
			<input name="aac102" type="hidden" value="${ins.aac102 }" />
			<input name="aac302" type="hidden" value="${ins.aac302 }" />
			<input name="aac406" type="hidden" value="10" />
			<input name="aac407" type="hidden" value="${ins.aac303 }" />
			<input name="aac409" type="hidden" value="" />
			<input name="aac602" type="hidden" value="${ins.aac602 }" />
			<input name="aac410" type="hidden" value="${ins.aac603 }" />
			<input name="aac411" type="hidden" value="${ins.aac605 }" />
		</form>


			<div class="clear"></div>
			<div class="concent">
				<!--��ַ -->
				<div class="paycont">
	
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label style="font-size:20px;color:orange;">�������ͣ�</label>
										<p>${ins.aac603 }</p>	<br/>
										<label style="font-size:20px;color:orange;">����ʽ��</label>
										<p>${ins.aac604 }</p><br/>
										<label style="font-size:20px;color:orange;">����������ݣ�</label>
										<p>${ins.aac605 }</p><br/>
										<label style="font-size:20px;color:orange;">�����̱�ע��</label>
										<p>${ins.aac304 }</p><br/>
										<label style="font-size:20px;color:orange;">��������ַ��</label>
										<p id="address">${ins.aac606 }, ${ins.aac607 }</p><br/>
									</div>
								</div>

							</div>
							
							<div class="clear"></div>
							</div>
							

							<!--��Ϣ -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box" style="width:50%;">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">�ܼƼۣ�</em>
											<span class="price g_price ">
                                    		<span>&yen;</span> <em class="style-large-bold-red " id="J_ActualFee">${ins.aac303 }</em>
											</span>
										</div>
										<div class="buy-point-discharge ">
											<p class="price g_price ">
												Ԥ��<span>&yen;</span><em class="pay-sum">10.00</em>
											</p>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">�����̣�</span>
												<span class="buy--address-detail">
								   					${ins.aac103 }
												</span>
												<span class="buy--address-detail">
								   					400-426-45584781
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">�ͻ���</span>
												<span class="buy-address-detail">   
                                         		<span class="buy-user"><%=session.getAttribute("aaa102") %> </span>
												<span class="buy-phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="javascript:;" class="btn-go" tabindex="0" onclick="prepay() "title="����˰�ť��Ԥ������">ȷ��Ԥ��</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				
			</div>
			

			<div class="clear"></div>
	</body>

</html>