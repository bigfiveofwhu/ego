<%@ page language="java" pageEncoding="GBK"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
${msg }
${ins.aab302 }
<%=session.getAttribute("aab302") %>
<%session.setAttribute("test2", "���Ե�Ԫ2"); %>
<a id="jumptest" href="#" onclick="window.location.href='addOrder.jsp'">ֱ����ת���µ�ҳ</a>
</body>
</html>