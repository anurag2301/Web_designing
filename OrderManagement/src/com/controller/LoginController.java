package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;

import com.bean.user.User;
import com.model.user.UserList;


public class LoginController extends HttpServlet {
	
	private static final Logger log = Logger.getLogger(LoginController.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("Login");
		
		PrintWriter pw = response.getWriter();
		
		User u = null;
		int id=0;
		String pass = "";
		try {
			id = Integer.parseInt(request.getParameter("txtLoginId"));
			pass = request.getParameter("passPassword");
			
			UserList ul = new UserList();
			
			u = ul.searchUserList(id, pass);
		}
		catch(Exception e) {
			System.out.println("\n\n\nLogin error");
			
			System.out.println("\n\n\nUser not found!");
			request.setAttribute("errorMessage", "Invalid user Id or password");
			RequestDispatcher rd = request.getRequestDispatcher("/UserLogin.jsp");
			rd.forward(request, response);
		}
		
		if(u == null) {
			
			
			System.out.println("\n\n\nUser not found!");
			request.setAttribute("errorMessage", "Invalid user Id or password");
			RequestDispatcher rd = request.getRequestDispatcher("/UserLogin.jsp");
			rd.forward(request, response);
		}
		else {
					
			
			
			
			HttpSession session = request.getSession();
						
			session.setAttribute("user", u);
			
			
			if(u.getRole()==0) {
				RequestDispatcher rd = request.getRequestDispatcher("/SpHome.jsp");
				rd.forward(request, response);
				
			}
			
			else if(u.getRole()==1) {
				RequestDispatcher rd = request.getRequestDispatcher("/MaHome.jsp");
				rd.forward(request, response);
				
			}
			
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/LoginAs.jsp");
				rd.forward(request, response);
			}
		}
	}

}
