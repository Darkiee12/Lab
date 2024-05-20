<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Student</title>
</head>
<body>
<h1>Edit Student</h1>
<form method="post" action="EditStudent.jsp">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="StudentID" value="<%= request.getParameter("StudentID") %>"/></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="StudentName" value="<%= request.getParameter("StudentName") %>"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="Submit" value="Update" name="Update"/></td>
        </tr>
    </table>
</form>
<%
    if (request.getParameter("Update") != null) {
        String ID = request.getParameter("StudentID");
        String Name = request.getParameter("StudentName");
        if (ID == null || ID.trim().isEmpty() || Name == null || Name.trim().isEmpty()) {
            out.print("<font color=\"red\">Both Student ID and Name are required.</font>");
        } else {
            try {
                Connection con = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String jdbcUrl = "jdbc:mysql://localhost:3306/weblab5?autoReconnect=true&useSSL=false";
                String dbuser = "root";
                String dbpassword = "my-secret-pw";

                con = DriverManager.getConnection(jdbcUrl, dbuser, dbpassword);
                PreparedStatement ps = con.prepareStatement("UPDATE student SET StudentName = ? WHERE StudentID = ?");
                ps.setString(1, Name);
                ps.setString(2, ID);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.print("<font color=\"green\">Student updated successfully.</font>");
                } else {
                    out.print("<font color=\"red\">Failed to update student.</font>");
                }
                ps.close();
                con.close();
                response.sendRedirect("StudentList.jsp");
            } catch (SQLException | ClassNotFoundException e) {
                out.print("<font color=\"red\">An error occurred while updating the student.</font>");
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
