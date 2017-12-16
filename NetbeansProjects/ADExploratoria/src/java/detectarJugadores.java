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
@WebServlet(urlPatterns = {"/detectarJugadores"})
public class detectarJugadores extends HttpServlet {

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
          
          
          String cognom = "";
          String nacionalitat = "";
          String posicio = "";
          
          ResultSet rs = statement.executeQuery("select distinct cognom from jugadors");
          
          while(rs.next())
          {
              cognom += rs.getString("cognom") + '/';
          }
          
          ResultSet rs2 = statement.executeQuery("select distinct nacionalitat from jugadors");
          
          while(rs2.next())
          {
              nacionalitat += rs2.getString("nacionalitat") + '/';
          }
          
          ResultSet rs4 = statement.executeQuery("select distinct posicio from jugadors");
          
          while(rs4.next())
          {
              posicio += rs4.getString("posicio") + '/';
          }
          
          request.getSession().setAttribute("cognom", cognom);
          request.getSession().setAttribute("nacionalitat", nacionalitat);
          request.getSession().setAttribute("posicio", posicio);
          response.sendRedirect("buscarJugadores.jsp");
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