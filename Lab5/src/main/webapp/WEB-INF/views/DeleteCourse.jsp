        <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: khoi
  Date: 5/10/24
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    receive CourseID from parameter and connect to database and delete the course base on the given id--%>
<%
    Connection con = null;
    try {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5";
        String dbuser = "root";
        String dbpassword = "my-secret-pw";

        try {
            con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Statement stmt = null;
        try {
            stmt = con.createStatement();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        delete course base on the given id
        String courseID = request.getParameter("CourseID");
        String StudentName = request.getParameter("StudentName");
        //       delete student from studentcourse table base on student name and course id
        String sql = "DELETE FROM studentcourse WHERE CourseID = " + courseID + "AND" + StudentName + "=StudentName";
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        if query successful, redirect to course list page
        response.sendRedirect("CourseList");
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
%>
</body>
</html>