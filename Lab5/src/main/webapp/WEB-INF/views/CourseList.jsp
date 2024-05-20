<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View - Input - Delete - Modify</title>
</head>
<body>
<h1><span style="color: Blue; ">Testing View and Input Data into MySQL</span></h1>
<hr>
<h2><span style="color: Red; ">Insert data into MySQL database</span></h2>
<p>Links:
    <a href="CourseList">Course List</a>|
    <a href="StudentList">Student List</a>|
    <a href="Registration">Registration</a>
<form method="post" action="CourseList">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="CourseID"/></td>
        </tr>
        <tr>
            <td>Course Name</td>
            <td><input type="text" name="CourseName"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="Submit" value="Add" name="Add"/></td>
        </tr>
    </table>
</form>
<%
    // Database operations
    if (request.getParameter("Add") != null) {
        String ID = request.getParameter("CourseID");
        String Name = request.getParameter("CourseName");
        if (ID == null || ID.trim().isEmpty() || Name == null || Name.trim().isEmpty()) {
            out.print("<font color=\"red\">Both Course ID and Course Name are required.</font>");
        } else {
            try {
                Connection con = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                String dbuser = "root";
                String dbpassword = "my-secret-pw";

                con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
                PreparedStatement ps = con.prepareStatement("INSERT INTO course (CourseID, CourseName) VALUES (?, ?)");
                ps.setString(1, ID);
                ps.setString(2, Name);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.print("<font color=\"green\">Course added successfully.</font>");
                } else {
                    out.print("<font color=\"red\">Failed to add course.</font>");
                }
                ps.close();
                con.close();
            } catch (SQLException e) {
                out.print("<font color=\"red\">An error occurred while adding the course.</font>");
                e.printStackTrace();
            }
        }
    }
%>
<hr>
<h2><font color="Green">View data from MySQL database</font></h2>
<%
    try {
        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
        String dbuser = "root";
        String dbpassword = "my-secret-pw";

        con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM course");
%>
<table border="1" width="50%">
    <tr>
        <td width="15%">Course ID</td>
        <td width="25%">Course Name</td>
        <td width="10%">Delete</td>
        <td width="10%">Update</td>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td width="15%"><%=rs.getString("CourseID")%></td>
        <td width="25%"><%=rs.getString("CourseName")%></td>
        <td><a href="DeleteCourse.jsp?CourseID=<%=rs.getString("CourseID")%>">Delete</a></td>
        <td><a href="EditCourse.jsp?CourseID=<%=rs.getString("CourseID")%>&CourseName=<%=rs.getString("CourseName")%>">Update</a></td>
    </tr>
    <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            out.print("<font color=\"red\">An error occurred while retrieving courses.</font>");
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
