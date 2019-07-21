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

   	  	<div class="jumbotron">
   	  	  <p class="lead">余额</p>
		  <h1 class="display-4">￥${aad403}</h1>
		  
		  <hr class="my-4">
		  <button class="btn btn-primary btn-lg" id="charge" type="button">账户充值</button>
		</div>
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
				<a href="/ego/advertise/showAdInfo.html?aad302=${item.aad302}">${item.refName }</a>
			  </td>
			  <td>
			  	${item.adType }
			  </td>
			  <td>
			  	${item.aad304 }
			  </td>
			   <td class="p-1">
			  	<button type="button" value="${item.aad302 }" class="btn btn-info btn-sm " tag="modify">投资</button>
				<button type="button" value="${item.aad302 }" class="btn btn-light btn-sm " tag="retract">撤回</button>
			  </td>
			</tr>
		  </c:forEach>
  		</tbody>
	   </table>

    </div>
    <%----------------------------	---------------------------------------%>
    <%-- 添加广告 --%>
    <div class="layui-tab-item" id="addAd">
    
    <form class="mx-auto w-75 bg-light border p-3" id="form" method="post" enctype="multipart/form-data">
	  <%--传递店铺id --%>
	  <input type="hidden" name="aab102" value="${shop.aab102 }">
	  
	  <div class="form-group row" id="chooseProduct">
	    <label for="money" class="col-sm-2 col-form-label">选择推广品</label>
	    <div class="col-sm-10">
	      <select class="custom-select" name="aad306" size="1">
			<c:forEach items="${products}" var="item">
				<option value="${item.aab203 }">${item.aab202 }</option>
			</c:forEach>	 
				<option value="${shop.aab102 }"  id="shopItem" hidden>${shop.aab103 }</option> 	
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
	          <input class="form-check-input" type="radio" name="aad305" id="serchAhead" value="01">
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
	    <label for="image" class="col-sm-2 col-form-label">广告图片</label>
	    <div class="col-sm-10">
	      <input  id="image"  name="file"  type="file"/>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
<!-- insert your javascripte here-->

<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  //…
});

layui.use('layer',function(){
	 var $ = layui.jquery, layer = layui.layer;
	 
	 //例子1
	$('#charge').click(function(){
		layer.prompt({
			  title: '请输入金额',
			  area: ['800px', '350px'] //自定义文本域宽高
			}, function(value, index, elem){
			  $.getJSON('chargeAccount.ajax',{'increment':value},function(data){
				  if(data.result==true){
					  layer.msg('充值成功');
					  window.location.reload();
				  }else{
					  layer.msg('充值失败');
				  }
			  }).fail(function() {
				  layer.msg('充值失败');
			  })
			  layer.close(index);
		});
	})
	 
})
$("#submit").click(register);
$("input:radio[name='aad303']").change(function (){ //拨通
	switch($(this).val()){
		case '00'://产品
			$("[name='aad306']").attr("disabled",false);	
			$('#shopItem').attr("selected",false);
			break;
		case '01'://店铺
			//$("#shop").show();
			//$("#chooseProduct").hide();
			$('#shopItem').attr("selected",true);
			$("[name='aad306']").attr("disabled",true);
			break;
		case '10'://服务
			alert("暂不支持服务");
			break;
	};
});

function register(){
        var options = {
            url:'AddAd.ajax',
            type:'POST',
            //beforeSubmit: showRequest, //提交前处理的函数，也可以在这里写,注意，这里接收的只能是false和true，且不能是函数的名带括号的
            dataType:'json', //返回的数据类型：null、"xml"、"script"、"json"其中之一。
            //resetForm: true, 表示如果表单提交成功是否进行重置
            clearForm:false, //表示如果表单提交成功是否清除表单数据。
            success:function(msg){ //提交完后执行的函数
                if(msg.result==true){
                	layer.msg("添加成功");
                	location.reload();
                }else if(msg.result==false){
                	layer.msg("添加失败,"+msg.reason);
                }else{
                	layer.msg("网络故障");
                }
            },
            error:function(){
            	layer.msg("网络故障");
            }
        };
        $("#form").ajaxSubmit(options); //使用ajaxForm()插件提交
}

$("[tag='modify']").click(function(){
	var a=$(this);
	layer.prompt({
		  title: '请输入金额',
		  area: ['800px', '350px'] //自定义文本域宽高
		}, function(value, index, elem){
		  $.getJSON('chargeAd.ajax',{'increment':value,'aad302':a.val()},function(data){
			  if(data.result==true){
				  layer.msg('投资成功');
				  window.location.reload();
			  }else{
				  layer.msg(data.reason);
			  }
		  }).fail(function() {
			  layer.msg('服务端错误');
		  })
		  layer.close(index);
	});
})
$("[tag='retract']").click(function(){
	var a=$(this);
	$.getJSON('retractAd.ajax',{'aad302':a.val()},function(data){
		  if(data.result==true){
			  layer.msg('撤回成功');
			  window.location.reload();
		  }else{
			  layer.msg('撤回失败');
		  }
	  }).fail(function() {
		  layer.msg('撤回失败');
	  })
})

</script>

</body>
</html>