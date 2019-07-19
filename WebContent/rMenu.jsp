<%@ page language="java" pageEncoding="GBK"%>

<!--�˵� -->
<div class=tip>
	<div id="sidebar">
		<div id="wrap">
			<div id="prof" class="item ">
				<a href="# "> <span class="setting "></span> </a>
				<div class="ibar_login_box status_login ">
					<div class="avatar_box ">
						<p class="avatar_imgbox ">
							<img src="../images/no-img_mid_.jpg " />
						</p>
						<ul class="user_info ">
						<c:if test="${aaa103!=null }">
							<li>�û���${aaa103 }</li>
							<li>&nbsp;��ͨ��Ա</li>
						</c:if>
						<c:if test="${aaa103==null }">
							<li>�ο�״̬</li>
							<li>&nbsp;���ȵ�¼</li>
						</c:if>
						</ul>
					</div>
					<div class="login_btnbox ">
						<a href="# " class="login_order ">�ҵĶ���</a>
						 <a href="# " class="login_favorite ">�ҵ��ղ�</a>
					</div>
					<i class="icon_arrow_white "></i>
				</div>

			</div>
			<div id="shopCart " class="item " onclick="location.href='${path}/home/shopCart.html'">
				<a href="# "> <span class="message "></span> </a>
				<p>���ﳵ</p>
				<p class="cart_num ">${shopCartCount}</p>
			</div>
			<div id="asset " class="item ">
				<a href="# "> <span class="view "></span> </a>
				<div class="mp_tooltip ">
					�ҵ��ʲ� <i class="icon_arrow_right_black "></i>
				</div>
			</div>

			<div id="foot " class="item ">
				<a href="# "> <span class="zuji "></span> </a>
				<div class="mp_tooltip ">
					�ҵ��㼣 <i class="icon_arrow_right_black "></i>
				</div>
			</div>

			<div id="brand " class="item ">
				<a href="#"> <span class="wdsc "><img
						src="../images/wdsc.png " /> </span> </a>
				<div class="mp_tooltip ">
					�ҵ��ղ� <i class="icon_arrow_right_black "></i>
				</div>
			</div>

			<div id="broadcast " class="item ">
				<a href="# "> <span class="chongzhi "><img
						src="../images/chongzhi.png " /> </span> </a>
				<div class="mp_tooltip ">
					��Ҫ��ֵ <i class="icon_arrow_right_black "></i>
				</div>
			</div>

			<div class="quick_toggle ">
				<li class="qtitem "><a href="# "><span class="kfzx "></span>
				</a>
					<div class="mp_tooltip ">
						�ͷ�����<i class="icon_arrow_right_black "></i>
					</div></li>
				<!--��ά�� -->
				<li class="qtitem "><a href="#none "><span
						class="mpbtn_qrcode "></span> </a>
					<div class="mp_qrcode " style="display:none; ">
						<img src="../images/weixin_code_145.png " /><i
							class="icon_arrow_white "></i>
					</div></li>
				<li class="qtitem "><a href="#top " class="return_top "><span
						class="top "></span> </a></li>
			</div>

			<!--�ص����� -->
			<div id="quick_links_pop " class="quick_links_pop hide "></div>

		</div>

	</div>
	<div id="prof-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>��</div>
	</div>
	<div id="shopCart-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>���ﳵ</div>
	</div>
	<div id="asset-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>�ʲ�</div>

		<div class="ia-head-list ">
			<a href="# " target="_blank " class="pl ">
				<div class="num ">0</div>
				<div class="text ">�Ż�ȯ</div> </a> <a href="# " target="_blank "
				class="pl ">
				<div class="num ">0</div>
				<div class="text ">���</div> </a> <a href="# " target="_blank "
				class="pl money ">
				<div class="num ">��0</div>
				<div class="text ">���</div> </a>
		</div>

	</div>
	<div id="foot-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>�㼣</div>
	</div>
	<div id="brand-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>�ղ�</div>
	</div>
	<div id="broadcast-content " class="nav-content ">
		<div class="nav-con-close ">
			<i class="am-icon-angle-right am-icon-fw "></i>
		</div>
		<div>��ֵ</div>
	</div>
</div>