<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View - Input - Delete - Modify</title>
</head>
<body>
<h1><font color="Blue">Testing View and Input Data into MySQL</font></h1>
<hr>
<h2><font color="Red">Insert data into MySQL database</font></h2>
<p>Links:
    <a href="CourseList">Course List</a>|
    <a href="StudentList">Student List</a>|
    <a href="Registration">Registration</a>
<form method="post" action="StudentList">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="StudentID"/></td>
        </tr>
        <tr>
            <td>Student Name</td>
            <td><input type="text" name="StudentName"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="Submit" value="Add" name="Add"/></td>
        </tr>
    </table>
</form>
<%
    if (request.getParameter("Add") != null) {
        String ID = request.getParameter("StudentID");
        String Name = request.getParameter("StudentName");
        if (ID == null || ID.trim().isEmpty() || Name == null || Name.trim().isEmpty()) {
            out.print("<font color=\"red\">Both Student ID and Student Name are required.</font>");
        } else {
            try {
                Connection con = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                String dbuser = "root";
                String dbpassword = "my-secret-pw";

                con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
                PreparedStatement ps = con.prepareStatement("INSERT INTO student (StudentID, StudentName) VALUES (?, ?)");
                ps.setString(1, ID);
                ps.setString(2, Name);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.print("<font color=\"green\">Student added successfully.</font>");
                } else {
                    out.print("<font color=\"red\">Failed to add student.</font>");
                }
                ps.close();
                con.close();
            } catch (SQLException e) {
                out.print("<font color=\"red\">An error occurred while adding the student.</font>");
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                out.print("<font color=\"red\">Database driver not found.</font>");
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
        ResultSet rs = stmt.executeQuery("SELECT * FROM student");
%>
<table border="1" width="50%">
    <tr>
        <td width="15%">Student ID</td>
        <td width="25%">Student Name</td>
        <td width="10%">Delete</td>
        <td width="10%">Update</td>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td width="15%"><%=rs.getString("StudentID")%></td>
        <td width="25%"><%=rs.getString("StudentName")%></td>
        <td><a href="DeleteStudent?StudentID=<%=rs.getString("StudentID")%>">Delete</a></td>
        <td><a href="EditStudent?StudentID=<%=rs.getString("StudentID")%>&StudentName=<%=rs.getString("StudentName")%>">Update</a></td>
    </tr>
    <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            out.print("<font color=\"red\">An error occurred while retrieving students.</font>");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            out.print("<font color=\"red\">Database driver not found.</font>");
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
