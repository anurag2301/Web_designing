package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.order.Order;
import com.bean.user.User;
import com.model.order.GetOrderDetails;

public class CancelOrderController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
 
    public CancelOrderController() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String oId = request.getParameter("txtOrderId");
		int orderId = Integer.parseInt(oId);
		
		GetOrderDetails go = new GetOrderDetails();
		HttpSession session = request.getSession();
		
		Order o = new Order();
		try {
			
			if(((Integer)session.getAttribute("loginAs"))==0)
			{
				o=go.getDetails(orderId, ((User)session.getAttribute("user")).getsId(), 0);
			}
			
			if(o!= null) {
				
			}
		}
		catch(Exception e) {
			
		}
	}

}
