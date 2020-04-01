<%-- 
    Document   : index
    Created on : Mar 16, 2020, 10:49:53 PM
    Author     : jack1
--%>


 <%-- This page is for staff login --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:c="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html">
    <h:head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo</title>
        <link rel="stylesheet" href="Bootstrap.css/bootstrap.min.css"/>
        <style>
            h2{
                text-align: center;
                margin-top: 10%;
            }

            div{width: 400px;}
            div.a{color:red;text-align: left; font-weight: bold; font-family:helvetica; }
            .buttonset{
                margin-left: 30%;

            }
            img{
                margin-left: 5%;
            }
        </style>    
    </h:head>
    <body>
        <div class="container-fluid" style="margin-left: 35%; margin-top: 5%">
            <h2>AUT Staff Portal</h2>
            
             <%-- use input submit --%>
            <form method ="POST" action="/New/Login" style="margin:0 auto; width:250px;">
                Username:<input type="text" value="" name="userName" placeholder="username" ><br>
                Password: <input type="password" value="" name="password" placeholder="password" >
                <br><br>

                <input type="submit" value="Login" name="login" style="margin-left:30%">
                <input type="reset" value="Reset" name="reset" >
                <br>
                <br>
                <div class="a">Please note! This is for staff use only. All illegal attempts of login will be tracked. </div>
                <br>
            </form>
        </div>

        <img src="/New/mainPic.PNG" alt="Welcome to Staff Portal!" align="center" >

    </body>
</html>
