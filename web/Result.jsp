<%-- 
    Document   : Result
    Created on : Mar 21, 2020, 6:32:51 PM
    Author     : jack1
--%>


<%-- This page is to return the table of student details --%>
<%@page import="Servlet.StudentInfo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%!
    public String sum(List<StudentInfo>[] arr) {

        String result = "mailto:";
        for (int i = 0; i < arr.length; i++) {
            result += arr[i];
            result += ";";
        }
        result += "?subject=Dear Student, this is job notification";

        return result;

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Result</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
        <style>

            table {
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid black;
            }

        </style>
        <script>

            $(function () {
                $('.SendEmail').click(function (event) {
                    var email = sum(${list});
                    var subject = 'Job notification';
                    var emailBody = 'Dear Student, \nWe have a new job opportunitie now!';

                    document.location = "mailto:" + email + "?subject=" + subject + "&body=" + emailBody;
                });
            });
        </script>

        <script type="text/javascript">
            function redirectPage(URL)
            {
                window.location.href = URL;
            }
        </script>

    </head>
    <body>
        <table class=".table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Major</th>
                    <th>Program</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="student">
                    <tr>
                        <td><c:out value="${student.getID()}"/></td>
                        <td><c:out value="${student.getName()}"/></td>
                        <td><c:out value="${student.getEmail()}"/></td>
                        <td><c:out value="${student.getYear()}"/></td>
                        <td><c:out value="${student.getMonth()}"/></td>
                        <td><c:out value="${student.getMajor()}"/></td>
                        <td><c:out value="${student.getProgram()}"/></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>

        <button onclick="location.href = 'mailto:jack10086007@gmail.com?subject=Dear Student, this is job notification'">Send email now</button> 
        <input type="button" value="Go Back"
               onclick="redirectPage('search.jsp')" />
    </body>
</html>


