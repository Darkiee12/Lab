<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cookie Result</title>
</head>
<body>
    <h1>Cookie Result</h1>
    <ul>
        <% 
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
        %>
        <li><b>Name:</b> <%= cookie.getName() %>, <b>Value:</b> <%= cookie.getValue() %></li>
        <% 
                }
            } else {
        %>
        <li>No cookies found.</li>
        <% } %>
    </ul>
</body>
</html>
