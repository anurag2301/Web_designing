package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.sim.Sim;
import com.bean.user.User;
import com.model.order.AddOrder;
import com.model.sim.AddSim;

//servlet implementation
public class SimController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		AddSim sobjM = new AddSim();
		Sim sobj=new Sim();
		String page = request.getParameter("checkPage");
		HttpSession session = request.getSession();
		System.out.println(page);
		//check abt the exception if sp logins
		if (page.equals("simRegistration")){
			try {
				
				if((Integer)(session.getAttribute("loginAs"))==1)
				{
					simRegistration(request,response);
					
				}
			}
			catch (Exception e) {
				System.out.println("\n Error in sim controller");
				e.printStackTrace();
			}	
		}
		else{
			if(page.equals("simRetrieval")){
			String searchBy = request.getParameter("searchBy");
			System.out.println("\n"+searchBy);
			String searchValue = request.getParameter("txtEnterValue");
			session = request.getSession();
			try {
				
				if((Integer)(session.getAttribute("loginAs"))==0)
				{
					
					sobj=sobjM.simRetrieveDetails(searchBy,searchValue, ((User)session.getAttribute("user")).getsId(), 0);
					
				}
				else
				{
					sobj=sobjM.simRetrieveDetails(searchBy,searchValue, ((User)session.getAttribute("user")).getmId(), 1);
						
					
				}
			}
			catch (Exception e) {
				System.out.println("\n Error in sim controller");
				e.printStackTrace();
			}
			
			System.out.println("\n\n\nfinal");
			request.setAttribute("simDetailsRetrieve",sobj);
			RequestDispatcher view =request.getRequestDispatcher("SimDetailnew.jsp"); 
			view.forward(request,response);
			return;
			}
		}
	}
	
	public void simRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int orderId;
		int quantity;
		int pin1;
		int pin2;
		int puk1;
		int puk2;
		//AddSim sobjM = new AddSim();
		//Sim sobj=new Sim();
		String status;
		//HttpSession session = request.getSession();
		String oId = request.getParameter("txtOrderId");
		orderId = Integer.parseInt(oId);
		System.out.println(orderId);
		String p1 = request.getParameter("txtPIN1");
		pin1 = Integer.parseInt(p1);
		String p2 = request.getParameter("txtPIN2");
	
		pin2 = Integer.parseInt(p2);
		System.out.println("in controller"+pin2);
		String pk1 = request.getParameter("txtPUK1");
		puk1 = Integer.parseInt(pk1);
		//System.out.println(puk1);
		String pk2 = request.getParameter("txtPUK2");
		puk2 = Integer.parseInt(pk2);
		String qty = request.getParameter("txtQuantity");
		quantity = Integer.parseInt(qty);
		System.out.println("\n\n\n1."+quantity);
		//request.setAttribute("abc", "abc");
		AddSim sobjLocal = new AddSim();
		
		status = "Ok";
		request.setAttribute("simCreationStatus",status);
		
		if(sobjLocal.checkOrderIdStatus(orderId,quantity)==false){
			System.out.println("1");
			status="InvalidOrderId";
			//request.setAttribute("orderQuantityStatus",status);
			
			request.setAttribute("simCreationStatus",status);
			RequestDispatcher view =request.getRequestDispatcher("SimRegistration.jsp"); 
			view.forward(request,response);
			return;
		}
		if(sobjLocal.checkQuantityStatus(orderId,quantity)==false){
			System.out.println("2");
			status="InvalidQuantityId";
	        //request.setAttribute("orderIdStatus",status);
			request.setAttribute("simCreationStatus",status);
			RequestDispatcher view =request.getRequestDispatcher("SimRegistration.jsp"); 
			view.forward(request,response);
			return;
		}
		else{
			System.out.println("3");
			status=sobjLocal.simOrder(orderId,quantity,pin1,pin2,puk1,puk2);
			//status ="";
			request.setAttribute("simCreationStatus",status);
			RequestDispatcher view =request.getRequestDispatcher("SimRegistration.jsp"); 
			view.forward(request,response);
			return;
		}
	}
	
	public int controllerManufacturedQuantity(int orderId){
		AddSim sobjM = new AddSim();
		return sobjM.modelManufacturedQuantity(orderId);
	}
}

