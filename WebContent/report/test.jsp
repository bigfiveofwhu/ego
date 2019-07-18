<%@ page pageEncoding="GBK" %>
<%String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="myform" action="<%=path%>/report/userReport.html" method="post">

    <input type="submit" name="next" value="²éÑ¯">
    <input type="submit" name="next" value="Ìí¼Ó"
           formaction="<%=path%>/addEmp.jsp">
    <input type="submit" id="del" name="next" value="É¾³ý"
           formaction="<%=path%>/delEmp.html" disabled="disabled">
</form>

</body>
</html>
