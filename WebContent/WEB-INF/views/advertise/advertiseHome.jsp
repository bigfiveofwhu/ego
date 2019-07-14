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
    <div class="layui-tab-item">
    	
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
</script>

</body>
</html>