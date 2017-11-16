package com.model.order;

import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.order.Order;
import com.dao.OrderDetailsDAO;
import com.dao.OrderRegistrationDAO;
import com.model.user.UserList;

public class GetOrderDetails {
	public GetOrderDetails() {

	}

	public Order getDetails(int orderId, int id, int loginAs) throws SQLException,Exception{

		Order myOrder = new Order();
		OrderDetailsDAO oD = new OrderDetailsDAO();
		myOrder = oD.getDetails(orderId, id, loginAs);
		return myOrder;
	}

	public ArrayList<Integer> getQuantityForDate (String sid) throws Exception {
		int quantity = 0;
		ArrayList<Integer> maxQuantityList= new ArrayList<Integer>();
		OrderRegistrationDAO oDao = new OrderRegistrationDAO();
		
		int mId;
		UserList ul = new UserList(); 
		ArrayList<String> manuList = ul.manufacturerList();
		try {
			int id = Integer.parseInt(sid);
			System.out.println(sid);
			for(String s: manuList) {
				mId = ul.manufacturerId(s);
				quantity = oDao.getQuantityForDate(id, mId);
				maxQuantityList.add(quantity);
			}
		}
		catch (SQLException e) {
			throw e;
		}
		catch(Exception e) {
			throw e;
			//System.out.println("\nError in converting sid in getorderdetails");
		}
		
		return maxQuantityList;
	}
}
