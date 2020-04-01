package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jack1
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})


/**
 * Get the request from index.jsp, then connect to database and check if the input is valid.
 */
public class LoginServlet extends HttpServlet {

    private final String url = "jdbc:derby://localhost:1527/AUTDB";
    private final String loginName = "student";
    private final String loginPassword = "student";

    boolean result = false;
    private final char QUOTE = '"';
    RequestDispatcher dispatcher;
    Context context;
    InitialContext ctx;
    String sqlCommand;

    //check if user's password from the input on index.jsp is in the Database.
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String submit = request.getParameter("login");
        String name = request.getParameter("userName");
        String password = request.getParameter("password");

        String correctPassword = null;
        boolean checkresult = false;
        if (submit != null) {
            try {
                Connection conn = DriverManager.getConnection(url, loginName, loginPassword);
                sqlCommand = "SELECT Password FROM STUDENT.AUTAdmin WHERE UserName LIKE ?";
                PreparedStatement prepStmt = conn.prepareStatement(sqlCommand);
                prepStmt.setString(1, name);
                ResultSet resultSet = prepStmt.executeQuery();
                if (resultSet != null) {
                    try {
                        while (resultSet.next()) {
                            correctPassword = resultSet.getString("Password");
                        }
                        if (correctPassword.equals(password)) {
                            checkresult = true;
                        }
                        conn.close();
                    } catch (Exception e) {
                    }
                } else {
                    checkresult = false;
                }
            } catch (SQLException e) {
                System.err.println(e);

            }
            if (checkresult) {

                String success = "Welcome " + name + ", you have Logged in successfully!";
                request.setAttribute("data", success);

                dispatcher
                        = request.getRequestDispatcher("/search.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("name", name);
                dispatcher
                        = request.getRequestDispatcher("/invalidUser.jsp");
                dispatcher.forward(request, response);

            }

        }

    }
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
