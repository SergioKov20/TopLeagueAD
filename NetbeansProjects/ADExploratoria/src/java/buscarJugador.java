/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio
 */
@WebServlet(urlPatterns = {"/buscarJugador"})
public class buscarJugador extends HttpServlet {

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
        
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        } 
        else out.print("Logged in as: " + request.getSession().getAttribute("user") + '.' + "<br><br>");
                       
        Connection connection = null;
        try                        
        {            
          // load the sqlite-JDBC driver using the current class loader
          Class.forName("org.sqlite.JDBC");           
          
          // create a database connection
          connection = DriverManager.getConnection("jdbc:sqlite:F:\\equipsjugadors.db");
          Statement statement = connection.createStatement();
          statement.setQueryTimeout(30);  // set timeout to 30 sec.
          
          String nom = (String) request.getParameter("nom");
          
          String cognom = (String) request.getParameter("cognom");
          
          String nacionalitat = (String) request.getParameter("nacionalitat");
          
          String posicio = (String) request.getParameter("posicio");
          
          
          String query = "";
          boolean exist = false;
          
          if(!nom.equals("")) {
              query = "nom='"+nom+"'";
              exist = true;
          }
          if(!cognom.equals("")) {
              if(exist) {
                  query += " and cognom='"+cognom+"'";
              }
              else {
                  query = "cognom='"+cognom+"'"; 
                  exist = true;
              }
          }
          if(!nacionalitat.equals("")) {
              if(exist) {
                  query += " and nacionalitat='"+nacionalitat+"'";
              }
              else {
                  query = "nacionalitat='"+nacionalitat+"'"; 
                  exist = true;
              }
          }
          if(!posicio.equals("")) {
              if(exist) {
                  query += " and posicio='"+posicio+"'";
              }
              else {
                  query = "posicio='"+posicio+"'"; 
                  exist = true;
              }
          }
          
          ResultSet rs;
          
          if(query.equals("")){
              rs = statement.executeQuery("select * from jugadors");
          }
          else {
              rs = statement.executeQuery("select * from jugadors where " + query);
          }
          List<String> lista = new ArrayList<String>();
          
         while(rs.next()) {
            String dios = rs.getString("nom") + "/" 
                + rs.getString("cognom") + "/" 
                + rs.getString("nacionalitat") + "/"
                + rs.getString("dorsal") + "/"
                + rs.getString("posicio") + "/"
                + rs.getString("camabona");
            lista.add(dios);
        }
          
          out.println("<table>");
          out.println("<tr>");
          
          out.println("<th>--NOMBRE--</th>");
          out.println("<th>--APELLIDOS--</th>");
          out.println("<th>--NACIONALIDAD--</th>");
          out.println("<th>--DORSAL--</th>");
          out.println("<th>--POSICION--</th>");
          out.println("<th>--PIERNA BUENA--</th>");
          out.println("</tr>");
          
          if(lista.isEmpty()) {
              out.println("</table><br>No hay ningún jugador disponible con esas características.<br>");
          }
          else {
            for(int x = 0; x < lista.size(); ++x) {
              out.println("<tr>");
              String filas[] = lista.get(x).split("/");
              for(int i = 0; i < filas.length; ++i) {
                  out.println("<th>" + filas[i] + "</th>");
              }
              out.println("</tr>");
            }
          
            out.println("</table>");
          }
          
          out.println("<br><br>");
          out.println("<a href=\"menu.jsp\">Continue</a>");
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
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, java.io.IOException {
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