<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body>
${msg}
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       员工${empty param.aab101?'添加':'修改' }
       ${empty param.aab101 }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">员工数据</td>
   </tr>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="aab102" required="true" autofocus="true" defval="${ins.aab102 }"/> 
     </td>
   </tr>
   <c:if test="${!empty param.aab101 }">
	   <tr>
	     <td>编号</td>
	     <td>
	       <e:text name="aab103"  readonly="true" defval="${ins.aab103 }"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>生日</td>
     <td>
       <e:date name="aab104"  required="true" defval="${ins.aab104 }"/>
     </td>
   </tr>
   <tr>
     <td>性别</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:radio name="aab105" value="男:1,女:2,不确定:3" defval="${empty param.aab101?'1':ins.aab105 }"/>
     </td>
   </tr>
   <tr>
     <td>民族</td>
     <td>
       <e:select name="aab106" value="汉族:01,满族:02,蒙族:03,藏族:04,哈萨克:05" defval="${ins.aab106 }" />
     </td>
   </tr>
   <tr>
     <td>籍贯</td>
     <td>
        <e:text name="aab107"  required="true" defval="${ins.aab107 }"/> 
     </td>
   </tr>
   <tr>
     <td>手机号码</td>
     <td>
       <e:text name="aab108"  required="true" defval="${ins.aab108 }"/> 
     </td>
   </tr>
   <tr>
     <td>电子邮件</td>
     <td>
       <e:email name="aab109" required="true" defval="${ins.aab109 }"/>
     </td>
   </tr>
   <tr>
     <td>档案工资</td>
     <td>
       <e:number step="0.01" name="aab110" required="true" defval="${ins.aab110 }"/>
     </td>
   </tr>
   <tr>
     <td>技术特长</td>
     <td>
        <e:select  name="aab111" value="oracle:01,MySQL:02,Java核心技术:03,架构设计:04,开源架构:05"
                   multiple="true" style="width:153px;height:120px"
                   defval="${ins.aab111 }"/>
     </td>
   </tr>
   <tr>
     <td>爱好</td>
     <td>
       <e:groupbox name="aab112" value="C:1,C++:2,C++--:3,C#:4,Java:5,Python:6"
                   newLineNumber="4" defval="${ins.aab112 }"/>
     </td>
   </tr>
   <tr>
     <td>备注</td>
     <td>
       <e:textarea rows="5" cols="45" name="aab113" defval="${ins.aab113 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'添加':'修改' }"
              formaction="<%=path%>/${empty param.aab101?'add':'modify' }Emp.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryEmp.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aab101" value="${param.aab101 }">
<e:hidden name="qaab102"/>
<e:hidden name="qaab103"/>
<e:hidden name="qaab105"/>
<e:hidden name="qaab106"/>
<e:hidden name="baab104"/>
<e:hidden name="eaab104"/>
</form>
</body>
</html>