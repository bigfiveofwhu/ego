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
    <div class="layui-tab-item">
    	
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
</script>

</body>
</html>