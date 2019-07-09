<%@ page language="java" pageEncoding="GBK"%>
<!--顶部导航条 -->
<div class="am-container header">
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${USER_IN_SESSION==null}">
			
				<a href="login.jsp" target="_top" class="h">亲，请登录</a>
				<a href="register.jsp" target="_top">免费注册</a>
				</c:when>
				<c:when test="${USER_IN_SESSION!=null}">
	    		<label>欢迎<font style="color:red">【${USER_IN_SESSION.username}】</font>光临悦桔商城</label>
	    		&emsp;<label><a href="${url}/logout">注销</a></label>
				</c:when>
				</c:choose>
			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="#" target="_top" class="h">商城首页</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<c:choose>
					<c:when test="${USER_IN_SESSION!=null}">
				<a href="../person/information.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</c:when>
					<c:when test="${USER_IN_SESSION==null}">
						<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd">
			
				<c:choose>
				<c:when test="${USER_IN_SESSION==null}">
			
				  <a id="mc-menu-hd" href="#" target="_top"><i
					class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
					id="J_MiniCartNum" class="h">${CARTNUM_IN_SESSION}</strong> </a>
				</c:when>
				<c:when test="${USER_IN_SESSION!=null}">
			
				  <a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i
					class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
					id="J_MiniCartNum" class="h">0</strong> </a>
				</c:when>
				</c:choose>
			</div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd">
				<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
				</a>
			</div>
	</ul>
</div>