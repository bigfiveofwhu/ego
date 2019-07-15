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
    <li class="layui-this">������Ϣ</li>
    <li>���</li>
    <li>��ӹ��</li>
  </ul>
  <div class="layui-tab-content">
    <%-- ������Ϣ --%>
    <div class="layui-tab-item layui-show">
    	�˻���� ${aad403 }Ԫ
    </div>
    
    <%-- �����Ϣ --%>
    <div class="layui-tab-item">

    	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">��Ʒ����</th>
		      <th scope="col">�������</th>
		      <th scope="col">Ͷ�����</th>
		      <th scope="col">����</th>
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
			  	���飬����
			  </td>
			</tr>
		  </c:forEach>
		  
  		</tbody>
	   </table>

    </div>
    
    <%-- ��ӹ�� --%>
    <div class="layui-tab-item" id="addAd">
    
    <form class="mx-auto w-75 bg-light border p-3" method="post">
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">ѡ���ƹ�Ʒ</label>
	    <div class="col-sm-10">
	      <select class="custom-select" name="aad306" size="1">
			<c:forEach items="${products}" var="item">
				<option value=${item.aab203 }>${item.aab202 }</option>
			</c:forEach>	  	
		</select>
	    </div>
	  </div>
	  
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">Ͷ�Ž��</label>
	    <div class="col-sm-10">
	      <input  class="form-control" id="money" name="aad304" placeholder="����������Ͷ�Ž��">
	    </div>
	  </div>
	  
	  <fieldset class="form-group">
	    <div class="row">
	      <legend class="col-form-label col-sm-2 pt-0">��ϣ���ƹ����</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios1" value="00" checked>
	          <label class="form-check-label" for="gridRadios1">
	         	  ��Ʒ	
	          </label>
	        </div>
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios2" value="01">
	          <label class="form-check-label" for="gridRadios2">
	           	 ����
	          </label>
	        </div>
	        <div class="form-check disabled">
	          <input class="form-check-input" type="radio" name="aad303" id="gridRadios3" value="10" >
	          <label class="form-check-label" for="gridRadios3">
	           	����
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
	 
	 <fieldset class="form-group">
	    <div class="row">
	      <legend class="col-form-label col-sm-2 pt-0">�������</legend>
	      <div class="col-sm-10">
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad305" id="headline" value="00" checked>
	          <label class="form-check-label" for="headline">
	         	  ��ҳ�޷�
	          </label>
	        </div>
	        
	        <div class="form-check">
	          <input class="form-check-input" type="radio" name="aad305" id="serchAhead" value=01>
	          <label class="form-check-label" for="serchAhead">
	           	������ǰ
	          </label>
	        </div>
	        
	        <div class="form-check ">
	          <input class="form-check-input" type="radio" name="aad305" id="targetAd" value="10" >
	          <label class="form-check-label" for="targetAd">
	           	�����ƽ�
	          </label>
	        </div>
	         <div class="form-check ">
	          <input class="form-check-input" type="radio" name="aad305" id="hot" value="11" >
	          <label class="form-check-label" for="hot">
	           	������Ʒ
	          </label>
	        </div>
	      </div>
	    </div>
	  </fieldset>
	 
	 <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">չʾͼƬ</label>
	    <div class="col-sm-10">
	      <div class="layui-upload-drag" id="uploadArea">
		  <i class="layui-icon">�v</i>
		  <p>����ϴ������ļ���ק���˴�</p>
		  </div>  
	    </div>
	  </div>
	 
	 
	 
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="button"  id="submit" class="btn btn-primary">�ύ</button>
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
//ע�⣺ѡ� ���� element ģ�飬�����޷����й����Բ���
layui.use('element', function(){
  var element = layui.element;
  //��
});
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;

	  //��ק�ϴ�
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
	    		    //����code=0�����ϴ��ɹ�
	    		    if(res.code == 0){
	    		      //do something �����罫res���ص�ͼƬ���ӱ��浽����������
	    		    }
	    		    
	    		    //��ȡ��ǰ�����ϴ���Ԫ�أ�һ������ elem �� class �������ע�⣺���� layui 2.1.0 ����
	    		    var item = this.item;
	    		    
	    		    //�ļ�����ʧ��
	    		    //do something
	    		  }
	  });
});
</script>

</body>
</html>