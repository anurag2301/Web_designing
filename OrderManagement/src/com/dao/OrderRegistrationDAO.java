package com.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;



import com.bean.order.Order;

public class OrderRegistrationDAO {
	Connection con;

	public OrderRegistrationDAO() {
	}

	
	public int getQuantityForDate(int sId, int mId) throws SQLException, Exception{
		
		int quantity;
		Connection con = null;
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yy");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		String sql = "Select sum(quantity) from orderdetails where serviceproviderid='"+sId+"' AND manufacturerid='"+mId+"' AND orderdate like to_date('"+dateFormat.format(date)+"', 'DD-MM-YY')";
		System.out.println("SQL is ::: " + sql);
		ResultSet rs = null;
		try{
			con = DBConnectionUtil.getConnection();
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			
			if(rs.next()) {
			
				quantity = 10000 - rs.getInt(1);
				System.out.println("quantity"+quantity);
			}
			else {
				quantity = 10000;
				System.out.println("quantity"+quantity);
			}
		}
		catch(SQLException e){			
			System.out.println("\n1.Sql get quantity");
			throw e;
		}
		
		catch (Exception e) {
			System.out.println("2.Exception get quantity");
			throw e;
		} finally {
			DBConnectionUtil.closeConnection(con);
		}
		
		return quantity;
	}
	
	public void addOrder(Order obj) throws SQLException,Exception {
		Connection con = null;
		String sql = "INSERT INTO OrderDetails VALUES(" + obj.getOrderId()
				+ "," + obj.getsId() + "," + obj.getmId() + ",'"
				+ obj.getImsiType() + "','" + obj.getSubscriptionType() + "','"
				+ obj.getStartImsi() + "','" + obj.getIccid() + "',"
				+ obj.getQuantity() + ",DEFAULT" + ")";
		System.out.println("SQL is ::: " + sql);
		try{
			con = DBConnectionUtil.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.executeUpdate(sql);
		}
		catch(SQLException e){
			throw e;
		}
		
		catch (Exception e) {
			throw e;
		} finally {
			DBConnectionUtil.closeConnection(con);
		}
	}

	public int generateOrderId() {
		int random_num = (int)(Math.floor(Math.random() * 100000.0));
		if(random_num<10000) {
			random_num += 10000;
		}
		Connection con = null;		
		System.out.println("\n\n\n0.Random"+random_num);
		int orderId = 0;
		try {			
			con = DBConnectionUtil.getConnection();
			String sql = "SELECT OrderId FROM OrderDetails WHERE ORDERID="
					+ random_num;
			Statement st = con.prepareStatement(sql);
			System.out.println("\n\n\n1.Random"+random_num);
			ResultSet rs = st.executeQuery(sql);
			System.out.println("\n\n\n2.Random"+random_num);
			rs.next();
			if (rs.getBoolean(1)) {
				System.out.println("Successful :: Order Id exists");
				System.out.println("ccc");
				orderId = generateOrderId();
				
				MyException m = new MyException();
				
				m.setMsg("Successful :: Order Id exists");
				throw m;
				
				//throw new MyException("Successful :: Order Id exists");
			}

			
		}
		
		catch (MyException m) {
			System.out.println("abc");
			System.out.println(m.getMessage());
			return orderId;
		}
				
		
		catch (Exception e) {
			orderId = random_num;
			System.out.println("Order Id does't exists\n\n\n\n\n");
			
			return orderId;
		}
		
		finally {
			DBConnectionUtil.closeConnection(con);
		}

		return orderId;
	}

	

	public int getOrderCount() {
		Connection con = null;
		String sql = "SELECT OrderId FROM OrderDetails";
		int count = 0;
		try {
			con = DBConnectionUtil.getConnection();
			Statement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.closeConnection(con);
		}
		return count;
	}
}