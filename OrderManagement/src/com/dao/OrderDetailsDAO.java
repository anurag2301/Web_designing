package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.order.Order;

public class OrderDetailsDAO {
	Connection con;

	public OrderDetailsDAO() {
	}
	
	public Order getDetails(int orderId, int id, int loginAs) throws SQLException, Exception{
		
		con = DBConnectionUtil.getConnection();
		String sql ="SELECT * FROM OrderDetails WHERE ORDERID=" + orderId;
		if(loginAs == 0 ) {			
			sql = "SELECT * FROM OrderDetails WHERE ORDERID=" + orderId +" AND serviceproviderid="+id;
		}
		else {
			sql = "SELECT * FROM OrderDetails WHERE ORDERID=" + orderId +" AND manufacturerid="+id;
		}
		System.out.println(sql+"\n");
		try {
			
			Statement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			
			if (rs.next()) {
				System.out.println("\n\n\n2.3yes");
				int oId = rs.getInt(1);
				System.out.println("\n\n\n"+oId);
				
				System.out.println("\nsid = "+rs.getInt(2));
				int sId = rs.getInt(2);
				int mId = rs.getInt(3);
				System.out.println("\n\n\n2"+oId);
				String imsiType = rs.getString(4);
				System.out.println("\n\n\n3"+oId);
				String subsType = rs.getString(5);
				System.out.println("\n\n\n4"+oId);
				String imsiRange = rs.getString(6);
				System.out.println("\n\n\n"+oId);
				String iccid = rs.getString(7);
				int qty = rs.getInt(8);
				System.out.println("\n\n\n"+oId);
				String date = rs.getString(9);
				System.out.println("\n\n\n"+oId);
				Order ao = new Order(oId, sId, mId, imsiType, subsType, imsiRange, iccid, qty, date);
				return ao;
			}
			
		} 
		catch(SQLException e) {
			throw e;
			/*e.printStackTrace();
			System.out.println("\nNo such order present");*/
		}
		catch (Exception e) {
			throw e;
			/*e.printStackTrace();
			System.out.println("\n\n\nError getting row");
			return null;*/
		}
		finally {
			DBConnectionUtil.closeConnection(con);
		}
		return null;
	}
}
