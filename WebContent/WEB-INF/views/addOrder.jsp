<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>


<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	
</script>

</head>
<body>
<form action="<%=path%>/addOrder.html" method="post">
	<table  border="1" align="center" width="45%">
	    <caption>
	       	�ύ��Ʒ����
	    </caption>
	    
	    <tr>
	     <td colspan="2">�ύ��Ʒ����</td>
	   </tr>
	   <!-- ��ˮ��aab301������ȡ -->
	   <!-- �û���aab102��session�л�ȡ -->
	   <!-- ������aab302α����,��ƻ�ȡ -->
	   
	   <tr>
	     <td>��Ʒid</td>
	     <td>
	       <e:text name="aab203" required="true"  /> 
	     </td>
	   </tr>
	   <!-- ����״̬aab303Ĭ��Ϊ01 -->
	   <!-- ����ʱ���ȡ��ǰ -->
	   
	   <tr>
	     <td>����</td>
	     <td>
	       <e:number name="aab310" step="1" required="true" /> 
	     </td>
	   </tr>
	   
	    <tr>
	     <td>��Ʒ���</td>
	     <td>
	        <e:select  name="aab209" value="С��1:01,С��2:02,С��3:03,����:04,С��X:05"
	                   multiple="false" style="width:153px;"
	                    />
	     </td>
	   </tr>
	   
	   <!-- tr>
	     <td>�ջ���ַ</td>
	     <td>
	        <e:select  name="aab209" value="��ַ1:01,С��2:02,С��3:03,����:04,С��X:05"
	                   multiple="false" style="width:153px;"
	                    />
	     </td>
	   </tr-->
	   
	   <tr>
	     <td>��Ʒ����</td>
	     <td>
	       <e:number name="aab314" step="1" defval="22.50" readonly="true" /> 
	     </td>
	   </tr>
	</table>
<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="�ύ����">
	    </td>
	  </tr>
	</table>

</form>
</body>
</html>