<%-- 
    Document   : checkYear
    Created on : Mar 20, 2020, 10:09:41 PM
    Author     : jack1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check which year the student is at</title>
    </head>
    <body>
        <h1>Check which year the student is at?</h1>
        <form method='post' action='/New/checkYear'>
            <p>1.Choose the program</p>
             <select name="program">
              <option value="Bachelor Degree">Bachelor Degree</option>
              <option value="Graduate Certificate">Graduate Certificate</option>
              <option value="Graduate Diploma">Graduate Diploma</option>
              <option value="Exchange Student Program">Exchange Student Program</option>
            </select>
            <br>
            <p>2.Choose the start date</p>
            <label>Month:</label>
            <input type="number" name="month" max="12" min="1" value="3">
            <label>Year:</label>
            <input type="number" name="year" max="2020" value="2020">
            <br>
             <br>
             <input type='submit' name='check' value='check'>
             
        </form>
        <br>
        <a href='<%=response.encodeURL("search.jsp")%>'> Go back</a>
    </body>
</html>
