<%@ page language="java" pageEncoding="GBK"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
${msg }
${ins.aab302 }
<%=session.getAttribute("aab302") %>
<%session.setAttribute("test2", "测试单元2"); %>
<a id="jumptest" href="#" onclick="window.location.href='addOrder.jsp'">直接跳转到下单页</a>
</body>
</html>