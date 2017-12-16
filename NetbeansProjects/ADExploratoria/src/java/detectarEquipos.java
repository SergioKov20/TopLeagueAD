import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/detectarEquipos"})
public class detectarEquipos extends HttpServlet {

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
          connection = DriverManager.getConnection("jdbc:sqlite:F:\\equipsjugadors.db");
          Statement statement = connection.createStatement();
          statement.setQueryTimeout(30);  // set timeout to 30 sec.
          
          
          String teamname = "";
          String league = "";
          String city = "";
          String country = "";
          
          ResultSet rs = statement.executeQuery("select distinct nom_equip from equips");
          
          while(rs.next())
          {
              teamname += rs.getString("nom_equip") + '/';
          }
          
          ResultSet rs2 = statement.executeQuery("select distinct lliga from equips");
          
          while(rs2.next())
          {
              league += rs2.getString("lliga") + '/';
          }
          
          ResultSet rs3 = statement.executeQuery("select distinct ciudad from equips");
          
          while(rs3.next())
          {
              city += rs3.getString("ciudad") + '/';
          }
          
          ResultSet rs4 = statement.executeQuery("select distinct pais from equips");
          
          while(rs4.next())
          {
              country += rs4.getString("pais") + '/';
          }
          
          request.getSession().setAttribute("nom_equip", teamname);
          request.getSession().setAttribute("lliga", league);
          request.getSession().setAttribute("ciutat", city);
          request.getSession().setAttribute("pais", country);
          response.sendRedirect("buscarEquipos.jsp");
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
}