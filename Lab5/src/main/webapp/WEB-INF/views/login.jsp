<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
</head>
<body>
<h2>Login Form</h2>
<form method="post" action="login">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" required><br><br>
  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required><br><br>
  <input type="submit" name="Login" value="Login">
</form>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
  if (request.getParameter("Login") != null) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5"; // autoReconnect=true&useSSL=false
      String dbuser = "root";
      String dbpassword = "my-secret-pw";

      con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

      ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
      ps.setString(1, username);
      ps.setString(2, password);

      rs = ps.executeQuery();

      if (rs.next()) {
        out.print("Connect success!");
        response.sendRedirect("CourseList");
      } else {
        // Invalid credentials, show error message
        out.print("Invalid username or password.");
      }
    } catch (ClassNotFoundException | SQLException e) {
      throw new RuntimeException(e);
    } finally {
      // Close resources in finally block
      try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
    }
  }
%>

</body>
</html>