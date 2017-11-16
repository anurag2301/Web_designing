package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {
	private static final String USERNAME="PJ02DEV_T60";
	private static final String PASSWORD="tcstvm210";
	private static final String URL="jdbc:oracle:thin:@intvmoradb01:1521:ORAJAVADB";
	private static final String DRIVER_NAME="oracle.jdbc.driver.OracleDriver";
	//private static final String URL = "jdbc:mysql://intvmunix1/u179729";
	//private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	private static Connection conn=null;
	static{
		try{
			Class.forName(DRIVER_NAME);
			}
		catch(ClassNotFoundException cnfe){
			System.out.println("class not found");
			cnfe.printStackTrace();
			}
		}
	public static Connection getConnection(){
		try{
		conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
		}
		catch (Exception e) {
			System.out.println("connection not established...");
			e.printStackTrace();
		}
		return conn;
		}
   public static void closeConnection(Connection conn){
	   if(conn!=null){
		   try{
			   conn.close();
		   }catch (Exception e) {
			e.printStackTrace();
		}
	   }
   }

}
