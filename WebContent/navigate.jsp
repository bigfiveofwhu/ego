<%@ page language="java" pageEncoding="GBK"%>
<!--���������� -->
<div class="am-container header">
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<c:choose>
				<c:when test="${aaa102==null}">
			
				<a href="login.jsp" target="_top" class="h">�ף����¼</a>
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
				<a href="#" target="_top" class="h">�̳���ҳ</a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<c:choose>
					<c:when test="${aaa102!=null}">
				<a href="../person/information.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>��������</a>
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
				  <a id="mc-menu-hd" href="shopcart.jsp" target="_top">
				  <i class="am-icon-shopping-cart  am-icon-fw"></i>
				  <span>���ﳵ</span>
				  <strong id="J_MiniCartNum" class="h">0</strong>
				  </a>
				</c:when>
				<c:otherwise>
					<a id="mc-menu-hd" href="#" target="_top">
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
				<a href="#" id="mc-menu-localCity" target="_top">
				<i class="am-icon-heart am-icon-fw"></i>
				<span>ͬ�Ƿ���</span>
				</a>
			</div>
		</div>
		<div class="topMessage shop">
			<div class="menu-hd">
			<c:choose>
				<c:when test="${aab102!=null}">
				  <a id="mc-menu-shop" href="${path}/shop/home.html" target="_top">
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
		</div>
	</ul>
</div>