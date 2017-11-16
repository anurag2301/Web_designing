package com.model.order;
import java.sql.SQLException;

import com.bean.order.Order;
import com.dao.ImsiDAO;
import com.dao.OrderRegistrationDAO;

public class AddOrder {

	public AddOrder() {
		
	}
	
	public void addOrder (int orderId, int serviceProviderId, int manufacturerId, String imsiType, String subscriptionType, String imsiNumber, String iccid, int quantity) throws SQLException,Exception {
		
		Order myOrder = new Order(orderId, serviceProviderId, manufacturerId, imsiType, subscriptionType, imsiNumber, iccid, quantity);
		OrderRegistrationDAO oD = new OrderRegistrationDAO();
		
		try {
			oD.addOrder(myOrder);
			String imsiStatus="IM";
			ImsiDAO iDao=new ImsiDAO();
			iDao.registerImsi(imsiNumber,imsiStatus);
		}
		catch (SQLException e) {
			throw e;
		}
		
		catch(Exception e) {
			throw e;
		}
		
		
		
	}
	
	public int generateOrderId() {
		OrderRegistrationDAO od = new OrderRegistrationDAO();
		return od.generateOrderId();
	}
}
