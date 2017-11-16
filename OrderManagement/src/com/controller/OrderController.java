package com.controller;

import com.bean.order.Order;
import com.bean.user.User;
import com.model.order.AddOrder;
import com.model.order.GetOrderDetails;
import com.model.SimInventory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
public class OrderController extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		/*
		 * pw.print(request.getParameter("txtOrderId")); Order o1=new Order();
		 * SimInventory ABC=new SimInventory();
		 */
		String page = request.getParameter("checkPage");
		System.out.println(page);

		if (page.equals("register")) {
			String oId = request.getParameter("hiddenOrderId");
			int orderId = Integer.parseInt(oId);

			AddOrder ao = new AddOrder();

			int genOrderId = 0;
			try {
				System.out.println("Genrate\n\n\n\n");
				genOrderId = ao.generateOrderId();
				System.out.println("Genrate end\n\n\n\n");
				pw.println("The genrated Order ID is :  " + genOrderId + "<br>");
			}

			catch (Exception e) {

				System.out.println("Not able to create order id");
				pw.println("Server busy please come after some time");
			}

			String sId = request.getParameter("hiddenServiceProviderId");
			int serviceProviderId = Integer.parseInt(sId);

			String mId = request.getParameter("selectManufacturerId");
			int manufacturerId = Integer.parseInt(mId);
			String imsi = request.getParameter("hiddenImsiRange");
			// double imsiNumber = Integer.parseInt(imsi);
			String iccid = request.getParameter("hiddenIccidRange");
			String imsiType = request.getParameter("selectImsiType");
			String subscriptionType = request
					.getParameter("selectSubscriptionType");
			String qty = request.getParameter("txtQuantity");
			int quantity = Integer.parseInt(qty);

			try {
				ao.addOrder(orderId, serviceProviderId, manufacturerId,
						imsiType, subscriptionType, imsi, iccid, quantity);
				Order o = new Order();
				try {
					GetOrderDetails go = new GetOrderDetails();
					HttpSession session = request.getSession();
					
					o=go.getDetails(orderId, ((User)session.getAttribute("user")).getsId(), 0);
					
					request.setAttribute("order", o);
					if (o != null) {

						RequestDispatcher rd = request
								.getRequestDispatcher("OrderDetails_sp.jsp");
						rd.forward(request, response);
					}

				} catch (Exception e) {
					System.out.println("\n\n\nOrder Details Error");
				}

			} catch (SQLException e) {

			} catch (Exception e) {

			}
			// String license=request.getParameter("license");
		}
	}
}
