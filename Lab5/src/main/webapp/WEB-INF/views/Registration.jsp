<%-- 
    Document   : Registration
    Created on : May 10, 2024,
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View - Input - Delete - Modify</title>
</head>
<body>
<h1 style="color:blue;">Testing View and Input Data into MySQL</h1>
<hr>

<h2 style="color:red;">Insert data into MySQL database</h2>
<p>Link:
    <a href="CourseList.jsp">Course List</a>|
    <a href="StudentList.jsp">Student List</a>|
    <a href="Registration.jsp">Registration</a>
</p>

<form action="Registration" method="post">
    <table>
        <tr>
            <td>Student</td>
            <td>
                <select name="studentId">
                    <%-- Populate student dropdown dynamically from the database --%>
                    <%
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                            String dbuser = "root";
                            String dbpassword = "my-secret-pw";
                            con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

                            String studentQuery = "SELECT studentId, studentName FROM student";
                            stmt = con.createStatement();
                            rs = stmt.executeQuery(studentQuery);

                            while (rs.next()) {
                                String studentId = rs.getString("studentId");
                                String studentName = rs.getString("studentName");
                    %>
                    <option value="<%= studentId %>"><%= studentName %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
                            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
                            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Course</td>
            <td>
                <select name="courseId">
                    <%-- Populate course dropdown dynamically from the database --%>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                            String dbuser = "root";
                            String dbpassword = "my-secret-pw";
                            con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

                            String courseQuery = "SELECT courseId, courseName FROM course";
                            stmt = con.createStatement();
                            rs = stmt.executeQuery(courseQuery);

                            while (rs.next()) {
                                String courseId = rs.getString("courseId");
                                String courseName = rs.getString("courseName");
                    %>
                    <option value="<%= courseId %>"><%= courseName %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
                            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
                            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Add" name="action"/></td>
        </tr>
    </table>
</form>

<%-- Process form submission to insert new record --%>
<%
    String action = request.getParameter("action");
    if ("Add".equals(action)) {
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        if (studentId != null && !studentId.isEmpty() && courseId != null && !courseId.isEmpty()) {
//            Connection con = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                String dbuser = "root";
                String dbpassword = "my-secret-pw";
                con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

                String insertQuery = "INSERT INTO studentcourse (studentID, courseID) VALUES (?, ?)";
                pstmt = con.prepareStatement(insertQuery);
                pstmt.setString(1, studentId);
                pstmt.setString(2, courseId);
                pstmt.executeUpdate();

                // Redirect to avoid form resubmission on refresh
                response.sendRedirect(request.getRequestURI());
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { /* ignored */ }
                try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
            }
        }
    }
%>

<hr>
<h2 style="color:green;">View data from MySQL database</h2>

<table border="1">
    <tr>
        <th>Student Name</th>
        <th>Course</th>
        <th>Delete</th>
    </tr>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
            String dbuser = "root";
            String dbpassword = "my-secret-pw";
            con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);

            String sql = "SELECT s.studentName, c.CourseName FROM student s JOIN studentcourse cs ON s.studentId = cs.studentId JOIN course c ON cs.courseId = c.courseId";
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String studentName = rs.getString("studentName");
                String courseName = rs.getString("courseName");
    %>

    <tr>
        <td><%= studentName %></td>
        <td><%= courseName %></td>
        <td><a href="Registration.jsp?action=delete&studentName=<%= studentName %>&courseName=<%= courseName %>">Delete</a></td>
    </tr>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
            try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
        }
    %>
</table>
</body>
</html>
