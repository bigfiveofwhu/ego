<%@ page language="java" pageEncoding="GBK"%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=DD279b2a90afdf0ae7a3796787a0742e">
</script>
<script type="text/javascript">
var myGeoLocation=null;

function setCookie(name,value)
{
	 var m = 30;
	 var exp = new Date();
	 exp.setTime(exp.getTime() + m*60*1000);
	 document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}


function getCookie(name)
{
	 var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	 if(arr=document.cookie.match(reg))
	 return unescape(arr[2]);
	 else
	 return "";
}
function delCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null)
	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

$(function(){
	if(getCookie("myLocation")==""){
		var myCity = new BMap.LocalCity();
		myCity.get(function(result){
			myGeoLocation = result.name;
			//alert("当前所在城市:"+result.name);
			promptGlobal("当前所在城市:"+result.name);
			setCookie("myLocation",myGeoLocation);
		}); 
	}else{
		myGeoLocation=getCookie("myLocation");
	}
});
</script>