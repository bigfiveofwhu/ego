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
	       	提交商品订单
	    </caption>
	    
	    <tr>
	     <td colspan="2">提交商品订单</td>
	   </tr>
	   <!-- 流水号aab301自增获取 -->
	   <!-- 用户号aab102从session中获取 -->
	   <!-- 订单号aab302伪自增,设计获取 -->
	   
	   <tr>
	     <td>商品id</td>
	     <td>
	       <e:text name="aab203" required="true"  /> 
	     </td>
	   </tr>
	   <!-- 订单状态aab303默认为01 -->
	   <!-- 创建时间获取当前 -->
	   
	   <tr>
	     <td>数量</td>
	     <td>
	       <e:number name="aab310" step="1" required="true" /> 
	     </td>
	   </tr>
	   
	    <tr>
	     <td>商品规格</td>
	     <td>
	        <e:select  name="aab209" value="小米1:01,小米2:02,小米3:03,红米:04,小米X:05"
	                   multiple="false" style="width:153px;"
	                    />
	     </td>
	   </tr>
	   
	   <!-- tr>
	     <td>收货地址</td>
	     <td>
	        <e:select  name="aab209" value="地址1:01,小米2:02,小米3:03,红米:04,小米X:05"
	                   multiple="false" style="width:153px;"
	                    />
	     </td>
	   </tr-->
	   
	   <tr>
	     <td>商品单价</td>
	     <td>
	       <e:number name="aab314" step="1" defval="22.50" readonly="true" /> 
	     </td>
	   </tr>
	</table>
<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="提交订单">
	    </td>
	  </tr>
	</table>

</form>
</body>
</html>