<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/localCity/location.jsp" %>
<!--顶部导航条 -->
<div class="am-container header">
	<ul class="message-l local-l">
		<div class="topMessage localtion">
			<div class="menu-hd">
				<div class="top-local">
					<p class="local-title">当前位置:</p>
					<p id="myLocal"></p>
				</div>
			</div>
		</div>
		<div class="topMessage">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${aaa102==null}">
				<a href="${path }/home/login.jsp" target="_top" class="h">亲，请登录</a>
				<a href="register.jsp" target="_top">免费注册</a>
				</c:when>
				<c:otherwise>
				<label style="color:#0000FF">欢迎<font style="color:red">【${aaa103}】</font>eGO商城</label>
	    		&emsp;
	    		<label><a href="${path}/logout.html">注销</a></label>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="${path }/home/home.html" target="_top" class="h">商城首页</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<c:choose>
					<c:when test="${aaa102!=null}">
				<a href="${path}/person/index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</c:when>
				<c:otherwise>
				<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>系统消息</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%-- 
		<div class="topMessage mini-cart">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${aaa102!=null}">
				  <a id="mc-menu-hd" href="${path }/home/shopCart.html" target="_top">
				  <i class="am-icon-shopping-cart  am-icon-fw"></i>
				  <span>购物车</span>
				  <strong id="J_MiniCartNum" class="h">${shopCartCount }</strong>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-hd" href="${path }/home/shopcCart.html" target="_top">
					<i class="am-icon-shopping-cart  am-icon-fw"></i>
					<span>购物车</span>
					<strong id="J_MiniCartNum" class="h">${CARTNUM_IN_SESSION}</strong>
				</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>--%>
		<div class="topMessage favorite">
			<div class="menu-hd">
				<a href="${path}/person/index.jsp?iframe=${path}/person/showCollection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
				</a>
			</div>
		</div>
		<div class="topMessage localCity">
			<div class="menu-hd">
				<a href="${path }/localCity/home.html" id="mc-menu-localCity" target="_top">
				<i class="am-icon-heart am-icon-fw"></i>
				<span>同城服务</span>
				</a>
			</div>
		</div>
		<c:if test="${aaa102!=null}">
		<div class="topMessage shop">
			<div class="menu-hd">
			<c:choose>
				<c:when test="${aab102!=null}">
				  <a id="mc-menu-shop" onclick="checkIn();" target="_top">
				  <span>进入店铺</span>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-shop" href="${path}/shop/register.html" target="_top">
					<span>自己开店?</span>
				    </a>
				</c:otherwise>
				</c:choose>
				</a>
			</div>
		</div>
		<div class="topMessage service-head">
			<div class="menu-hd">
			<c:choose>
				<c:when test="${aac102!=null}">
				  <a id="mc-menu-service" onclick="enterService()" target="_top">
				  <span>服务管理</span>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-service" href="${path}/localCity/register.html" target="_top">
					<span>申请服务商资格?</span>
				    </a>
				</c:otherwise>
				</c:choose>
				</a>
			</div>
		</div>
		</c:if>
	</ul>
</div>

<script>
layui.use('layer', function(){
	layer = layui.layer;
});
function enterService(){
	$.ajax({
		url:"${path}/enterService.ajax",
		type:"post",
		dataType:"json",
		timeout:20000,
		success:function(res,status){
			if(res.status=='200'){
				location.href='${path}/localCity/service/background.html';
			}else{
				layer.msg("你注册的服务商正在审核中...");
			}
		},
		error:function(res,status){
			layer.msg("网络故障!");
		}
	});
}
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
				layer.msg("你注册的店铺正在审核中...");
		},
		error:function(res){
			layer.msg("网络错误");
		}
	});
}
</script>
