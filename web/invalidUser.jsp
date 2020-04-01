<%-- 
    Document   : invalidUser
    Created on : Mar 21, 2020, 3:48:44 PM
    Author     : jack1
--%>

 <%-- This page is used if the user is not in the database --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>invalidUser</title>
        <script type="text/javascript">
            function redirectPage(URL)
            {
                window.location.href = URL;
            }
        </script>
    </head>
    <body>

        <p style="color: red; font-weight: bold; font-family:helvetica;">Hi,<%=(String) request.getAttribute("name")%>! The combination of username and password does not exist!</p1>
        <br>
        <br>
         <%-- send email through outlook --%>
        <button onclick="location.href = 'mailto:jack10086007@gmail.com?subject=Apply for the access to Staff Portal'">Apply for access</button>
        <input type="button" value="Go Back"
               onclick="redirectPage('index.jsp')" />


</body>
</html>
