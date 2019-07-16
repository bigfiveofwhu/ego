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
    
    <form class="mx-auto w-75 bg-light border p-3" id="form" method="post" enctype="multipart/form-data">
	  
	  <div class="form-group row">
	    <label for="money" class="col-sm-2 col-form-label">ѡ���ƹ�Ʒ</label>
	    <div class="col-sm-10">
	      <select class="custom-select" name="aad306" size="1">
			<c:forEach items="${products}" var="item">
				<option value="${item.aab203 }">${item.aab202 }</option>
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
	          <input class="form-check-input" type="radio" name="aad305" id="serchAhead" value="01">
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
	    <label for="image" class="col-sm-2 col-form-label">���ͼƬ</label>
	    <div class="col-sm-10">
	      <input  id="image"  name="file"  type="file"/>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
<!-- insert your javascripte here-->

<script>
//ע�⣺ѡ� ���� element ģ�飬�����޷����й����Բ���
layui.use('element', function(){
  var element = layui.element;
  //��
});
$("#submit").click(register);

function register(){
        var options = {
            url:'AddAd.ajax',
            type:'POST',
            //beforeSubmit: showRequest, //�ύǰ����ĺ�����Ҳ����������д,ע�⣬������յ�ֻ����false��true���Ҳ����Ǻ������������ŵ�
            dataType:'json', //���ص��������ͣ�null��"xml"��"script"��"json"����֮һ��
            //resetForm: true, ��ʾ������ύ�ɹ��Ƿ��������
            clearForm:false, //��ʾ������ύ�ɹ��Ƿ���������ݡ�
            success:function(msg){ //�ύ���ִ�еĺ���
                if(msg.result==true){
                	alert("�ɹ�");
                }else if(msg.result==false){
                	alert(msg.reason);
                }else{
                	alert("δ֪ԭ��");
                }
                	
            }
        };
        $("#form").ajaxSubmit(options); //ʹ��ajaxForm()����ύ
}

/*
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;

	  //��ק�ϴ�
	  upload.render({
	    elem: '#uploadArea'
	    ,exts:'jpg'
	    ,auto: false
	    ,bindAction:'#submit'
	    ,url: 'AddAd.ajax'
	    ,data:{
	    	aad303:function(){
	    		return $("[name='aad303']:checked").val();
	    	},
	    	aad304:function(){
	    		return $("[name='aad304']").val();
	    	},
	    	aad305:function(){
	    		return $("[name='aad305']:checked").val();
	    	},
	    	aad306:function(){
	    		return $("[name='aad306']").val();
	    	}
	    }
	   	,done: function(res, index, upload){
	    		    //����code=0�����ϴ��ɹ�
	    		    if(res.code == 0){
	    		      //do something �����罫res���ص�ͼƬ���ӱ��浽����������
	    		    }
	    		    console.log("success");
	    		    //��ȡ��ǰ�����ϴ���Ԫ�أ�һ������ elem �� class �������ע�⣺���� layui 2.1.0 ����
	    		    var item = this.item;
	    		    
	    		    //�ļ�����ʧ��
	    		    //do something
	   	}
	   	,error: function(){
	        //�����쳣�ص�
	        console.log("error happend")
	      }
	  });

});*/
</script>

</body>
</html>