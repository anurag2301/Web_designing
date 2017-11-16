package com.model;

import com.bean.order.Order;
import com.dao.OrderRegistrationDAO;

public class SimInventory {

	OrderRegistrationDAO cDao=new OrderRegistrationDAO();
		
	
	
		public Order addOrder(Order obj){	
			//obj.setOrderId(generateCustomerID());
			//cDao.addOrder(obj);
			return obj;			
		}
		
		public int generateCustomerID(){
		System.out.println(cDao.getOrderCount());
			int count=cDao.getOrderCount();
			return count++;
		}
		
		public Order viewOrder(Order obj){
			Order cObj=new Order();

			return cObj;
		}

	}
