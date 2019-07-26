<%@ page language="java" pageEncoding="GBK"%>
<script type="text/javascript">
	function autoRefresh(){
		var imgs=$("img");
		var n=imgs.length;
		for(var i=0;i<n;i++){
			var img=$(imgs[i]);
			img.attr("src",img.attr("src")+"?"+new Date().getTime());
		}
	}
</script>