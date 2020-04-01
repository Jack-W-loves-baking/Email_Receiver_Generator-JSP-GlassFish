<%-- 
    Document   : addManually
    Created on : Mar 22, 2020, 3:00:13 PM
    Author     : jack1
--%>


<%-- This page is to auto add student into database --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%-- SQL insert and update --%>
<%

    if (request.getParameter("submit") != null) {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("yearStarts"));
        String major = request.getParameter("major");
        String program = request.getParameter("program");

        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/AUTDB", "student", "student");
            String sqlCommand = "INSERT INTO STUDENT(ID,NAME,EMAIL,YEARSTARTS,PROGRAM,MAJOR,MONTH) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement prepStmt = conn.prepareStatement(sqlCommand);

            prepStmt.setInt(1, id);
            prepStmt.setString(2, name);
            prepStmt.setString(3, email);
            prepStmt.setInt(4, year);
            prepStmt.setString(5, program);
            prepStmt.setString(6, major);
            prepStmt.setInt(7, month);

            prepStmt.executeUpdate();
        } catch (SQLException ex) {
        }

%>

<script>

    confirm("You have successfully added!");

</script>

<%    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
       
        <%-- Js for button listen onclick then redirect --%>
        <script type="text/javascript">
            function redirectPage(URL)
            {
                window.location.href = URL;
            }
        </script>

    </head>
    <body>

        <h1 style="margin-left: 5%">Add Student to the database</h1>
        <br>
        <div class ="row">

            <div class="col-sm-4" style="margin-left: 5%">

                <%-- Form for all the data --%>
                <form method="get" action="#">

                    <div align="left">
                        <label class="form-label">ID</label>
                        <input type="number" class="form-control" placeholder="e.g.19062259" name="id" required min="10000000" max="99999999">
                    </div>   

                    <div align="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Jack, Oliver" name="name" required>
                    </div>   

                    <div align="left">
                        <label class="form-label">Email</label>
                        <input type="text" class="form-control" placeholder="e.g. swe123@autuni.ac.nz" name="email" required>
                    </div>   

                    <div align="left">
                        <label class="form-label">Year Starts</label>
                        <input type="number" class="form-control" placeholder="e.g.2020" name="yearStarts" required min="2017" max="2020">
                    </div>   

                    <div align="left">
                        <label class="form-label">Program</label>
                        <input type="text" class="form-control" placeholder="e.g.Bachelor" name="program" required>
                    </div>   

                    <div align="left">
                        <label class="form-label">Major</label>
                        <input type="text" class="form-control" placeholder="e.g.Arts" name="major" required>
                    </div>   

                    <div align="left">
                        <label class="form-label">Month</label>
                        <input type="number" class="form-control" placeholder="e.g.3" name="month" list="allowed" required min="3" max="7">
                        <datalist id="allowed">
                            <option value="3">
                            <option value="7">
                        </datalist>
                    </div>   

                    <div align="left">
                        <input type="submit" class="btn btn-info" value="Submit" name="submit">
                        <input type="reset" class="btn btn-warning" value="Reset">
                    </div>  
                </form>
            </div>

        </div>

        <br>
        <input style="margin-left: 5%" class="btn btn-dark" type="button" value="Go Back"
               onclick="redirectPage('search.jsp')" />

    </body>
</html>
