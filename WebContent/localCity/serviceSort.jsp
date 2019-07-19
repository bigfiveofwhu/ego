<%@ page language="java" pageEncoding="GBK"%>
<div class="service">
	<a href="" sort-id="01">
		<i class="am-icon-home service-icon"></i>
		<p class="service-title">��������</p>
		<p class="service-en" >Home service</p>
	</a>
</div>

<div class="service">
	<a href="" sort-id="02">
		<i class="am-icon-wrench service-icon"></i>
		<p class="service-title">װ�޽���</p>
		<p class="service-en">Installation</p>
	</a>
</div>

<div class="service">
	<a href="" sort-id="03">
		<i class="am-icon-group service-icon"></i>
		<p class="service-title">�������</p>
		<p class="service-en">Business</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="04">
		<i class="am-icon-user service-icon"></i>
		<p class="service-title">���̼���</p>
		<p class="service-en">Investment</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="05">
		<i class="am-icon-camera-retro service-icon"></i>
		<p class="service-title">������Ӱ</p>
		<p class="service-en">Photograph</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="06">
		<i class="am-icon-futbol-o service-icon"></i>
		<p class="service-title">��������</p>
		<p class="service-en">Entertainment</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="07">
		<i class="am-icon-plane service-icon"></i>
		<p class="service-title">���ξƵ�</p>
		<p class="service-en">Grogshop</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="08">
		<i class="am-icon-cutlery service-icon"></i>
		<p class="service-title">������ʳ</p>
		<p class="service-en">Cate service</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="09">
		<i class="am-icon-cogs service-icon"></i>
		<p class="service-title">��֤����</p>
		<p class="service-en">Credential</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="10">
		<i class="am-icon-life-ring service-icon"></i>
		<p class="service-title">��������</p>
		<p class="service-en">Live service</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="11">
		<i class="am-icon-location-arrow service-icon"></i>
		<p class="service-title">��ְ����</p>
		<p class="service-en">Job-hunting</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="12">
		<i class="am-icon-paw service-icon"></i>
		<p class="service-title">&emsp;��ְ&emsp;</p>
		<p class="service-en">Part-time job</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="13">
		<i class="am-icon-suitcase service-icon"></i>
		<p class="service-title">�����г�</p>
		<p class="service-en">Sec-hand market</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="14">
		<i class="am-icon-truck service-icon"></i>
		<p class="service-title">���ֻ���</p>
		<p class="service-en">Recycle</p>
	</a>
</div>
<div class="service">
	<a href="" sort-id="15">
		<i class="am-icon-star service-icon"></i>
		<p class="service-title">������ѵ</p>
		<p class="service-en">Education</p>
	</a>
</div>
<form action="${path }/localCity/search.html" method="post" id="formSubmit">
<input type="hidden" id="typeSubmit" name="type" value="" />
<input type="hidden" id="locationSubmit" name="location" value="" />
</form>
<script>
	$(".service>a").removeAttr("href");
	$(".service>a").click(function(){
		var type1=$(this).attr("sort-id");
		console.log("��������"+type1);
		$("#typeSubmit").attr("value",type1);
		$("#locationSubmit").attr("value",myGeoLocation);
		$("#formSubmit").submit();
	});
</script>