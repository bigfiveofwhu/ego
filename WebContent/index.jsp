<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
request url <%=request.getRequestURL()%><br>
getRequestURI <%=request.getRequestURI()%><br>
servlet path <%=request.getServletPath()%><br>
pathinfo <%=request.getPathInfo() %><br>
query string <%=request.getQueryString() %> <br>
<a href="../test.jsp">click</a>
</body>
</html>