<%@ page language="java" pageEncoding="GBK"%>
<script type="text/javascript">
	$(function(){
		setInterval(()=>{
			var imgs=$("img");
			var n=imgs.length;
			console.log(new Date().getTime()+" , "+n);
			for(var i=0;i<n;i++){
				var img=$(imgs[i]);
				img.attr("src",img.attr("src")+"?"+new Date().getTime());
			}
		},500);
	});
</script>