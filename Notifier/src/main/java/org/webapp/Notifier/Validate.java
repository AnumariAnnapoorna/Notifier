package org.webapp.Notifier;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
  
public class Validate extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
  
    protected void doPost(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
    	PrintWriter out=response.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase(); 
            PreparedStatement st = con 
                   .prepareStatement("select * from user where Email=? and Password=?"); 
            String email=request.getParameter("email");
            st.setString(1, email); 
            String password=request.getParameter("psw");
            st.setString(2, password); 
            HttpSession session=request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            ResultSet rs=st.executeQuery(); 
            if(rs.next())
            {
            	session.setAttribute("id",rs.getString(1));
            	session.setAttribute("name",rs.getString(2));
            	 response.sendRedirect("Dashboard.jsp");
            }
            else
            {
            	out.println("Enter valid credentials");
            }
            st.close(); 
            con.close(); 
  
            
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    } 
} 