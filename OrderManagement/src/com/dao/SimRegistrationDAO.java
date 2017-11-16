package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bean.sim.Sim;
import com.model.CheckSum;
import com.model.sim.AddSim;


public class SimRegistrationDAO {
Connection con;
 
public SimRegistrationDAO(){}

public boolean sqlCheckQuantityStatus(int orderId,int quantity){
	String sqlQuantity="SELECT QUANTITY FROM ORDERDETAILS WHERE OrderId="+orderId;
	String sqlMadeQuantity="SELECT COUNT(SIMID) FROM SIMDETAILS WHERE OrderId="+orderId;
	int orderQuantity=0;
	int madeQuantity=0;
	try{
		con = DBConnectionUtil.getConnection();
		PreparedStatement st1=con.prepareStatement(sqlQuantity);
		PreparedStatement st2=con.prepareStatement(sqlMadeQuantity);
		ResultSet rs1=st1.executeQuery(sqlQuantity);
		ResultSet rs2=st2.executeQuery(sqlMadeQuantity);
		if(rs1.next()){
			orderQuantity=Integer.parseInt(rs1.getString(1));
			System.out.println("2."+orderQuantity);
		}
		if(rs2.next()){
			madeQuantity=Integer.parseInt(rs2.getString(1));
			System.out.println("3."+madeQuantity);
		}
		}
	catch (Exception e)
		{
			e.printStackTrace();
		}
	finally{
		DBConnectionUtil.closeConnection(con);
	    }
	if(quantity<=(orderQuantity-madeQuantity)){
		return true;
	}
	return false;
}


public boolean sqlCheckOrderIdStatus(int orderId,int quantity){
	String sqlQuantity="SELECT QUANTITY FROM ORDERDETAILS WHERE OrderId="+orderId;
	try{
		con = DBConnectionUtil.getConnection();
		PreparedStatement st1=con.prepareStatement(sqlQuantity);
		ResultSet rs=st1.executeQuery(sqlQuantity);
		if(rs.next()){
			return true;
		}
		}
	catch (Exception e)
		{
			System.out.println("Error in order id check method");
			e.printStackTrace();
			//return false;
		}
	finally{
		DBConnectionUtil.closeConnection(con);
	    }
	return false;
}
public String enterDetails(int orderId,int quantity,int pin1,int pin2,int puk1,int puk2){
	//System.out.println("in dao"+pin2);
	Connection con=null;
	long initialIccid=0;
	int initialImsi=0;
	int simCount=getSimCount();
	AddSim addSim=new AddSim();
	Sim simObj=new Sim();
	String imsiPart1="";
	String[] imsiArray=new String[2];
	String[] icciIdArray=new String[2];
	int count=0;
	int imsiCount=0;
	String lastValue= "";
	
	String sqlImsi="SELECT COUNT(IMSINUMBER) FROM SIMDETAILS WHERE ORDERID="+orderId;
	String sqlIccidImsi="SELECT ICCIDNUMBER,IMSIRANGE FROM ORDERDETAILS WHERE OrderId="+orderId;
	CheckSum cs = new CheckSum();
	
	System.out.println("SQL is ::: "+sqlIccidImsi);
	try{
		con = DBConnectionUtil.getConnection();
		PreparedStatement st1=con.prepareStatement(sqlImsi);
		PreparedStatement st2=con.prepareStatement(sqlIccidImsi);
		ResultSet rs1=st1.executeQuery(sqlImsi);
		ResultSet rs2=st2.executeQuery(sqlIccidImsi);
		if(rs1.next()){
			imsiCount=Integer.parseInt(rs1.getString(1));
			System.out.println(imsiCount);
		}
		if(rs2.next()){
			icciIdArray=(rs2.getString(1)).split("-");
			initialIccid=Long.parseLong(icciIdArray[0]);
			imsiArray=(rs2.getString(2)).split("-");
			initialImsi = Integer.parseInt(imsiArray[0].substring(10,14));
			System.out.println("initial imsi "+initialImsi);
			imsiPart1 = imsiArray[0].substring(0,10);
			lastValue = imsiArray[0].substring(14);
		}
		while(count<quantity){
		if(imsiCount==0){
		simObj=addSim.addSimDetails(simCount+count+1,initialIccid+count,imsiPart1,count+initialImsi,lastValue,orderId,quantity,imsiPart1,pin1,pin2,puk1,puk2);
		//System.out.println("inner1"+pin2);
		}
		else{
			simObj=addSim.addSimDetails(simCount+count+1,initialIccid+imsiCount+count,imsiPart1,imsiCount+count+initialImsi,lastValue,orderId,quantity,imsiPart1,pin1,pin2,puk1,puk2);
			//System.out.println("inner2"+pin2);
		}
		
		String sql="Insert into SimDetails values("+simObj.getSimId()+","+cs.generateCheckSum(simObj.getICCID()+"")+",'"+simObj.getIMSI_No()+"',"+simObj.getPIN1()+","+simObj.getPIN2()+","+simObj.getPUK1()+","+simObj.getPUK2()+", DEFAULT ,"+simObj.getOrderId()+")";
		
		ImsiDAO imDao = new ImsiDAO();
		imDao.updateImsiStatus(simObj.getIMSI_No(), "ID");
		
		PreparedStatement st3=con.prepareStatement(sql);
		st3.executeUpdate(sql);
		count++;
		}
		}
	catch (Exception e)
		{
			e.printStackTrace();
		}
	finally{
		DBConnectionUtil.closeConnection(con);
	    }

	return "Successfully Entered";
	}

public Sim viewSimDetails(String searchBy,String searchValue, int id, int loginAs){
	System.out.println("dao"+searchValue);
	String sql;
	Sim sobj=new Sim();
	boolean status;
	if(searchBy.equals("SimId")){
		//int searchValueSim = Integer.parseInt(searchValue);
		sql="SELECT * FROM SIMDETAILS WHERE SimId="+searchValue;
		status = resultSql(searchBy,searchValue,id,loginAs);	 
	}
	else if(searchBy.equals("ICCID")){
		//int searchValueICCID= Integer.parseInt(searchValue);
		System.out.println("in iccid"+searchValue);
		sql="SELECT * FROM SIMDETAILS WHERE ICCID like '"+searchValue+"_'";
		status = resultSql(searchBy,searchValue,id,loginAs);	
	}
	else{
		sql="SELECT * FROM SIMDETAILS WHERE IMSINUMBER LIKE '"+searchValue+"%'";
		status = resultSql(searchBy,searchValue,id,loginAs);	
	}
	try{
		if(status){
			con = DBConnectionUtil.getConnection();
			Statement st=con.prepareStatement(sql);
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()){
				sobj.setSimId((Long.parseLong(rs.getString(1))));
				sobj.setICCID((Long.parseLong(rs.getString(2))));
				sobj.setIMSI_No(rs.getString(3));
				sobj.setPIN1((Integer.parseInt(rs.getString(4))));
				sobj.setPIN2((Integer.parseInt(rs.getString(5))));
				sobj.setPUK1((Integer.parseInt(rs.getString(6))));
				sobj.setPUK2((Integer.parseInt(rs.getString(7))));
				sobj.setManufactureDate(rs.getString(8));
				sobj.setOrderId((Integer.parseInt(rs.getString(9))));
			}
		}
	}
	catch (Exception e){
			e.printStackTrace();
	}
	finally{
		DBConnectionUtil.closeConnection(con);
	    }
	return sobj;
}	
public int getSimCount(){
	Connection con=null;
	String sql= "SELECT COUNT(SIMID) FROM SIMDETAILS";
	int count=0;
	try{
		con = DBConnectionUtil.getConnection();
		Statement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			count= rs.getInt(1);
		}
		}
	catch (Exception e)
		{
			e.printStackTrace();
		}
	finally{
		DBConnectionUtil.closeConnection(con);
	    }
	return count;
}

public boolean resultSql(String searchBy,String searchValue,int id,int loginAs){
		System.out.println("in result sql"+searchValue);
		int sqlOrderIdInt = 0;
		int sqlSpIdInt = 0;
		String sqlUserId="";
		String sqlOrderId="";
		if(searchBy.equals("SimId")){
			System.out.println("search by is sim");
			sqlOrderId="SELECT ORDERID FROM SIMDETAILS WHERE SIMID="+searchValue;
		}
		else if(searchBy.equals("ICCID")){
			System.out.println("search by is iccid");
			//sqlOrderId="SELECT ORDERID FROM SIMDETAILS WHERE ICCID="+searchValue;
			sqlOrderId="select ORDERID  from simdetails where iccid like '"+searchValue+"_'";
		}
		else{
			System.out.println("search by is imsi");
			sqlOrderId="SELECT ORDERID FROM SIMDETAILS WHERE IMSINUMBER LIKE '"+searchValue+"%'";
		}
	 	/*if(loginAs == 0){
	 		sqlUserId="SELECT SERVICEPROVIDERID FROM ORDERDETAILS WHERE ORDERID="+sqlOrderIdInt;
	 	}*/
	 	
	 		try{
	 			con = DBConnectionUtil.getConnection();
	 			Statement st1=con.prepareStatement(sqlOrderId);
	 			ResultSet rs1=st1.executeQuery(sqlOrderId);
	 			System.out.println("checking for orderId");
	 			if(rs1.next()){
	 				sqlOrderIdInt = Integer.parseInt(rs1.getString(1));
	 				System.out.println("orderId is "+sqlOrderIdInt);
	 			}
	 			System.out.println("value of login as "+loginAs);
	 			if(loginAs == 0){
	 		 		sqlUserId="SELECT SERVICEPROVIDERID FROM ORDERDETAILS WHERE ORDERID="+sqlOrderIdInt;
	 	
	 		 	}
	 			if(loginAs == 1){
	 		 		sqlUserId="SELECT MANUFACTURERID FROM ORDERDETAILS WHERE ORDERID="+sqlOrderIdInt;
	 		 		System.out.println("manufacturer"+sqlOrderIdInt);
	 		 	}
	 			Statement st2=con.prepareStatement(sqlUserId);
	 			ResultSet rs2=st2.executeQuery(sqlUserId);
	 			if(rs2.next()){
	 					sqlSpIdInt = Integer.parseInt(rs2.getString(1));
	 				}
	 			if(sqlSpIdInt == id) {
	 					return true;
	 			}
	 		}
	 		catch(Exception e){
	 			e.printStackTrace();
	 		}
	 		finally{
	 			DBConnectionUtil.closeConnection(con);
	 		}
	 		return false;
	 }

public int manufacturedQuantity(int orderId){
	Connection con=null;
	int sqlOrderIdInt;
	String sqlImsi="SELECT COUNT(IMSINUMBER) FROM SIMDETAILS WHERE ORDERID="+orderId;
	try{
			con = DBConnectionUtil.getConnection();
			Statement st1=con.prepareStatement(sqlImsi);
			ResultSet rs1=st1.executeQuery(sqlImsi);
			System.out.println("checking for orderId");
			if(rs1.next()){
				sqlOrderIdInt = Integer.parseInt(rs1.getString(1));
				return sqlOrderIdInt;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DBConnectionUtil.closeConnection(con);
		}
		return 0;
}


}


