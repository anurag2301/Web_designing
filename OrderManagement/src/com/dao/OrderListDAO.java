package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.bean.order.Order;

public class OrderListDAO {
	public ArrayList<Order> getList(int id, int loginAs) {
		ArrayList<Order> list = new ArrayList<Order>();
		Connection con = null;

		String sql;
		if (loginAs == 0) {
			sql = "SELECT * FROM OrderDetails WHERE serviceproviderid=" + id;
		} else {
			sql = "SELECT * FROM OrderDetails WHERE manufacturerid=" + id;
		}
		try {
			con = DBConnectionUtil.getConnection();
			try {

				Statement statement = con.prepareStatement(sql);
				ResultSet rs = statement.executeQuery(sql);

				while (rs.next()) {

					int oId = rs.getInt(1);
					int sId = rs.getInt(2);
					int mId = rs.getInt(3);

					String imsiType = rs.getString(4);

					String subsType = rs.getString(5);

					String imsiRange = rs.getString(6);

					String iccid = rs.getString(7);
					int qty = rs.getInt(8);

					String date = rs.getString(9);

					Order ao = new Order(oId, sId, mId, imsiType, subsType,
							imsiRange, iccid, qty, date);
					list.add(ao);
				}
			}

			catch (SQLException e) {
				e.printStackTrace();
				System.out.println("\nNo order present");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("\n\n\nError getting row");
				return null;
			}
		}

		catch (Exception e) {
			System.out.println("\nOrder list : connection error");
			return null;
		} finally {
			DBConnectionUtil.closeConnection(con);
		}

		return list;
	}
}
