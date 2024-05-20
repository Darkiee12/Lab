<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

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
        String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
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
//        delete student base on the given id
        String studentID = request.getParameter("StudentID");
        String sql = "DELETE FROM student WHERE StudentID = " + studentID;
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        if query successful, redirect to course list page
        response.sendRedirect("StudentList.jsp");
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