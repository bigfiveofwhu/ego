/**
 * 位置定位
 */
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

$(function(){
	if(getCookie("myLocation")==""){
		var myCity = new BMap.LocalCity();
		myCity.get(function(result){
			myGeoLocation = result.name;
			alert("当前所在城市:"+result.name);
			setCookie("myLocation",myGeoLocation);
		}); 
	}else{
		myGeoLocation=getCookie("myLocation");
	}
});
