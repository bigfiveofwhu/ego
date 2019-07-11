app.service("UploadService", function($http) {
	this.uploadFile = function() {
		var formData = new FormData();
		formData.append("file", file.files[0]);
		return $http({
			method: 'POST',
			url: base + "/Upload/upload.do",
			withCredentials: true,
			data: formData,
			headers: { 'Content-Type': undefined }, //Content-Type 设置为 multipart/form-data.
			transformRequest: angular.identity, //序列化formdata object.
		});
	}
});