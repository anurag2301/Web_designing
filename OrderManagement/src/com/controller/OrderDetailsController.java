package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.order.Order;
import com.bean.user.User;
import com.dao.DBConnectionUtil;
import com.model.order.GetOrderDetails;

public class OrderDetailsController extends HttpServlet {
	  Connection con;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
			
			PrintWriter pw = response.getWriter();
			String page = request.getParameter("checkPage");
			System.out.println(page);
			
			
			if(page.equals("orderList")) {
				String oId = request.getParameter("hiddenOrderId");
				int orderId = Integer.parseInt(oId);
				
				GetOrderDetails go = new GetOrderDetails();
				HttpSession session = request.getSession();
				
				Order o = new Order();
				try {
					
					if(((Integer)session.getAttribute("loginAs"))==0)
					{
						o=go.getDetails(orderId, ((User)session.getAttribute("user")).getsId(), 0);
					}
					else
					{
						
							o=go.getDetails(orderId, ((User)session.getAttribute("user")).getmId(), 1);
						
					}
					request.setAttribute("order", o);
					if(o!= null)
					{						
						RequestDispatcher rd = request.getRequestDispatcher("OrderDetails_sp.jsp");
						rd.forward(request, response);
					}
					else {
						System.out.println("Order not found");
						request.setAttribute("errorMessage", "Order ID not present!");
						RequestDispatcher rd = request.getRequestDispatcher("/OrderDetails.jsp");
						rd.forward(request, response);
					}
					
					
				}
				
				catch(Exception e) {
					System.out.println("\n\n\nOrder Not found!!!");
					request.setAttribute("errorMessage", "Order ID not present!");
					RequestDispatcher rd = request.getRequestDispatcher("/OrderDetails.jsp");
					rd.forward(request, response);
				}
				
				
				//String license=request.getParameter("license");
			
				pw.println("The Order ID is :  "+request.getParameter("hiddenOrderId")+"<br>");
			
			}
			
			
			
			
			if (page.equals("details")){
			
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
					else
					{
						
							o=go.getDetails(orderId, ((User)session.getAttribute("user")).getmId(), 1);
						
					}
					request.setAttribute("order", o);
					if(o!= null)
					{						
						RequestDispatcher rd = request.getRequestDispatcher("OrderDetails_sp.jsp");
						rd.forward(request, response);
					}
					else {
						System.out.println("Order not found");
						request.setAttribute("errorMessage", "Order ID not present!");
						RequestDispatcher rd = request.getRequestDispatcher("/OrderDetails.jsp");
						rd.forward(request, response);
					}
					
					
				}
				
				catch(Exception e) {
					System.out.println("\n\n\nOrder Not found!!!");
					request.setAttribute("errorMessage", "Order ID not present!");
					RequestDispatcher rd = request.getRequestDispatcher("/OrderDetails.jsp");
					rd.forward(request, response);
				}
				
				
				//String license=request.getParameter("license");
			
				pw.println("The Order ID is :  "+request.getParameter("hiddenOrderId")+"<br>");
			}
		}
	}
