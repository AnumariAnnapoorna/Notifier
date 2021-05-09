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

public class Notesdb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException 
    { 
		  PrintWriter out=response.getWriter();
		  String bname=request.getParameter("bname");
			        try {
			            Connection con = DatabaseConnection.initializeDatabase(); 
			            PreparedStatement st = con 
			                   .prepareStatement("insert into notebook(noteBookName) values(?)"); 
			            st.setString(1, bname); 
			            int i=st.executeUpdate();
			            if(i>0)
			            {
			            	RequestDispatcher rd=request.getRequestDispatcher("NoteBook.jsp");
			                rd.include(request,response);
			            }
			            st.close(); 
			            con.close();
			        } 
			        catch (Exception e) { 
			            e.printStackTrace(); 
			        } 
			    }
}
