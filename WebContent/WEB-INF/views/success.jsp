<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>����ɹ�ҳ��</title>
	<link rel="stylesheet"  type="text/css" href="<%=path%>/AmazeUI-2.4.2/assets/css/amazeui.css"/>
	<link href="<%=path%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
	
	<link href="<%=path%>/css/sustyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=path%>/basic/js/jquery-1.7.min.js"></script>

</head>


<body>

<div class="take-delivery">
 <div class="status">
   <h2>${msg }</h2>
   <div class="successInfo">
     <ul>
       <li>������<em>&yen;${ins.aab316 }</em></li>
       <div class="user-info">
       	 <p>������:${ins.aab302 }</p>
         <p>�ջ���:${ins.aab317 }</p>
         <p>��ϵ�绰:${ins.aab318 }</p>
         <p>�ջ���ַ:${ins.aab311 }</p>
       </div>
             ������˶������ջ���Ϣ�����д�������ϵ�ͷ�
                               
     </ul>
     <div class="option">
       <span class="info">������</span>
        <a href="<%=path%>/showOrder.html" class="J_MakePoint">�鿴<span>���򵽵ı���</span></a>
        <a href="<%=path%>/goOrderDetail.html?aab302=${ins.aab302 }" class="J_MakePoint">�鿴<span>��������</span></a>
     </div>
    </div>
  </div>
</div>

</body>
</html>