<%-- 
    Document   : search
    Created on : Mar 16, 2020, 10:56:31 PM
    Author     : jack1
--%>


 <%-- This page is to locate the student we want --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:c="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send job notifications to specific group of students</title>
        <style>p{font-weight: bold}</style>
        <% String message = (String) request.getAttribute("data");%>
        <link rel="stylesheet" href="Bootstrap.css/bootstrap.min.css"/>
    </head>
    <body>

        <h2 style="margin-left:5%">Job Notification Group Generator</h2>

        <div style="color: red; margin-left:5%"><br>Please complete the search conditions below</div>
        <Form style="margin-left:5%" method="get" action="/New/Student"><br>

            <p>1.For current student or graduate?</p>
            <input type="radio" name="choice" id="Current" value="Current">Current Student
            <input type="radio" name="choice" id="Graduate" value="Graduate">Graduate
            <input type="radio" name="choice" id="All" value="All" checked="checked">All
            <br>
            <p>2. Which major:</p>
            <select name="major">
                <option value="All">All</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Business">Business</option>
                <option value="Arts">Arts</option>              
                <option value="Sports">Sports</option>
                <option value="Math">Math</option>
            </select>
            <br>
            <br>
            <p>3. Which year:</p>
            <select name="year">
                <option value="All">All</option>
                <option value="Year 1">Year 1</option>
                <option value="Year 2">Year 2</option>
                <option value="Year 3">Year 3</option>
                <option value="Year 4">Year 4</option>
            </select>
            <a href="checkYear.jsp" ><span title="Check which year for the student">More details</span></a>
            <br>
            <br>
            <p>4. Manually update:</p>
            <a href="addManually.jsp"><span title="Add students">Manually add student in the database</span></a>
            <br>
            <br>
            <br>
            <input type="submit" value="Submit" name="submit">
            <input type='reset' name="reset"/>
        </Form>

        <br>
        <a style="margin-left:5%" href='<%=response.encodeURL(request.getContextPath())%>'> Log out</a>
    </body>

