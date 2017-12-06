/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/creator"})
public class creator extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                       
        Connection connection = null;
        try                        
        {            
          // load the sqlite-JDBC driver using the current class loader
          Class.forName("org.sqlite.JDBC");            
          
          // create a database connection
          connection = DriverManager.getConnection("jdbc:sqlite:D:\\equipsjugadors.db");
          Statement statement = connection.createStatement();
          statement.setQueryTimeout(30);  // set timeout to 30 sec.
          
            //Creem taules per defecte
            statement.executeUpdate("drop table if exists usuarios");
            statement.executeUpdate("drop table if exists jugadors");
            statement.executeUpdate("drop table if exists equips");

            statement.executeUpdate("create table usuarios (id_usuario string primary key, password string)");
            statement.executeUpdate("insert into usuarios values('Sergio','123')");
            statement.executeUpdate("insert into usuarios values('marc','123')");

            statement.executeUpdate("create table jugadors (id_jugador integer primary key, nom string,cognom string, nacionalitat string, dorsal integer, posicio string, camabona string)");
            statement.executeUpdate("insert into jugadors values(1, 'Sergio', 'Rodríguez','ESP', 20,'defensa','dreta')");
            statement.executeUpdate("insert into jugadors values(2, 'Marc', 'Català','ESP', 17,'davanter','esquerra')");

            statement.executeUpdate("create table equips (id_equip integer primary key, nom_equip string, abreviatura string, lliga string, numero integer, ciudad string,provincia string,pais string)");
            statement.executeUpdate("insert into equips values(1, 'FIB Futbol Club', 'FIB', 'UPC League', 'Barcelona', 'Barcelona', 'Espanya')");
        }
        catch(SQLException e)
        {
          System.err.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println(e.getMessage());
        }   
        finally
        {
          try
          {
            if(connection != null)
              connection.close();
          }
          catch(SQLException e)
          {
            // connection close failed.
            System.err.println(e.getMessage());
          }
        }
        response.sendRedirect("login.jsp");
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
