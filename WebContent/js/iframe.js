	function SetIFrameHeight() {
		var iframeid = document.getElementById("iframe"); //iframe id
		if(document.getElementById) {
			iframeid.height = document.documentElement.clientHeight;
			//iframeid.width = document.documentElement.clientWidth*0.8;
		}
	}