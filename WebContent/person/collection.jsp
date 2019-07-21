<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>�ҵ��ղ�</title>

		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=path%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/css/colstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	</head>

	<body>
		
      	        <!--���� -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">�ҵ��ղ�</strong> / <small>My&nbsp;Collection</small></div>
				</div>
				<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
					<li class=""><a id="pro"   href="#tab1">�ղ���Ʒ</a></li>
					<li class=""><a id="shop" href="#tab2">�ղص���</a></li>
				</ul>
					<div class="user-collection"  id="tab1">
					
						<hr/>

						<div class="you-like">
					
							<div class="s-content">
		
		       <c:forEach items="${proList }" var="ins" varStatus="vs">

                              <c:if test="${ins.aab212 != 04 }">
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="#" class="s-pic-link">
												<img src="/ego/images/01_mid.jpg" alt="${ins.aab202 }" title="${ins.aab202 }" class="s-pic-img s-guess-item-img">
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="#" title="${ins.aab202 }">${ins.aab202 }</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">��</em><em class="s-value">${ins.aab205 }</em></span>
											</div>
											<div class="s-extra-box">
												<span class="s-comment">����: 99.74%</span>
												<span class="s-sales">��� :${ins.aab206 }</span>
											</div>
										</div>
										<div class="s-tp">
											<span class="ui-btn-loading-before">���빺�ﳵ</span>
											<i class="am-icon-shopping-cart"></i>
											<span class="ui-btn-loading-before buy" onclick="delCollection('${ins.aaa301}');">ȡ���ղ�</span>
											<p>
												<a href="javascript:;" class="c-nodo J_delFav_btn">ȡ���ղ�</a>
											</p>
										</div>
									</div>
								</div>
                              </c:if>

                              <c:if test="">
								<div class="s-item-wrap">
									<div class="s-item">

										<div class="s-pic">
											<a href="#" class="s-pic-link">
												<img src="<%=path%>/images/-0-saturn_solar.jpg_220x220.jpg" alt="4������!ʮ����Ф925��Ů��ָ,ʱ�п���Ů��" title="4������!ʮ����Ф925��Ů��ָ,ʱ�п���Ů��" class="s-pic-img s-guess-item-img">
											<span class="tip-title">���¼�</span>
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="#" title="4������!ʮ����Ф925��Ů��ָ,ʱ�п���Ů��">4������!ʮ����Ф925��Ů��ָ,ʱ�п���Ů��</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">��</em><em class="s-value">378.00</em></span>
												<span class="s-history-price"><em class="s-price-sign">��</em><em class="s-value">1888.00</em></span>
											</div>
											<div class="s-extra-box">
												<span class="s-comment">����: 99.93%</span>
												<span class="s-sales">����: 278</span>
											</div>
										</div>
										<div class="s-tp">
											<span class="ui-btn-loading-before">�������</span>
											<i class="am-icon-trash"></i>
											<span class="ui-btn-loading-before buy">�������</span>
											<p>
												<a href="javascript:;" class="c-nodo J_delFav_btn">ȡ���ղ�</a>
											</p>
										</div>
									</div>
								</div>
							</c:if>
								
				</c:forEach>
							</div>

						</div>

					</div>
                    <div  id="tab2"></div>
				
	</body>
<script src="/ego/layui/layui.js"></script>
<script type="text/javascript">
$("#pro").click(function(){
	$("#tab1").show();
	$("#tab2").hide();
});
$("#shop").click(function(){
	$("#tab1").hide();
	$("#tab2").show();
})



layui.use('layer', function(){
	layer = layui.layer;
});

function delCollection(id)
{
	$.ajax({
		url:"${path}/delCollection.ajax",
		type:"post",
		dataType:"json",
		timeout:20000,
		data:{
			"aaa301": id
		},
		success:function(res,status){
			    location.href="${path}/person/showCollection.html";
			    layer.msg("ɾ���ɹ�");
		},
		error:function(res,status){
			location.href="${path}/person/showCollection.html"
			console.log("ɾ��ʧ��");
		}
	});
}
</script>
</html>