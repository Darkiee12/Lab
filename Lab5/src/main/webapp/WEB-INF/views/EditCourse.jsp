<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Page</title>
</head>
<body>
<h2>Update data into table Course</h2>
<%
    String oldCourseID = request.getParameter("CourseID");
    String oldName = request.getParameter("CourseName");
%>
<form method="post" action="EditCourse">
    <table>
        <tr>
            <td>Course's ID</td>
            <td><input type="text" name="CourseID" value="<%=oldCourseID%>"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="CourseName" value="<%=oldName%>"></td>
        </tr>
        <tr>
            <td><input type="submit" name="Update" value="Update"></td>
            <td><input type="reset" value="Cancel"></td>
        </tr>
    </table>
</form>
<%
    if (request.getParameter("Update") != null) {
        String newCourseID = request.getParameter("CourseID");
        String newName = request.getParameter("CourseName");
        // connect to database and update data
        try {
            Connection con = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
            String dbuser = "root";
            String dbpassword = "my-secret-pw";

            con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
            Statement st = con.createStatement();
            // change the name of the course
            String sql = "UPDATE course SET CourseName = '" + newName + "' WHERE CourseID = '" + oldCourseID + "'";
            st.executeUpdate(sql);
            response.sendRedirect("CourseList.jsp");
        } catch (Exception e) {
            out.println(e);
        }

    }
%>
</body>
</html>
