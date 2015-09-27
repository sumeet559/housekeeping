package com.cosmicrays.dboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Search extends HttpServlet 
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
           
            String lat=request.getParameter("lat");
            String lon=request.getParameter("lon");
            
            HttpSession session=request.getSession();
           String user= (String) session.getAttribute("user");
         session.setAttribute("lat", lat);
         session.setAttribute("lon", lon);
           
           
            pw.println("<html><body>");
            try 
            {
                  ps=con.prepareStatement("insert into position values(?,?,?)");
                  ps.setString(1, user);
                  ps.setString(2, lat);
                  ps.setString(3, lon);
                  ps.executeUpdate();
                  
                System.out.println("inserted");
                RequestDispatcher rq=request.getRequestDispatcher("/got_maid.jsp");
                rq.forward(request, response);
            }
            catch (SQLException e) 
                  {
                  e.printStackTrace();
                  }
      }
} 