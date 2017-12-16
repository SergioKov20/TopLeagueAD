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
@WebServlet(urlPatterns = {"/buscarEquipo"})
public class buscarEquipo extends HttpServlet {

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
          
          String nom = (String) request.getParameter("nom_equip");
          
          String liga = (String) request.getParameter("liga");
          
          String ciudad = (String) request.getParameter("city");
          
          String pais = (String) request.getParameter("pais");
          
          
          String query = "";
          boolean exist = false;
          
          if(!nom.equals("")) {
              query = "nom_equip='"+nom+"'";
              exist = true;
          }
          if(!liga.equals("")) {
              if(exist) {
                  query += " and lliga='"+liga+"'";
              }
              else {
                  query = "lliga='"+liga+"'"; 
                  exist = true;
              }
          }
          if(!ciudad.equals("")) {
              if(exist) {
                  query += " and ciudad='"+ciudad+"'";
              }
              else {
                  query = "ciudad='"+ciudad+"'"; 
                  exist = true;
              }
          }
          if(!pais.equals("")) {
              if(exist) {
                  query += " and pais='"+pais+"'";
              }
              else {
                  query = "pais='"+pais+"'"; 
                  exist = true;
              }
          }
          
          ResultSet rs;
          
          if(query.equals("")){
              rs = statement.executeQuery("select * from equips");
          }
          else {
              rs = statement.executeQuery("select * from equips where " + query);
          }
          List<String> lista = new ArrayList<String>();
          
         while(rs.next()) {
            String dios = rs.getString("nom_equip") + "/" 
                + rs.getString("abreviatura") + "/" 
                + rs.getString("lliga") + "/"
                + rs.getString("ciudad") + "/"
                + rs.getString("pais");
            lista.add(dios);
        }
          
          out.println("<table>");
          out.println("<tr>");
          
          out.println("<th>--NOMBRE--</th>");
          out.println("<th>--ABREVIATURA--</th>");
          out.println("<th>--LIGA--</th>");
          out.println("<th>--CIUDAD--</th>");
          out.println("<th>--PAIS--</th>");
          out.println("</tr>");
          
          if(lista.isEmpty()) {
              out.println("</table><br>No hay ningún equipo disponible con esas características.<br>");
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