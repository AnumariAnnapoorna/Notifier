package org.webapp.Notifier;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
  
public class Edituser extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
  
    protected void doPost(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
    	PrintWriter out=response.getWriter();
    	HttpSession session=request.getSession(false);
    	out.println(session);
    	if(session.getAttribute("email")==null)
    	{
    		response.sendRedirect("Login.html");
    	}
    	else {
    	String name=(String)session.getAttribute("email");	
    	String password=(String)session.getAttribute("password");	
        try {
            Connection con = DatabaseConnection.initializeDatabase(); 
            PreparedStatement st = con 
                   .prepareStatement("update user set Username=?,PhoneNo=?,Email=?,Password=? where Email=? and Password=?"); 
            st.setString(1, request.getParameter("uname")); 
  
            st.setString(2, request.getParameter("phno")); 
            
            st.setString(3, request.getParameter("email")); 
            
            st.setString(4, ""+request.getParameter("psw")); 
            
            st.setString(5, name); 
            
            st.setString(6, password); 
  
            st.executeUpdate(); 
            
            st.close(); 
            con.close(); 
        
       
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    	}
    } 
} 