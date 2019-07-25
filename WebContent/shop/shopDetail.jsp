<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>商品详情</title>
		<%@include file="/head.jsp" %>
		<link href="<%=path %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="<%=path%>/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/style.css" rel="stylesheet" />
		<link type="text/css" href="<%=path%>/css/shop/detail.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=path%>/basic/js/quick_links.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="<%=path%>/js/list.js"></script>
		<%@include file="/prompt.jsp" %>
		
	</head>
	<body>
		<!--顶部导航条 -->
		<%@include file="/navigate.jsp" %>
		<!--悬浮搜索框-->
		<%@include file="/navSearch.jsp" %>
		<div class="clear"></div>
        <b class="line"></b>
			<div class="listMain">
				<!--分类-->
			<div class="nav-table">
			  <%@include file="/navClassify.jsp" %>
			</div>
			<ol class="am-breadcrumb am-breadcrumb-slash">
				<li><a href="#">首页</a></li>
				<li><a href="#">分类</a></li>
				<li class="am-active">内容</li>
			</ol>
			<script type="text/javascript">
				$(function() {});
				$(window).load(function() {
					$('.flexslider').flexslider({
						animation: "slide",
						start: function(slider) {
							$('body').removeClass('loading');
						}
					});
				});
			</script>
			<div class="scoll">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<img src="<%=path%>/images/01.jpg" title="pic" />
							</li>
							<li>
								<img src="<%=path%>/images/02.jpg" />
							</li>
							<li>
								<img src="<%=path%>/images/03.jpg" />
							</li>
						</ul>
					</div>
				</section>
			</div>
				<div class="shopDetail" onclick="location.href='<%=path%>/shop/home.html?shopId=${product.aab102}'">
				<img alt="${product.aab103}" src="<%=path%>/images/02.jpg">
				<p>${product.aab103}</p>
				<a>进入店铺</a>
				</div>
				<!--放大镜-->
				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">
						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>
							<div class="tb-booth tb-pic tb-s310">
							<c:forEach items="${headImgs}" var="Img" varStatus="vs">
							<c:if test="${vs.count==1}">
								<a href="<%=path%>${Img}">
								<img src="<%=path%>${Img}" alt="细节展示放大镜特效" rel="<%=path%>${Img}" class="jqzoom" />
								</a>
							</c:if>
							</c:forEach>
							</div>
							<ul class="tb-thumb" id="thumblist">
							<c:forEach items="${headImgs}" var="Img" varStatus="vs">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a>
										<img src="<%=path%>${Img}" mid="<%=path%>${Img}" big="<%=path%>${Img}">
										</a>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clearfixRight">
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>${product.aab202 }</h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<dd><em>&yen;</em><b class="sys_item_price">${product.aab205 }</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<dd><em>&yen;</em><b class="sys_item_mktprice">${product.aab205 }</b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							<!--地址-->
							<dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select name="addr_1" id="addr_1"></select>
										<select name="addr_2" id="addr_2"></select>
										<select name="addr_3" id="addr_3"></select>
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>
							<script type="text/javascript">
								$(function(){
									$("#addr_1").change(function(){
										var A_id=$(this).children("option:selected").attr("A_id");
										$("#addr_2").html("");
										$("#addr_3").html("");
										loadAddr(A_id,2);
									});
									$("#addr_2").change(function(){
										var A_id=$(this).children("option:selected").attr("A_id");
										$("#addr_3").html("");
										loadAddr(A_id,3);
									});
									<%-- 地址初始化的异步加载--%>
									function loadAddr(type,index){
										if(index>3) return;
										$.ajax({
											url:"<%=basePath%>/getAddr.ajax",
											type:"post",
											timeout:20000,
											dataType:"json",
											data:{
												"type":type
											},
											success:function(res,status){
												var addrs=res.addrs;
												var n=addrs.length;
												var html="";
												var p=0;
												if(n>0){
													for(var i=0;i<n;i++){
														var kk;
														switch(index){
														case 1:
															kk= addrs[i].areaname=='${addr_1}';
															break;
														case 2:
															kk= addrs[i].areaname=='${addr_2}';
															break;
														case 3:
															kk= addrs[i].areaname=='${addr_3}';
															break;
														}
														if(kk){
															html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"' selected='selected'>"+addrs[i].areaname+"</option>";
															p=i;
														}else{
															html+="<option value='"+addrs[i].areaname+"' A_id='"+addrs[i].areaid+"'>"+addrs[i].areaname+"</option>";
														}
													}
												}
												$("#addr_"+index).html(html);
												loadAddr(addrs[p].areaid,++index);
											},
											error:function(res,status){
												console.log("#addr_"+index+"地址异步加载错误");
											}
										});
									}
									loadAddr("-1",1);
								});
							</script>
							<div class="clear"></div>
							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon">
									<span class="tm-label">月销量</span>
									<span class="tm-count">
									<c:if test="${lastMouthSum==null}">0</c:if>
									<c:if test="${lastMouthSum!=null}">${lastMouthSum}</c:if>
									</span>
									</div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon">
									<span class="tm-label">累计销量</span>
									<span class="tm-count">
									<c:if test="${Sum==null}">0</c:if>
									<c:if test="${Sum!=null}">${Sum}</c:if>
									</span>
									</div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon">
									<span class="tm-label">累计评价</span>
									<span class="tm-count">
									<c:if test="${commentSum==null}">0</c:if>
									<c:if test="${commentSum!=null}">${commentSum}</c:if>
									</span>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->
									<div class="theme-popover-mask"></div>
									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="<%=path %>/user/purchase.html" method="post">
												<div class="theme-signin-left">
												<c:forEach items="${spec}" var="t" varStatus="index">
													<div class="theme-options" value="${index.index }">
														<div class="cart-title cart-title${index.index }">${t.title }</div>
														<ul>
														<c:forEach items="${t.subTypes }" var="list" varStatus="i">
														  <c:if test="${i.index==0 }">
															<li class="sku-line selected">${list }<i></i></li>
														  </c:if>
														  <c:if test="${i.index!=0 }">
															<li class="sku-line">${list }<i></i></li>
														  </c:if>
														</c:forEach>
														</ul>
													</div>
												</c:forEach>
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="" type="text" value="1" style="width:30px;" readonly="readonly"/>
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">${product.aab206 }</span>件</span>
														</dd>
							  						</div>
													<div class="clear"></div>
													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="<%=path%>/images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">&yen;${product.aab205 }</span>
														<span id="Stock" class="tb-hidden">库存<span class="stock">${product.aab206 }</span>件</span>
													</div>
												</div>
											</form>
										</div>
									</div>
								</dd>
							</dl>
							<div class="clear"></div>
							<!--活动	-->
							<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">店铺优惠</dt>
									<div class="gold-list">
										<p><span>点击领券<i class="am-icon-sort-down"></i></span></p>
									</div>
								</div>
								<div class="clear"></div>
								<div class="coupon">
									<dt class="tb-metatit">优惠券</dt>
									<div class="gold-list">
										<ul>
										<c:forEach items="${coupons }" var="item">
											<c:choose>
												<c:when test="${item.aab502=='1'}"><%--无条件 --%>
													<li ><a class="coupon-item" onclick="getCoupon(${item.aab501})" style="color:white">立减${item.aab503}</a></li>
												</c:when>
												<c:when test="${item.aab502=='2'}"><%--满减 --%>
													<li ><a class="coupon-item" onclick="getCoupon(${item.aab501})" style="color:white">满${item.aab504}减${item.aab503 }</a></li>
												</c:when>
											</c:choose>
										</c:forEach>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="pay">
							<div class="pay-opt">
							<a href="<%=path %>/home/home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a ><span onclick="addCollection();" class="am-icon-heart am-icon-fw">收藏</span></a>
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" onclick="purchase()">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入购物车" onclick="addShopCart('${product.aab203}')"><i></i>加入购物车</a>
								</div>
							</li>
						</div>
						<form action="<%=path %>/createOrder.html" method="post" id="pur">
							<input type="hidden" id="pur-productId" name="aab203" value="${product.aab203}" >
							<input type="hidden" id="pur-count" name="count" value="" >
							<input type="hidden" id="pur-args" name="args" value="" >
							<input type="hidden" id="pur-fee" name="fee" value="10" >
						</form>
						<script type="text/javascript">
							function purchase(){
								if('${aaa102}'==''){
									promptGlobal("请先登录!");
									return;
								}
								var count=parseInt($("#text_box").val());
								if(isNaN(count)){
									promptGlobal("格式错误!");
									return;
								}
								var sum=parseInt('${product.aab206 }');
								if(count>sum){
									alert("请重新选择数量!");
									return;
								}
								$("#pur-count").attr("value",count);
								$("#pur-args").attr("value",getArgs());
								$("#pur").submit();
							}
							function addShopCart(productId){
								var count=parseInt($("#text_box").val());
								console.log($("#text_box").val());
								if(isNaN(count)){
									promptGlobal("格式错误!");
									return;
								}
								var sum=parseInt('${product.aab206 }');
								if(count>sum){
									promptGlobal("请重新选择数量!");
									return;
								}
								$.ajax({
									url:"<%=path%>/addShopCart.ajax",
									type:"post",
									dataType:"json",
									timeout:20000,
									data:{
										"aab203":productId,
										"aaa202":count,
										"aaa205":getArgs()
									},
									success:function(res,status){
										if(res.status=='200'){
											promptGlobal("加入购物车成功!");
										}else if(res.status=='201'){
											promptGlobal("加入购物车失败!");
										}else if(res.status='202'){
											promptGlobal("请先登录!");
										}
									},
									error:function(res,status){
										promptGlobal("网络故障!");
									}
								});
							}
							function getArgs(){
								var options=$(".theme-options");
								var n=options.length-1;
								
								var value=options[0].getAttribute("value");
								var title=$(".cart-title"+value).text();
								var val=$(".cart-title"+value).siblings("ul").children(".selected").text();
								var aaa205=title+","+val;
								for(var i=1;i<n;i++){
									value=options[i].getAttribute("value");
									title=$(".cart-title"+value).text();
									val=$(".cart-title"+value).siblings("ul").children(".selected").text();
									aaa205+=";"+title+","+val;
								}
								return aaa205;
							}
						</script>
					</div>
					<div class="clear"></div>
				</div>
				<!--优惠套装-->
<!-- 				<div class="match"> -->
<!-- 					<div class="match-title">优惠套装</div> -->
<!-- 					<div class="match-comment"> -->
<!-- 						<ul class="like_list"> -->
<!-- 							<li> -->
<!-- 								<div class="s_picBox"> -->
<%-- 									<a class="s_pic" href="#"><img src="<%=path%>/images/cp.jpg"></a> --%>
<!-- 								</div> <a class="txt" target="_blank" href="#">萨拉米 1+1小鸡腿</a> -->
<!-- 								<div class="info-box"> <span class="info-box-price">&yen; 29.90</span> <span class="info-original-price">￥ 199.00</span> </div> -->
<!-- 							</li> -->
<!-- 							<li class="plus_icon"><i>+</i></li> -->
<!-- 							<li> -->
<!-- 								<div class="s_picBox"> -->
<%-- 									<a class="s_pic" href="#"><img src="<%=path%>/images/cp2.jpg"></a> --%>
<!-- 								</div> <a class="txt" target="_blank" href="#">ZEK 原味海苔</a> -->
<!-- 								<div class="info-box"> <span class="info-box-price">&yen; 8.90</span> <span class="info-original-price">￥ 299.00</span> </div> -->
<!-- 							</li> -->
<!-- 							<li class="plus_icon"><i>=</i></li> -->
<!-- 							<li class="total_price"> -->
<!-- 								<p class="combo_price"><span class="c-title">套餐价:</span><span>&yen;35.00</span> </p> -->
<!-- 								<p class="save_all">共省:<span>&yen;463.00</span></p> <a href="#" class="buy_now">立即购买</a> </li> -->
<!-- 							<li class="plus_icon"><i class="am-icon-angle-right"></i></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="clear"></div>
				<!-- introduce-->
				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>		    
						     	<div class="mt">
						            <h2>看了又看</h2>        
					            </div>
					            
					            <c:forEach items="${guessProducts}" var="item" varStatus="vs">
					            	<c:choose>
					            		<c:when test="${vs.count==1 }"> <li class="first"></c:when>
					            		<c:otherwise> <li> </c:otherwise>
					            	</c:choose>
					            	
						            	<div class="p-img">                    
								      		<a  href="<%=path%>/shop/detail.html?aId=${item.aad302 }&productId=${item.aad306}"> <img class="" src="<%=path%>/images/advertise/${item.aad307}"> </a>               
								      	</div>
								      	<div class="p-name"><a href="#">
								      		${item.aab202 }
								      	</a>
								      	</div>
								      	<div class="p-price"><strong>￥${item.aab205 }</strong></div>
								      </li>
					            	
					            </c:forEach>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#"><span class="index-needs-dt-txt">宝贝详情</span></a>
								</li>
								<li>
									<a href="#"><span class="index-needs-dt-txt">全部评价</span></a>
								</li>
								<li>
									<a href="#"><span class="index-needs-dt-txt">同类商品</span></a>
								</li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">
										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
										<c:forEach items="${productInfos}" var="pI">
											<li title="">${pI}</li>
										</c:forEach>
										</ul>
										<div class="clear"></div>
									</div>
									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品细节</h4>
										</div>
										<div class="twlistNews">
											<c:forEach items="${productImgs }" var="pI">
											<img src="<%=path%>${pI}"/>
											</c:forEach>
										</div>
									</div>
									<div class="clear"></div>
								</div>
								<div class="am-tab-panel am-fade">
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>
                                    		<c:if test="${commentSum==0}">
                                    		100
                                    		</c:if>
                                    		<c:if test="${commentSum!=0}">
                                    		<fmt:formatNumber value="${bestSum/(commentSum*1.0)*100}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
                                    		</c:if>
                                    		<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                       			<q class="comm-tags"><span>味道不错</span><em></em></q>
                                       			<q class="comm-tags"><span>颗粒饱满</span><em></em></q>
                                       			<q class="comm-tags"><span>口感好</span><em></em></q>
                                       			<q class="comm-tags"><span>商品不错</span><em></em></q>
                                       			<q class="comm-tags"><span>香脆可口</span><em></em></q>
                                       			<q class="comm-tags"><span>个个开口</span><em></em></q>
                                       			<q class="comm-tags"><span>价格便宜</span><em></em></q>
                                       			<q class="comm-tags"><span>特价买的</span><em></em></q>
                                       			<q class="comm-tags"><span>皮很薄</span><em></em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(${commentSum})</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(${bestSum})</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(${midSum})</span>
												</div>
											</li>
											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(${badSum})</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>
									<ul class="am-comments-list am-comments-list-flip" id="c10010" style="min-height: 800px;">
									</ul>
									<script type="text/javascript">
										$(function(){
											$.ajax({
												url:"<%=path%>/getProductComment.ajax",
												type:"post",
												dataType:"json",
												timeout:20000,
												data:{
													"type":"1",
													"aab203":'${product.aab203}'
												},
												success:function(res,status){
													if(res.status=='200'){
														var comments=res.comments;
														var n=comments.length;
														var html="";
														for(var i=0;i<n;i++){
															var comment=comments[i];
															html+="<li class='am-comment'>"+
																  "	<a href=''>"+
																  "		<img class='am-comment-avatar' src='<%=path%>/images/hwbn40x40.jpg' />"+
																  "	</a>"+
															 	  "	<div class='am-comment-main'>"+
																  "		<header class='am-comment-hd'>"+
																  "			<div class='am-comment-meta'>"+
																  "				<a href='#link-to-user' class='am-comment-author'>"+comment.aaa103+" (匿名)</a>"+
																  "				评论于"+
																  "				<time datetime=''>"+comment.aab406+"</time>"+
																  "			</div>"+
																  "		</header>"+
																  "		<div class='am-comment-bd'>"+
																  "			<div class='tb-rev-item ' data-id='258040417670'>"+
																  "				<div class='J_TbcRate_ReviewContent tb-tbcr-content '>"+
																  				comment.aab403+
																  "				</div>";
														if(comment.aab412=='01'){
															html+="             <img class='commentImg' alt='"+comment.aab403+"' src='${path}/images/comments/"+comment.aab402+"'>";
														}
														if((typeof comment.aab405)!='undefined'&&comment.aab405.trim()!=''){
															html+="             <div class='J_TbcRate_ReviewContent tb-tbcr-content '>商家回复:&emsp;"+
																				comment.aab405.trim()+
																  "             &emsp;&emsp;回复于<time datetime=''>"+comment.aab408+"</time></div>";
														}
														if((typeof comment.aab404)!='undefined'&&comment.aab404.trim()!=''){
															html+="             <div class='J_TbcRate_ReviewContent tb-tbcr-content '>追加评论:&emsp;"+
																				comment.aab404.trim()+
																  "             &emsp;&emsp;追评于<time datetime=''>"+comment.aab407+"</time></div>";
														}
														   html+="				<div class='tb-r-act-bar'>"+
																  "					物流评分："+comment.aab409+"&nbsp;&nbsp;商品评分："+comment.aab410+"&nbsp;&nbsp;服务评分："+comment.aab411+
																  "				</div>"+
																  "			</div>"+
																  "		</div>"+
																  "	</div>"+
																  "</li>";
														}
														$("#c10010").html(html);
													}
												},
												error:function(res,status){
													console.log("网络异常!");
												}
											});
										});
									</script>
									<div class="clear"></div>
									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<c:if test="${commentSum==0}">
										<li class="am-active"><a href="#">1</a></li>
										</c:if>
										<c:if test="${commentSum!=0}">
											<c:forEach begin="1" end="${(commentSum-1)/15+1}" varStatus="i">
												<c:if test="${i.count==1}">
												<li class="am-active"><a href="#">1</a></li>
												</c:if>
												<c:if test="${i.count!=1}">
												<li><a href="#">${i.count}</a></li>
												</c:if>
											</c:forEach>
										</c:if>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>
									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" style="min-height: 800px;">
											<!-- 动态展示广告 -->
											<c:forEach items="${sameProducts }" var="goods" varStatus="vs">
												<li>
													<div class="i-pic limit">
														<div id="imgsize">
														<!-- 显示图片详细信息 -->
													<a href="<%=path%>/shop/detail.html?aId=${goods.aad302 }&productId=${goods.aab203}">
														<img id="agoods${vs.count}" src="/ego/images/advertise/${goods.aad307}"/>
													</a>
														</div>
														<p class="title fl">${goods.aab202}</p>
														<p class="price fl">
															<b>&yen;</b>
															<strong>${goods.aab205}</strong>
														</p>
														<p class="number fl">库存<span>${goods.aab206}</span>
														</p>
													</div>
												</li>
											</c:forEach>
											
<%-- 											<c:forEach items="${sameProducts }" var="item"> --%>
<!-- 												<li> -->
<!-- 													<div class="i-pic limit"> -->
<%-- 														<img src="<%=path%>${item.path_info }" /> --%>
<%-- 														<p>${item.aab202 } --%>
<!-- 															<span></span></p> -->
<!-- 														<p class="price fl"> -->
<!-- 															<b>&yen;</b> -->
<%-- 															<strong>${item.aab205 }</strong> --%>
<!-- 														</p> -->
<!-- 													</div> -->
<!-- 												</li> -->
<%-- 											</c:forEach> --%>
											
											<!-- 静态广告 -->
											
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<%@include file="/footer.jsp" %>
					</div>

				</div>
			</div>
			<!--菜单 -->
			<%@include file="/rMenu.jsp" %>
	<%--		
	<script src="/ego/layui/layui.js"></script> --%>
	<script>
	layui.use('layer', function(){
		layer = layui.layer;
	});
	var memory;
	$(".coupon-item").hover(function(){
		memory=$(this).html();
		$(this).html("点击领取");
	},function(){
		$(this).html(memory);
	})
	var ifClick=false;
	function getCoupon(couponId){
		if(ifClick==true){
			layer.msg("您今天已经领取过了，请明天再来");
			return ;
		}
		$.getJSON("getCoupon.ajax",{aab501:couponId},function(res){
			if(res.result==true){
				layer.msg("领取成功")
			}else{
				layer.msg("失败,"+res.reason)
			}
		}).fail(function(){
			layer.msg("网络故障");
		})
		ifClick=true;
	}
	
	function addCollection()
	{
		if('${aaa102}' == '')
			return;
		$.ajax({
			url:"${path}/addCollection.ajax",
			type:"post",
			dataType:"json",
			timeout:20000,
			data:{
				"aaa303": '${product.aab203}',
				"aaa302": "01"
			},
			success:function(res,status){
				if(res.tag == 1)
				    layer.msg("收藏成功");
				else
					layer.msg("该商品已被收藏")
			},
			error:function(res,status){
				console.log("收藏失败");
			}
		});
	}
	</script>
	</body>
</html>