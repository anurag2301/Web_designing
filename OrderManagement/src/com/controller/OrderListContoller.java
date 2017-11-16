package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.order.Order;
import com.bean.user.User;
import com.model.order.GetOrderDetails;
import com.model.order.GetOrderList;

/**
 * Servlet implementation class OrderList
 */
public class OrderListContoller extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	public ArrayList<Order> getList(int id, int loginAs) {
		ArrayList<Order> orderList = new ArrayList<Order>();
		GetOrderList gol = new GetOrderList();
		

		try {
			if (loginAs == 0) {
				
				orderList = gol.getList(id, 0);
			}

			else {

				
				orderList = gol.getList(id, 1);
			}

			return orderList;
		}

		catch (Exception e) {
			System.out.println("Order List error");
		}
		return orderList;
	}
}
