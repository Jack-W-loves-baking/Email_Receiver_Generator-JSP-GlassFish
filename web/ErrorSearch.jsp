<%-- 
    Document   : invalidUser
    Created on : Mar 21, 2020, 3:48:44 PM
    Author     : jack1
--%>


<%-- This page is to direct if user choose both graduate and year 2017-2020 --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <script type="text/javascript">
            function redirectPage(URL)
            {
                window.location.href = URL;
            }
        </script>
    </head>
    <body>

        <p style="color: red; font-weight: bold; font-family:helvetica;">Error, it is impossible for graduate student whose starts year <%=(String) request.getAttribute("year")%></p1>
        <br>
        <br>      
        <input type="button" value="Go Back"
               onclick="redirectPage('search.jsp')" />


</body>
</html>
