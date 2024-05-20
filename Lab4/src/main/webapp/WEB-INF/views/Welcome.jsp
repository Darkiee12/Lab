<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Page</title>
</head>
<body>

<%
    String name = request.getParameter("username");
    if (name != null && !name.isEmpty()) {
%>
    <h1>Hello, <%= name %></h1>
<%
    } else {
%>
    <h1>Hello, Stranger</h1>
<%
    }
%>

</body>
</html>
