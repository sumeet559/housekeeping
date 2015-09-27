package com.cosmicrays.dboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class maid extends HttpServlet 
{
      Connection con;
      PreparedStatement ps;
      ResultSet rs;
      public void init(ServletConfig config)throws ServletException
      { 
            try 
               {
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/housekeep","root","1234"); 
               } 
                  catch (ClassNotFoundException e)
                     {
                        System.out.println(e);
                     } 
                  catch (SQLException e) 
                     {
                        System.out.println(e);
                     }
      }
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
      {
            doPost(request, response);
      }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
      {
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            
            HttpSession session=request.getSession();
            String counter = (String) session.getAttribute("city");
            try 
            {
                  ps=con.prepareStatement("select * from maids where city= counter");
                 ResultSet rs= ps.executeQuery();
                 System.out.println("inserted");
                 List<String> emailList=new ArrayList<String>();
                 
                 while(rs.next())
                 {
                	 String s3=rs.getString(1);
                	 emailList.add(s3);
                 }
                 for (String string : emailList) {
					System.out.println(string);
				}
                 RequestDispatcher rq=request.getRequestDispatcher("/welcome.jsp");
                 rq.forward(request, response);
            }
            catch (SQLException e) 
                  {
                  e.printStackTrace();
                  }
      }
}
