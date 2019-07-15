<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/ego/css/bootstrap.css">
<link rel="stylesheet" href="/ego/layui/css/layui.css">
<meta charset="GBK">
<title></title>
</head>
<body>
<!-- insert your code-->
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">基本信息</li>
    <li>广告</li>
    <li>添加广告</li>
  </ul>
  <div class="layui-tab-content">
    <%-- 基本信息 --%>
    <div class="layui-tab-item layui-show">
    	账户余额 ${aad403 }元
    </div>
    
    <%-- 广告信息 --%>
    <div class="layui-tab-item">

    	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">产品名称</th>
		      <th scope="col">广告类型</th>
		      <th scope="col">投放余额</th>
		      <th scope="col">操作</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <c:forEach  items="${ads}" var="item">
			<tr>
			  <td>
				${item.refName }
			  </td>
			  <td>
			  	${item.adType }
			  </td>
			  <td>
			  	${item.aad304 }
			  </td>
			  <td>
			  	详情，撤销
			  </td>
			</tr>
		  </c:forEach>
		  
  		</tbody>
	   </table>

    </div>
    
    <%-- 添加广告 --%>
    <div class="layui-tab-item" id="addAd">
    
    <form class="mx-auto w-75 bg-light border p-3" method="post">
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">选择推广品</label>
	    <div class="col-sm-10">
	      <select class="custom-select" name="aad306" size="1">
			<c:forEach items="${products}" var="item">
				<option value=${item.aab203 }>${item.aab202 }</option>
			</c:forEach>	  	
		</select>
	    </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">投放金额</label>
	    <div class="col-sm-10">
	      <input  class="form-control" id="money" name="aad304" placeholder="请输入您的投放金额">
	    </div>
	  </div>
	  
	  <fieldset class="form-group">
	    <div class="row">
	      <legend class="col-form-label col-sm-2 pt-0">您希望推广的是</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios1" value="00" checked>
	          <label class="form-check-label" for="gridRadios1">
	         	  商品	
	          </label>
	        </div>
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios2" value="01">
	          <label class="form-check-label" for="gridRadios2">
	           	 店铺
	          </label>
	        </div>
	        <div class="form-check disabled">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios3" value="10" >
	          <label class="form-check-label" for="gridRadios3">
	           	服务
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
	 
	 <fieldset class="form-group">
	    <div class="row">
	      <legend class="col-form-label col-sm-2 pt-0">广告类型</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad305" id="headline" value="00" checked>
	          <label class="form-check-label" for="headline">
	         	  首页巨幅
	          </label>
	        </div>
	        
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad305" id="serchAhead" value=01>
	          <label class="form-check-label" for="serchAhead">
	           	搜索靠前
	          </label>
	        </div>
	        
	        <div class="form-check ">
	          <input class="form-check-input" type="radio" name="aad305" id="targetAd" value="10" >
	          <label class="form-check-label" for="targetAd">
	           	定向推介
	          </label>
	        </div>
	         <div class="form-check ">
	          <input class="form-check-input" type="radio" name="aad305" id="hot" value="11" >
	          <label class="form-check-label" for="hot">
	           	热门商品
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
	 
	 <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">展示图片</label>
	    <div class="col-sm-10">
	      <div class="layui-upload-drag" id="uploadArea">
		  <i class="layui-icon"></i>
		  <p>点击上传，或将文件拖拽到此处</p>
		  </div>  
	    </div>
	  </div>
	 
	 
	 
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="button"  id="submit" class="btn btn-primary">提交</button>
	    </div>
	  </div>
	  
	</form>
    </div>
  </div>
</div>

<script src="/ego/js/jquery-3.2.0.min.js" ></script>
<script src="/ego/js/bootstrap.bundle.js"></script>
<script src="/ego/layui/layui.js"></script>

<!-- insert your javascripte here-->
<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  //…
});
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;

	  //拖拽上传
	  upload.render({
	    elem: '#uploadArea'
	    ,auto: false
	    ,bindAction:'#submit'
	    ,data:{
	    	"aad303":$("[name='aad303']").attr("value"),
	    	"aad304":$("[name='aad304']").attr("value"),
	    	"aad305":$("[name='aad305']").attr("value"),
	    	"aad306":$("[name='aad306']").attr("value"),
	    }
	    ,url: 'AddAd.ajax'
	   	,done: function(res, index, upload){
	    		    //假设code=0代表上传成功
	    		    if(res.code == 0){
	    		      //do something （比如将res返回的图片链接保存到表单的隐藏域）
	    		    }
	    		    
	    		    //获取当前触发上传的元素，一般用于 elem 绑定 class 的情况，注意：此乃 layui 2.1.0 新增
	    		    var item = this.item;
	    		    
	    		    //文件保存失败
	    		    //do something
	    		  }
	  });
});
</script>

</body>
</html>