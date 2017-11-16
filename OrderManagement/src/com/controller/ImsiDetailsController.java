package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.imsi.Imsi;
import com.bean.user.User;
import com.model.imsi.ImsiDetails;


public class ImsiDetailsController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
    public ImsiDetailsController() 
    {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String page = request.getParameter("checkPage");
		System.out.println(page);
		
		
		if(page.equals("imsiDetails")||page.equals("imsiDetailsView")) 
		{
			String imsiEntered = request.getParameter("txtImsi");
			HttpSession session = request.getSession();
			Imsi imsi=new Imsi();
			ImsiDetails iDetails=new ImsiDetails();
			try {
				
				if(((Integer)session.getAttribute("loginAs"))==0)
				{
					System.out.println("service provider");
					imsi=iDetails.getImsiDetails(imsiEntered, ((User)session.getAttribute("user")).getsId(), 0);
				}
				else
				{
					System.out.println("manufacturer");
					System.out.println("sa");
					imsi=iDetails.getImsiDetails(imsiEntered, (Integer)((User)session.getAttribute("user")).getmId(), 1);
					
				}
				request.setAttribute("Imsi", imsi);
				if(imsi!= null)
				{	
					System.out.println("\n"+imsi.getImsiNumber());
					System.out.println("directing to table");
					RequestDispatcher rd = request.getRequestDispatcher("/ImsiDetailsview.jsp");
					System.out.println("abc");
					rd.forward(request, response);
				}
				else 
				{
					System.out.println("Order not found");
					request.setAttribute("errorMessage", "Order ID not present!");
					RequestDispatcher rd = request.getRequestDispatcher("/ImsiDetails.jsp");
					rd.forward(request, response);
				}
			}
			catch(Exception e) 
			{
				e.printStackTrace();
					System.out.println("\n\n\nSIM with this Imsi number Not found!!!");
					request.setAttribute("errorMessage", "Order ID not present!");
					RequestDispatcher rd = request.getRequestDispatcher("/ImsiDetails.jsp");
					rd.forward(request, response);
			}
				
		}
	
			
	}
}
		
	


