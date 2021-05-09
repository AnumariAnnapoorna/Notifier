package org.webapp.Notifier;

import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
  
public class InsertData extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
  
    protected void doPost(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
        try {
            Connection con = DatabaseConnection.initializeDatabase(); 
            PreparedStatement st = con 
                   .prepareStatement("insert into user(UserName,PhoneNo,Email,Password) values(?, ?, ?, ?)"); 
            st.setString(1, request.getParameter("uname")); 
  
            st.setString(2, request.getParameter("phno")); 
            
            st.setString(3, request.getParameter("email")); 
            
            st.setString(4, request.getParameter("psw")); 
  
            st.executeUpdate(); 
            st.close(); 
            con.close(); 
  
            RequestDispatcher rd=request.getRequestDispatcher("Login.html");
            rd.forward(request,response);
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    } 
} 