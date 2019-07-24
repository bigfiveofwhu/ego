<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/prompt.jsp" %>
<!--���������� -->
<div class="am-container header">
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${aaa102==null}">
				<a href="${path }/home/login.jsp" target="_top" class="h">�ף����¼</a>
				<a href="register.jsp" target="_top">���ע��</a>
				</c:when>
				<c:otherwise>
				<label style="color:#0000FF">��ӭ<font style="color:red">��${aaa103}��</font>eGO�̳�</label>
	    		&emsp;
	    		<label><a href="${path}/logout.html">ע��</a></label>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="${path }/home/home.html" target="_top" class="h">�̳���ҳ</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<c:choose>
					<c:when test="${aaa102!=null}">
				<a href="${path}/person/entry.html" target="_top"><i class="am-icon-user am-icon-fw"></i>��������</a>
				</c:when>
				<c:otherwise>
				<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>ϵͳ��Ϣ</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${aaa102!=null}">
				  <a id="mc-menu-hd" href="${path }/home/shopCart.html" target="_top">
				  <i class="am-icon-shopping-cart  am-icon-fw"></i>
				  <span>���ﳵ</span>
				  <strong id="J_MiniCartNum" class="h">${shopCartCount }</strong>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-hd" href="${path }/home/shopcart.jsp" target="_top">
					<i class="am-icon-shopping-cart  am-icon-fw"></i>
					<span>���ﳵ</span>
					<strong id="J_MiniCartNum" class="h">${CARTNUM_IN_SESSION}</strong>
				</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd">
				<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>�ղؼ�</span>
				</a>
			</div>
		</div>
		<div class="topMessage localCity">
			<div class="menu-hd">
				<a href="${path }/localCity/home.html" id="mc-menu-localCity" target="_top">
				<i class="am-icon-heart am-icon-fw"></i>
				<span>ͬ�Ƿ���</span>
				</a>
			</div>
		</div>
		<c:if  test="${aaa102!=null}">
		<div class="topMessage shop">
			<div class="menu-hd">
			<c:choose>
				<c:when test="${aab102!=null}">
				  <a id="mc-menu-shop" onclick="checkIn();" href="#" target="_top">
				  <span>�������</span>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-shop" href="${path}/shop/register.html" target="_top">
					<span>�Լ�����?</span>
				    </a>
				</c:otherwise>
				</c:choose>
				</a>
			</div>
		</c:if>
		</div>
	</ul>
</div>

<script src="/ego/layui/layui.js"></script>
<script>
layui.use('layer', function(){
	layer = layui.layer;
});
	function checkIn()
{
	$.ajax({
		url:"${path}/checkInShop.ajax",
		type:"post",
		dataType:"json",
		timeout:20000,
		data:{
		},
		success:function(res,status){
			console.log(res.check);
			if(res.check == 1)
			location.href="${path}/shop/background.html";
			else
				layer.msg("��ע��ĵ������������...");
		},
		error:function(res){
			 alert("�������");
		}
	});
}
</script>
