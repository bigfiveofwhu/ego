	function SetIFrameHeight() {
		var iframeid = document.getElementById("iframe"); //iframe id
		if(document.getElementById) {
			iframeid.height = document.documentElement.clientHeight;
		}
	}

	//allowFileManager :是否允许浏览服务器已上传文件
	var callBackPath = 'http://127.0.0.1:8020/Shopping/html/seller/admin/redirect.html'
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			filePostName  : "imgFile",
			resizeType : 1,
			formatUploadUrl:false,
			 uploadJson: 'http://127.0.0.1:9102/Upload/uploadOK.do?callBackPath='+callBackPath,
            allowPreviewEmoticons : false,
            allowImageUpload : true,//允许上传图片
            allowFileManager : true,//允许对上传的图片进行管理
            afterCreate: function () { //是同步KindEditor的值到textarea文本框
                    this.sync();
            },
            afterBlur : function() {//失去焦点后，将图片同步到textarea
                this.sync();
            },
		});
	});
	
