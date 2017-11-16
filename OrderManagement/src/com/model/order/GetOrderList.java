package com.model.order;

import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.order.Order;
import com.dao.OrderListDAO;

public class GetOrderList {
	public ArrayList<Order> getList(int id, int loginAs) throws SQLException,Exception{
		ArrayList<Order> list = new ArrayList<Order>();
		OrderListDAO olDao = new OrderListDAO();
		
		try {
			list = olDao.getList(id, loginAs);
		}
		catch(Exception e) {
			System.out.println("\nGetOrderList :: Error");
			return null;
		}
		return list;
	}
}
