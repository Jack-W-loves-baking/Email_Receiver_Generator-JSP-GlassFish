package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.StudentBean;
import java.util.ArrayList;
import javax.enterprise.inject.spi.Bean;

/**
 *
 * This class is to get the response from seach.jsp and return the students to result.jsp
 */
@WebServlet(name = "StudentServlet", urlPatterns = {"/Student"})
public class StudentServlet extends HttpServlet {

    private final String url = "jdbc:derby://localhost:1527/AUTDB";
    private final String loginName = "student";
    private final String loginPassword = "student";
    private final char QUOTE = '"';

    List<StudentBean> sdList = new ArrayList<StudentBean>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String major = request.getParameter("major");
        String submit = request.getParameter("submit");

        //Narrow down the sutdent list as per the year of study we want.
        String year = request.getParameter("year");
        String yearToSearch = "";
        if (year.equals("All")) {
            yearToSearch = "= YEARSTARTS";
        }
        if (year.equals("Year 1")) {
            yearToSearch = "= 2020";
        }
        if (year.equals("Year 2")) {
            yearToSearch = "= 2019";
        }
        if (year.equals("Year 3")) {
            yearToSearch = "= 2018";
        }
        if (year.equals("Year 4")) {
            yearToSearch = "= 2017";
        }

        /**
         * Narrow down the student list as per graduate or current. Graduate
         * student will start before 2017*
         */
        String graduationStatus = request.getParameter("choice");

        if (graduationStatus.equals("Graduate")) {
            yearToSearch = "< 2017";
        }

        /**
         * If choose all majors, will return * for SQL*
         */
        major = "'" + major + "'";
        if (major.equals("'" + "All" + "'")) {
            major = "MAJOR";
        }

        if (submit != null) {

           

            if (graduationStatus.equals("Graduate") && !(year.equals("All"))) {
                request.setAttribute("year", yearToSearch);
                request.getRequestDispatcher("ErrorSearch.jsp").forward(request, response);
                return;
            }

            try {
                Connection conn = DriverManager.getConnection(url, loginName, loginPassword);
                String sqlCommand = "SELECT * FROM STUDENT.STUDENT WHERE YEARSTARTS " + yearToSearch + " AND MAJOR = " + major;
                PreparedStatement prepStmt = conn.prepareStatement(sqlCommand);
                ResultSet resultSet = prepStmt.executeQuery();

                if (resultSet != null) {
                    while (resultSet.next()) {

                        StudentBean sdi = new StudentBean();
                        sdi.setID((resultSet.getInt(1)));
                        sdi.setMajor(resultSet.getString("Major"));
                        sdi.setName(resultSet.getString("Name"));
                        sdi.setEmail(resultSet.getString("Email"));
                        sdi.setYearStarts(resultSet.getInt(4));
                        sdi.setProgram(resultSet.getString("Program"));
                        sdi.setMonth(resultSet.getInt("Month"));
                        sdList.add(sdi);
                    }

                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("list", sdList);
            request.getRequestDispatcher("Result.jsp").forward(request, response);

           
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
