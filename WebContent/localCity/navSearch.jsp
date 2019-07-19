<%@ page language="java" pageEncoding="GBK"%>
<div class="nav white">
	<div class="logo">
		<img style="display:none;" src="${path}/images/logo.png" />
	</div>
	<div class="logoBig">
		<li>
		<img src="${path}/images/logobig.png" />
		</li>
	</div>
	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form action="${path}/localCity/search.html" method="post">
			<input id="localInput" name="location" value="" type="hidden" />
			<input id="searchInput" name="key" type="text" value="${key }" placeholder="ËÑË÷·þÎñ" required="required" autocomplete="on"> 
			<input id="ai-topsearch" class="submit am-btn" value="ËÑË÷" index="1" type="submit">
		</form>
	</div>
</div>
<script>
 $(function(){
	 function location1(){
		 if(myGeoLocation!=null){
			 $("#myLocal").text(myGeoLocation);
			 $("#localInput").attr("value",myGeoLocation);
		 }else{
			 setTimeout(location1,500);
		 }
	 }
	 location1();
 });
</script>